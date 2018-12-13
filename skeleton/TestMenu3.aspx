 <%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
            SelectCommand="SELECT [MenuItemsID], [MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName], [ItemSize], [ItemPrice] FROM [AllMenuData] ORDER BY [MenuItemType] DESC, [ItemName], [ItemPrice]">
        </asp:SqlDataSource>
        &nbsp;
        <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" CellPadding="4"
            DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Height="124px"
            Style="position: relative" Width="372px">
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <CommandRowStyle BackColor="#E2DED6" Font-Bold="True" />
            <EditRowStyle BackColor="#999999" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <FieldHeaderStyle BackColor="#E9ECF1" Font-Bold="True" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        </asp:DetailsView>
        <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="#DEBA84"
            BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2"
            DataSourceID="SqlDataSource1" GridLines="Both" Height="209px" Width="294px" >
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <ItemTemplate>
                MenuItemID:
                <asp:Label ID="Label1" runat="server" Style="position: relative" Text='<%# Eval("MenuItemsID") %>'></asp:Label>
                <br />
                MenuItemType:<asp:Label ID="Label2" runat="server" Style="position: relative" Text='<%# Eval("MenuItemType") %>'></asp:Label><br />
                ItemName:<asp:Label ID="Label3" runat="server" Style="position: relative" Text='<%# Eval("ItemName") %>'></asp:Label><br />
                PizzaToppings:<asp:Label ID="Label4" runat="server" Style="position: relative" Text='<%# Eval("PizzaToppings") %>'></asp:Label><br />
                GraphicFileName:<asp:Label ID="Label5" runat="server" Style="position: relative"
                    Text='<%# Eval("GraphicFileName") %>'></asp:Label><br />
                Description:<asp:Label ID="Label6" runat="server" Style="position: relative" Text='<%# Eval("Description") %>'></asp:Label><br />
                ItemSize:<asp:Label ID="Label7" runat="server" Style="position: relative" Text='<%# Eval("ItemSize") %>'></asp:Label><br />
                ItemPrice:<asp:Label ID="Label8" runat="server" Style="position: relative" Text='<%# Eval("ItemPrice") %>'></asp:Label>
            </ItemTemplate>
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
        </asp:FormView>
        &nbsp;
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Style="position: relative">
            <ItemTemplate>
                MenuItemID:
                <asp:Label ID="Label1" runat="server" Style="position: relative" Text='<%# Eval("MenuItemsID") %>'></asp:Label>
                <br />
                MenuItemType:<asp:Label ID="Label2" runat="server" Style="position: relative" Text='<%# Eval("MenuItemType") %>'></asp:Label><br />
                ItemName:<asp:Label ID="Label3" runat="server" Style="position: relative" Text='<%# Eval("ItemName") %>'></asp:Label><br />
                PizzaToppings:<asp:Label ID="Label4" runat="server" Style="position: relative" Text='<%# Eval("PizzaToppings") %>'></asp:Label><br />
                GraphicFileName:<asp:Label ID="Label5" runat="server" Style="position: relative"
                    Text='<%# Eval("GraphicFileName") %>'></asp:Label><br />
                Description:<asp:Label ID="Label6" runat="server" Style="position: relative" Text='<%# Eval("Description") %>'></asp:Label><br />
                ItemSize:<asp:Label ID="Label7" runat="server" Style="position: relative" Text='<%# Eval("ItemSize") %>'></asp:Label><br />
                ItemPrice:<asp:Label ID="Label8" runat="server" Style="position: relative" Text='<%# Eval("ItemPrice") %>'></asp:Label>
            </ItemTemplate>
        </asp:DataList>
    </form>
</body>
</html>
