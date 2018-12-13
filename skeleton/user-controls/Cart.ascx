<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Cart.ascx.vb" Inherits="user_controls_Cart" %>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
    InsertMethod="InsertItem" SelectMethod="Read" TypeName="StoredShoppingCart"
    UpdateMethod="Update">
    <UpdateParameters>
        <asp:Parameter Name="DeliveryCharge" Type="Decimal" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="MenuItemID" Type="Int32" />
        <asp:Parameter Name="ItemName" Type="String" />
        <asp:Parameter Name="ItemSize" Type="String" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="ItemPrice" Type="Decimal" />
    </InsertParameters>
</asp:ObjectDataSource>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
    DataSourceID="ObjectDataSource1">
    <Columns>
        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
        <asp:BoundField DataField="DeliveryCharge" HeaderText="DeliveryCharge" SortExpression="DeliveryCharge" />
        <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" />
        <asp:BoundField DataField="SalesTaxPercent" HeaderText="SalesTaxPercent" ReadOnly="True"
            SortExpression="SalesTaxPercent" />
        <asp:BoundField DataField="SalesTax" HeaderText="SalesTax" ReadOnly="True" SortExpression="SalesTax" />
    </Columns>
    <EmptyDataTemplate>
        You have not ordered any items yet.<br />
        Please visit the order pages to add items to the cart.
    </EmptyDataTemplate>
</asp:GridView>
