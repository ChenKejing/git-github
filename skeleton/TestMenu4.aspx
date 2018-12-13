<%@ Page Language="VB" AutoEventWireup="false" CodeFile="TestMenu4.aspx.vb" Inherits="TestMenu4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:D:\NETWORKSHOP\PIZZA_PRETTY_QUICK\SKELETON\APP_DATA\PPQ_DATA.MDFConnectionString2 %>"
            SelectCommand="SELECT [MenuItemID], [MenuItemType], [ItemName] FROM [MenuItems]" DataSourceMode="DataReader">
        </asp:SqlDataSource>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333"
            GridLines="None" Style="position: relative">
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <Columns>
                <asp:BoundField DataField="MenuItemID" HeaderText="MenuItemID" InsertVisible="False"
                    ReadOnly="True" SortExpression="MenuItemID" />
                <asp:BoundField DataField="MenuItemType" HeaderText="MenuItemType" SortExpression="MenuItemType" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:TemplateField HeaderText="Size and Price">
                    <ItemTemplate>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:D:\NETWORKSHOP\PIZZA_PRETTY_QUICK\SKELETON\APP_DATA\PPQ_DATA.MDFConnectionString %>"
                            SelectCommand="SELECT [ItemSize], [ItemPrice] FROM [SizeAndPrice] WHERE ([fkMenuItemID] = @fkMenuItemID)">
                            <SelectParameters>
                                <asp:Parameter Name="fkMenuItemID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2">
                        </asp:Repeater>
                    </ItemTemplate>
                </asp:TemplateField>
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
