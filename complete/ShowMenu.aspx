<%@ Page Language="VB" MasterPageFile="~/PPQ.master" Title="Untitled Page" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>

<script runat="server">

	Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs)

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
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:DataList ID="DataList1" runat="server">
		<FooterStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
			Font-Underline="False" HorizontalAlign="Center" />
		<ItemStyle BackColor="White" Font-Bold="False" Font-Italic="False" Font-Overline="False"
			Font-Strikeout="False" Font-Underline="False" ForeColor="#284775" />
		<SeparatorStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False"
			Font-Underline="False" HorizontalAlign="Center" />
		<HeaderTemplate>
			Our Stone-Baked Menu<br />
			<asp:Image ID="Image1" runat="server" GenerateEmptyAlternateText="True" ImageUrl="~/images/menu-spacer.gif" />
		</HeaderTemplate>
		<HeaderStyle BackColor="White" Font-Bold="True" Font-Italic="False" Font-Names="Comic Sans MS"
			Font-Overline="False" Font-Size="XX-Large" Font-Strikeout="False" Font-Underline="False"
			ForeColor="SlateGray" HorizontalAlign="Center" />
		<SeparatorTemplate>
			<asp:Image ID="Image3" runat="server" GenerateEmptyAlternateText="True" ImageUrl="~/images/menu-spacer.gif" />
		</SeparatorTemplate>
		<ItemTemplate>
		  <asp:Image ID="Image4" runat="server" ImageAlign="Left" style="margin: 5px 10px 5px 0px"
           ImageUrl='<%# Eval("GraphicFileName", "images/{0}") %>' AlternateText='<%# Eval("ItemName") %>' />
      <asp:Label ID="Label2" runat="server" Text='<%# Eval("MenuItemType") %>' Font-Bold="True" Font-Size="1.2em" /> -
      <asp:Label ID="Label3" runat="server" Text='<%# Eval("ItemName") %>' Font-Bold="True" Font-Size="1.2em" /><br />
      <asp:Label ID="Label4" runat="server" Text='<%# Eval("PizzaToppings", "Generously topped with {0}.") %>' />
      <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>' />.<br />
      <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# CType(Container.DataItem, DataRowView).CreateChildView("MenuLink") %>'>
        <ItemTemplate>
          <span style="color: Firebrick">
            <%# Eval("ItemSize") %>: <%#Eval("ItemPrice", "${0:F2}")%> &nbsp;</span>
        </ItemTemplate>
      </asp:Repeater>
		</ItemTemplate>
		<FooterTemplate>
			<asp:Image ID="Image2" runat="server" GenerateEmptyAlternateText="True" ImageUrl="~/images/menu-spacer.gif" />
		</FooterTemplate>
	</asp:DataList>
	<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
</asp:Content>

