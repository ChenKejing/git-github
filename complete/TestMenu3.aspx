<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TestMenu3.aspx.vb" Inherits="TestMenu3" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
  <form id="form1" runat="server">
  <div>
		<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString %>"
			SelectCommand="SELECT [MenuItemType], [MenuItemID], [ItemName] FROM [MenuItems]">
		</asp:SqlDataSource>
  
  </div>
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
		BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3"
		DataSourceID="SqlDataSource1" GridLines="Horizontal">
		<FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
		<Columns>
            <asp:BoundField DataField="MenuItemType" HeaderText="MenuItemType" SortExpression="MenuItemType" />
            <asp:BoundField DataField="MenuItemID" HeaderText="MenuItemID" InsertVisible="False"
                ReadOnly="True" SortExpression="MenuItemID" />
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
            <asp:TemplateField HeaderText="sIZE AND pRICE"></asp:TemplateField>
		</Columns>
		<RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
		<SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
		<PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
		<HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
		<AlternatingRowStyle BackColor="#F7F7F7" />
	</asp:GridView>
  </form>
</body>
</html>
