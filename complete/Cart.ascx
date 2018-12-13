<%@ Control Language="VB" AutoEventWireup="false" CodeFile="Cart.ascx.vb" Inherits="Cart" %>
<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="DeleteItem"
    InsertMethod="InsertItem" SelectMethod="ReadItems" TypeName="StoredShoppingCart"
    UpdateMethod="UpdateItem">
    <DeleteParameters>
        <asp:Parameter Name="MenuItemID" Type="Int32" />
        <asp:Parameter Name="ItemSize" Type="String" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="MenuItemID" Type="Int32" />
        <asp:Parameter Name="ItemSize" Type="String" />
        <asp:Parameter Name="Quantity" Type="Int32" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="MenuItemID" Type="Int32" />
        <asp:Parameter Name="ItemName" Type="String" />
        <asp:Parameter Name="ItemSize" Type="String" />
        <asp:Parameter Name="Quantity" Type="Int32" />
        <asp:Parameter Name="ItemPrice" Type="Decimal" />
    </InsertParameters>
</asp:ObjectDataSource>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MenuItemID,ItemSize"
    DataSourceID="ObjectDataSource1">
    <Columns>
        <asp:BoundField DataField="ItemName" HeaderText="ItemName" ReadOnly="True" SortExpression="ItemName" />
        <asp:BoundField DataField="MenuItemID" HeaderText="MenuItemID" SortExpression="MenuItemID"
            Visible="False" />
        <asp:BoundField DataField="ItemSize" HeaderText="ItemSize" ReadOnly="True" SortExpression="ItemSize" />
        <asp:BoundField DataField="ItemPrice" DataFormatString="{0:c}" HeaderText="ItemPrice"
            ReadOnly="True" SortExpression="ItemPrice" />
        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
        <asp:BoundField DataField="LineValue" DataFormatString="{0:C}" HeaderText="LineValue"
            ReadOnly="True" SortExpression="LineValue" />
        <asp:CommandField InsertVisible="False" ShowDeleteButton="True" ShowEditButton="True" />
    </Columns>
    <EmptyDataTemplate>
        You have not ordered any items yet.<br />
        Please visit the order pages to add items to the cart.
    </EmptyDataTemplate>
</asp:GridView>
