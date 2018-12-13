Imports System.Data
Imports System.Data.SqlClient
Partial Class Checkout
    Inherits System.Web.UI.Page

    Protected Sub DropDownList1_SelectedIndexChanged1(ByVal sender As Object, ByVal e As System.EventArgs)
        FormView1.UpdateItem(False)
    End Sub

    Protected Sub ObjectDataSource1_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles ObjectDataSource1.Updating
        Dim ddl As DropDownList = _
        DirectCast(FormView1.FindControl("DropDownList1"), DropDownList)
        e.InputParameters.Add("DeliveryCharge", ddl.SelectedValue)
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged

    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        Dim rbl As RadioButtonList = DirectCast(sender, RadioButtonList)
        Dim ccp As Panel = DirectCast(Wizard1.FindControl("CreditCardPayment"), Panel)
        If rbl.SelectedValue = "CC" Then
            ccp.Visible = True
        Else
            ccp.Visible = False
        End If
    End Sub

    Protected Sub Wizard1_FinishButtonClick(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.WizardNavigationEventArgs) Handles Wizard1.FinishButtonClick
        Dim conn As SqlConnection = Nothing
        Dim trans As SqlTransaction = Nothing
        Dim cmd As SqlCommand
        Dim cart As ShoppingCart = StoredShoppingCart.Read()

        If cart Is Nothing OrElse cart.Items.Count = 0 Then
            e.Cancel = True
            Return
        End If

        Try

            Dim OrderID As Integer
            conn = New SqlConnection(ConfigurationManager.ConnectionStrings("PPQ_DataConnectionString1").ConnectionString)
            conn.Open()
            trans = conn.BeginTransaction

            cmd = New SqlCommand()
            cmd.Connection = conn
            cmd.Transaction = trans
            cmd.CommandText = "usp_InsertOrder"
            cmd.CommandType = CommandType.StoredProcedure
            cmd.Parameters.Add("@Name", Data.SqlDbType.VarChar, 25)
            cmd.Parameters.Add("@Address", Data.SqlDbType.VarChar, 255)
            cmd.Parameters.Add("@ZipCode", Data.SqlDbType.VarChar, 15)
            cmd.Parameters.Add("@OrderDate", Data.SqlDbType.DateTime)
            cmd.Parameters.Add("@DeliveryCharge", Data.SqlDbType.Money)
            cmd.Parameters.Add("@TotalValue", Data.SqlDbType.Money)
            cmd.Parameters.Add("@OrderID", SqlDbType.Int)
            cmd.Parameters("@OrderID").Direction = ParameterDirection.Output

            cmd.Parameters("@Name").Value = _
            CType(Wizard1.FindControl("txtName"), TextBox).Text
            cmd.Parameters("@Address").Value = _
            CType(Wizard1.FindControl("txtAddress"), TextBox).Text
            cmd.Parameters("@ZipCode").Value = _
            CType(Wizard1.FindControl("txtZipCode"), TextBox).Text

            cmd.Parameters("@OrderDate").Value = DateTime.Now()
            cmd.Parameters("@DeliveryCharge").Value = cart.DeliveryCharge
            cmd.Parameters("@TotalValue").Value = cart.Total

            cmd.ExecuteNonQuery()

            OrderID = Convert.ToInt32(cmd.Parameters("@OrderID").Value)
            cmd.CommandText = "usp_InsertOrderItem"
            cmd.Parameters.Clear()

            cmd.Parameters.Add("@fkOrderID", Data.SqlDbType.Int)
            cmd.Parameters.Add("@MenuItemID", Data.SqlDbType.Int)
            cmd.Parameters.Add("@ItemSize", Data.SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@ItemName", Data.SqlDbType.VarChar, 50)
            cmd.Parameters.Add("@Quantity", Data.SqlDbType.Int)
            cmd.Parameters.Add("@LineValue", Data.SqlDbType.Money)

            cmd.Parameters("@fkOrderID").Value = OrderID

            For Each item As CartItem In cart.Items

                cmd.Parameters("@MenuItemID").Value = item.MenuItemID
                cmd.Parameters("@ItemSize").Value = item.ItemSize
                cmd.Parameters("@ItemName").Value = item.ItemName
                cmd.Parameters("@Quantity").Value = item.Quantity
                cmd.Parameters("@LineValue").Value = item.LineValue

                cmd.ExecuteNonQuery()

            Next

            trans.Commit()
            CreateOrderSuccessLabel.Visible = True


        Catch SqlEx As SqlException

            If trans IsNot Nothing Then
                trans.Rollback()
            End If

            CreateOrderErrorLabel.Visible = True
            Return

        Finally
            If conn IsNot Nothing Then
                conn.Close()
            End If
        End Try

        cart.Items.Clear()

    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If User.Identity.IsAuthenticated Then
                Dim rbl As RadioButtonList = _
                DirectCast(Wizard1.FindControl("RadioButtonList1"), RadioButtonList)
                rbl.Items.Add(New ListItem("Charge my account", "Account"))
            End If
        End If
    End Sub
End Class
