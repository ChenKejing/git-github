Imports System.Data
Imports System.data.SqlClient

Partial Class Order
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        ' declare a DataSet to hold the rows from the database
        Dim ds As New DataSet()

        ' specify the two SQL statements to select the rows, first one for the columns
        ' required from the MenuItem table, including a WHERE clause for MenuItemType
        Dim sGetMenuItems As String = "SELECT MenuItemID, MenuItemType, ItemName, PizzaToppings, " _
          & "Description, GraphicFileName FROM MenuItems " _
          & "WHERE MenuItemType LIKE @MenuItemType " _
          & "ORDER BY MenuItemType DESC, ItemName"
        ' second SQL statement gets the columns required from the SizeAndPrice table, but
        ' need to limit the rows to those specified by the MenuItemType value passed to
        ' this page. This column is not in the SizeAndPrice table, so have to join it to
        ' the MenuItems table to be able to select on the MenuItemType column in that table
        Dim sGetSizesAndPrices As String = "SELECT fkMenuItemID, ItemSize, ItemPrice " _
          & "FROM SizeAndPrice JOIN MenuItems ON MenuItems.MenuItemID = SizeAndPrice.fkMenuItemID " _
          & "WHERE MenuItemType LIKE @MenuItemType " _
          & "ORDER BY ItemPrice"

        ' get conection string from Web.config file
        Dim sConnect As String = ConfigurationManager.ConnectionStrings("PPQ_DataConnectionString1").ConnectionString

        ' create a connection to the database using the connection string
        ' the Using statement ensures that the connection is closed and
        ' disposed automatically after use
        Using con As New SqlConnection(sConnect)

            ' create a SqlDataAdapter using the SqlConnection object
            ' and the first SQL SELECT statement declared earlier
            Dim da As New SqlDataAdapter(sGetMenuItems, con)

            ' create a SqlParameter to hold the type of menu items to show
            Dim param As New SqlParameter("@MenuItemType", SqlDbType.VarChar, 10)

            ' get the item type specified when the page was opened from the query string
            ' it will force the SelectCommand to select only the required rows, or all
            ' of the rows if there is no value in the query string (% means match anything)
            param.Value = Request.QueryString("type") & "%"

            ' add the parameter to the SelectCommand used by the SqlDataAdapter
            da.SelectCommand.Parameters.Add(param)

            Try

                ' fetch the MenuItems rows into the DataSet as a new table
                da.Fill(ds, "MenuItems")

                ' change the SQL statement in the SelectCommand of the
                ' SqlDataAdapter to the one that selects the SizeAndPrice rows
                da.SelectCommand.CommandText = sGetSizesAndPrices

                ' fetch the SizeAndPrice rows into the DataSet as another new table
                da.Fill(ds, "SizeAndPrice")

            Catch ex As Exception

                ' if there is an error, display the message and stop execution here
                Label1.Text = "ERROR: " & ex.Message
                Exit Sub

            End Try

        End Using

        ' create a relationship between the two tables in the DataSet
        ' first get references to the primary key in the MenuItems table
        ' and the foreign key in the SizeAndPrice table
        Dim pkcol As DataColumn = ds.Tables("MenuItems").Columns("MenuItemID")
        Dim fkcol As DataColumn = ds.Tables("SizeAndPrice").Columns("fkMenuItemID")

        ' now create the relationship within the DataSet
        Dim dr As New DataRelation("MenuLink", pkcol, fkcol)

        ' add this relationship to the Relations collection of the DataSet
        ds.Relations.Add(dr)

        ' bind the MenuItems table to the DataList control to display the rows
        DataList1.DataSource = ds
        DataList1.DataMember = "MenuItems"
        DataList1.DataBind()

    End Sub

    Protected Sub DataList1_ItemDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DataListItemEventArgs) Handles DataList1.ItemDataBound

        If e.Item.ItemType = ListItemType.Item OrElse _
            e.Item.ItemType = ListItemType.AlternatingItem Then

            ' Find the Repeater within the ItemTemplate
            Dim rpt As Repeater = DirectCast(e.Item.FindControl("Repeater1"), Repeater)

            ' Create two new HiddenField objects
            ' These will be used to store the Id and Name of the item
            ' We use hidden fields so that they aren't visible to the user
            Dim ItemID As HiddenField = New HiddenField
            Dim ItemName As HiddenField = New HiddenField

            ' Set the IDs of the new hidden fields - every field has to have an ID
            ItemID.ID = "ItemID"
            ItemName.ID = "ItemName"

            ' Set the values of the hidden fields.
            ' The value is taken from the underlying data - the DataItem, which is the row of data current being data bound
            ItemID.Value = e.Item.DataItem("MenuItemID")
            ItemName.Value = e.Item.DataItem("ItemName")

            ' Add the new controls to the repeater
            rpt.Controls.Add(ItemID)
            rpt.Controls.Add(ItemName)
        End If

    End Sub

    Protected Sub Repeater1_ItemCommand(ByVal source As Object, ByVal e As System.Web.UI.WebControls.RepeaterCommandEventArgs)

        ' parameters:
        ' source represents the object that raised the event - in this case the Repeater.
        ' e.Item represents the RepeaterItem - the item within which the button was clicked, and has a number of 
        ' properties or methods that help us:
        '   CommandName - the CommandName property on the button that caused the event to be raised
        '   CommandArgument - the CommandArgument property on the button that caused the event to be raised

        ' The source argument is an Object type, so we need to convert it to a Repeater
        Dim rpt As Repeater = DirectCast(source, Repeater)

        ' Find the hidden controls we added in the ItemDataBound event of the DataList (see below)
        ' These contain the ID and Name of the item (pizza or drink) 
        Dim IDControl As HiddenField = _
            DirectCast(rpt.FindControl("ItemID"), HiddenField)
        Dim NameControl As HiddenField = _
            DirectCast(rpt.FindControl("ItemName"), HiddenField)
        Dim ItemID As Integer = Convert.ToInt32(IDControl.Value)
        Dim ItemName As String = NameControl.Value

        ' Get the size and cost of the item being selected
        ' These are set by data binding in the ASP.NET page,
        ' set to the CommandName and CommandArgument of the button
        Dim ItemSize As String = e.CommandName.ToString()
        Dim ItemPrice As Decimal = Convert.ToDecimal(e.CommandArgument)

        ' add the item to our shopping cart
        StoredShoppingCart.InsertItem(ItemID, ItemName, ItemSize, 1, ItemPrice)

        Label1.Text = String.Format("{0} ({1}) added to the shopping cart", _
            ItemName, ItemSize)

    End Sub
End Class
