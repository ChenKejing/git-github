<%@ Page Language="C#" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script runat="server">

</script>

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;</div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
            SelectCommand="SELECT [MenuItemsID], [MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName], [ItemSize], [ItemPrice] FROM [AllMenuData] ORDER BY [MenuItemType] DESC, [ItemName], [ItemPrice]">
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"
            AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Style="position: relative">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:ImageField AccessibleHeaderText="Picture of item" DataAlternateTextField="GraphicFileName"
                    DataImageUrlField="GraphicFileName" DataImageUrlFormatString="images/{0}" NullImageUrl="~/Images/4cc6ae8902000x1c.jpeg"
                    ShowHeader="False">
                    <ItemStyle Height="20px" Width="20px" />
                </asp:ImageField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        &nbsp;
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("ItemName") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("PizzaToppings", "generously topped with {0}") %>'></asp:Label>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Description") %>'   ></asp:Label><br />
                        &nbsp;Choose a&nbsp;&nbsp; &nbsp;<asp:Label ID="Label4" runat="server"   Text='<%# Eval("ItemSize") %>'  ></asp:Label>
                        &nbsp;&nbsp;size for only
                        <asp:Label ID="Label5" runat="server"   Text='<%# Eval("ItemPrice", "$ {0:F2}") %>' ></asp:Label><br />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="MenuItemType,ItemName" DataNavigateUrlFormatString="www.google.com/search?q={0} {1}"
                    DataTextField="Description" DataTextFormatString="images/{0}" Target="_search"
                    Text="Search" />
                <asp:ImageField NullImageUrl="~/Images/4cc6ae8902000x1c.jpeg">
                </asp:ImageField>
            </Columns>
            <RowStyle BackColor="#E3EAEB" />
            <EditRowStyle BackColor="#7C6F57" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
    </form>
</body>
</html>
