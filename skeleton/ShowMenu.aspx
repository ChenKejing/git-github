<%@ Page Language="VB" MasterPageFile="~/PPQMasterPage.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)
      
        ' declare a DataSet to hold the rows from the database
       
        Dim ds As New DataSet()
       
        ' specify the two SQL statements to select the rows, first one for the columns
        ' required from the MenuItem table, including a WHERE clause for MenuItemType
       
        Dim sGetMenuItems As String = "SELECT MenuItemsID, MenuItemType, ItemName, " _
        & "PizzaToppings, Description, GraphicFileName FROM MenuItems " _
        & "WHERE MenuItemType LIKE @MenuItemType " _
        & "ORDER BY MenuItemType DESC, ItemName"
       
        
        ' second SQL statement gets the columns required from the SizeAndPrice table, but
        ' need to limit the rows to those specified by the MenuItemType value passed to
        ' this page. This column is not in the SizeAndPrice table, so have to join it to
        ' the MenuItems table to be able to select on the MenuItemType column in that table
       
        Dim sGetSizesAndPrices As String = "SELECT fkMenuItemID, ItemSize, ItemPrice " _
        & "FROM SizeAndPrice JOIN MenuItems " _
        & "ON MenuItems.MenuItemsID = SizeAndPrice.fkMenuItemID " _
        & "WHERE MenuItemType LIKE @MenuItemType " _
        & "ORDER BY ItemPrice"
        
        ' get conection string from Web.config file
        Dim sConnect As String = ConfigurationManager.ConnectionStrings( _
        "PPQ_DataConnectionString1").ConnectionString
        
        ' create a connection to the database using the connection string
        ' the Using statement ensures that the connection is closed and
        ' disposed automatically after use
        Using con As New SqlConnection(sConnect)
            
        
            ' create a SqlDataAdapter using the SqlConnection object
            ' and the first SQL SELECT statement declared earlier
            Dim da As New SqlDataAdapter(sGetMenuItems, con)
        
        
        
            ' create a SqlParameter to hold the type of menu items to show
            Dim param As New SqlParameter("@MenuItemType", SqlDbType.VarChar, 25)
        
            ' get the item type specified when the page was opened from the query string
            ' it will force the SelectCommand to select only the required rows, or all
            ' of the rows if there is no value in the query string (% means match anything)
            param.Value = Request.QueryString("type") & "%"
        
            ' add the parameter to the SelectCommand used by the SqlDataAdapter
            da.SelectCommand.Parameters.Add(param)
            
            Try
                con.Open()
                ' fetch the MenuItems rows into the DataSet as a new table
                da.Fill(ds, "MenuItems")
                
       
                ' change the SQL statement in the SelectCommand of the
                ' SqlDataAdapter to the one that selects the SizeAndPrice rows
                da.SelectCommand.CommandText = sGetSizesAndPrices
                ' fetch the SizeAndPrice rows into the DataSet as another new table
                da.Fill(ds, "SizeAndPrice")
            Catch ex As Exception
                ' if there is an error, display the message and stop execution here
                Label5.Text = "ERROR: " & ex.Message
                Exit Sub
            Finally
                con.Close()
            End Try
        
        End Using
        
        ' create a relationship between the two tables in the DataSet
        ' first get references to the primary key in the MenuItems table
        ' and the foreign key in the SizeAndPrice table
        
        Dim pkcol As DataColumn = ds.Tables("MenuItems").Columns("MenuItemsID")
        Dim fkcol As DataColumn = ds.Tables("SizeAndPrice").Columns("fkMenuItemID")
        '' now create the relationship within the DataSet
        Dim dr As New DataRelation("MenuLink", pkcol, fkcol)
        '' add this relationship to the Relations collection of the DataSet
        ds.Relations.Add(dr)

        '' bind the MenuItems table to the DataList control to display the rows
        DataList1.DataSource = ds
        DataList1.DataMember = "MenuItems"
        DataList1.DataBind()
        
        
    End Sub
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
        SelectCommand="SELECT [MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName] FROM [MenuItems] ORDER BY MenuItemType DESC, ItemName">  
    </asp:SqlDataSource>
    <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Height="503px" Width="458px">
        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Center" />
        <ItemTemplate>
            <asp:Image ID="Image1" runat="server" AlternateText='<%# Eval("GraphicFileName") %>'
                Height="42px" ImageUrl='<%# Eval("GraphicFileName","images/{0}") %>' Width="40px" />
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("MenuItemType") %>' style="left: 0px; position: relative; top: -22px" ></asp:Label>  &nbsp;
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Eval("ItemName") %>' style="left: -4px; position: relative; top: -22px" ></asp:Label> 
            <br />
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("PizzaToppings") %>' style="left: 45px; position: relative; top: -12px" ></asp:Label>
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("Description") %>' style="left: 45px; position: relative; top: -12px" ></asp:Label><br />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
                SelectCommand="SELECT [fkMenuItemID], [ItemSize], [ItemPrice] FROM [SizeAndPrice] JOIN MenuItems ON MenuItems.MenuItemsID = SizeAndPrice.fkMenuItemID "> 
            </asp:SqlDataSource>                            
            <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# CType(Container.DataItem,DataRowView).CreateChildView(¡°MenuLink¡±) %>'>
                <ItemTemplate>
                    <span style="color:Green">
                    <asp:LinkButton ID="OrderItem" runat="server" ToolTip="Add item to order"
                        style="text-decoration:none;"
                        CommandName='<%# Eval("ItemSize") %>'
                        CommandArgument='<%# Eval("ItemPrice") %>'>
                        <asp:Image ID="Image1" runat="server" ImageUrl="Images/cartIcon.jpg"
                                AlternateText="Add item to order button" />
                             <%# Eval("ItemSize") %>: <%#Eval("ItemPrice", "${0:F2}")%> &nbsp;
                    </asp:LinkButton>
                    </span>   
                </ItemTemplate>
            </asp:Repeater>                                  
        </ItemTemplate>
        <AlternatingItemStyle BackColor="White" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
        <ItemStyle BackColor="#FFFBD6" ForeColor="#333333" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" HorizontalAlign="Left" />
        <SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
            Font-Underline="False" HorizontalAlign="Center" />
        <HeaderTemplate>
            Our Stone Baked Menu<br />
            <asp:Image ID="Image2" runat="server" GenerateEmptyAlternateText="True" ImageUrl="~/Images/dubai.jpg" Height="60px" Width="445px" />
        </HeaderTemplate>
        <HeaderStyle BackColor="#990000" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="X-Large"
            ForeColor="White" HorizontalAlign="Center" />
        <EditItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
            Font-Underline="False" HorizontalAlign="Left" />
    </asp:DataList>
    <asp:Label ID="Label5" runat="server"></asp:Label>
</asp:Content>

