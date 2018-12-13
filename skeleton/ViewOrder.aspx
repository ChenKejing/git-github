<%@ Page Language="VB" MasterPageFile="~/PPQMasterPage.master" AutoEventWireup="false" CodeFile="ViewOrder.aspx.vb" Inherits="ViewOrder" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataKeyNames="OrdersID" DataSourceID="SqlDataSource1" EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="OrdersID" HeaderText="OrdersID" ReadOnly="True" SortExpression="OrdersID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
            <asp:BoundField DataField="OrderDate" HeaderText="OrderDate" SortExpression="OrderDate" />
            <asp:BoundField DataField="DeliveryCharge" HeaderText="DeliveryCharge" SortExpression="DeliveryCharge" />
            <asp:BoundField DataField="TotalValue" HeaderText="TotalValue" SortExpression="TotalValue" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
        DeleteCommand="DELETE FROM [Orders] WHERE [OrdersID] = @OrdersID" InsertCommand="INSERT INTO [Orders] ([Name], [Address], [ZipCode], [OrderDate], [DeliveryCharge], [TotalValue]) VALUES (@Name, @Address, @ZipCode, @OrderDate, @DeliveryCharge, @TotalValue)"
        ProviderName="<%$ ConnectionStrings:PPQ_DataConnectionString1.ProviderName %>"
        SelectCommand="SELECT [OrdersID], [Name], [Address], [ZipCode], [OrderDate], [DeliveryCharge], [TotalValue] FROM [Orders]"
        UpdateCommand="UPDATE [Orders] SET [Name] = @Name, [Address] = @Address, [ZipCode] = @ZipCode, [OrderDate] = @OrderDate, [DeliveryCharge] = @DeliveryCharge, [TotalValue] = @TotalValue WHERE [OrdersID] = @OrdersID">
        <InsertParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="DeliveryCharge" Type="Decimal" />
            <asp:Parameter Name="TotalValue" Type="Decimal" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Name" Type="String" />
            <asp:Parameter Name="Address" Type="String" />
            <asp:Parameter Name="ZipCode" Type="String" />
            <asp:Parameter Name="OrderDate" Type="DateTime" />
            <asp:Parameter Name="DeliveryCharge" Type="Decimal" />
            <asp:Parameter Name="TotalValue" Type="Decimal" />
            <asp:Parameter Name="OrdersID" Type="Int32" />
        </UpdateParameters>
        <DeleteParameters>
            <asp:Parameter Name="OrdersID" Type="Int32" />
        </DeleteParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
        DataKeyNames="fkOrdersID,fkMenuItemID,ItemSize" DataSourceID="SqlDataSource2"
        EmptyDataText="There are no data records to display.">
        <Columns>
            <asp:BoundField DataField="fkOrdersID" HeaderText="fkOrdersID" ReadOnly="True" SortExpression="fkOrdersID" />
            <asp:BoundField DataField="fkMenuItemID" HeaderText="fkMenuItemID" ReadOnly="True"
                SortExpression="fkMenuItemID" />
            <asp:BoundField DataField="ItemSize" HeaderText="ItemSize" SortExpression="ItemSize" />
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="LineValue" HeaderText="LineValue" SortExpression="LineValue" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
        DeleteCommand="DELETE FROM [OrderItems] WHERE [fkOrdersID] = @fkOrdersID AND [fkMenuItemID] = @fkMenuItemID AND [ItemSize] = @ItemSize"
        InsertCommand="INSERT INTO [OrderItems] ([fkOrdersID], [fkMenuItemID], [ItemSize], [ItemName], [Quantity], [LineValue]) VALUES (@fkOrdersID, @fkMenuItemID, @ItemSize, @ItemName, @Quantity, @LineValue)"
        ProviderName="<%$ ConnectionStrings:PPQ_DataConnectionString1.ProviderName %>"
        SelectCommand="SELECT [fkOrdersID], [fkMenuItemID], [ItemSize], [ItemName], [Quantity], [LineValue] FROM [OrderItems] WHERE ([fkOrdersID] = @fkOrdersID)"
        UpdateCommand="UPDATE [OrderItems] SET [ItemName] = @ItemName, [Quantity] = @Quantity, [LineValue] = @LineValue WHERE [fkOrdersID] = @fkOrdersID AND [fkMenuItemID] = @fkMenuItemID AND [ItemSize] = @ItemSize">
        <DeleteParameters>
            <asp:Parameter Name="fkOrdersID" Type="Int32" />
            <asp:Parameter Name="fkMenuItemID" Type="Int32" />
            <asp:Parameter Name="ItemSize" Type="String" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="LineValue" Type="Decimal" />
            <asp:Parameter Name="fkOrdersID" Type="Int32" />
            <asp:Parameter Name="fkMenuItemID" Type="Int32" />
            <asp:Parameter Name="ItemSize" Type="String" />
        </UpdateParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="fkOrdersID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
        <InsertParameters>
            <asp:Parameter Name="fkOrdersID" Type="Int32" />
            <asp:Parameter Name="fkMenuItemID" Type="Int32" />
            <asp:Parameter Name="ItemSize" Type="String" />
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="Quantity" Type="Int32" />
            <asp:Parameter Name="LineValue" Type="Decimal" />
        </InsertParameters>
    </asp:SqlDataSource>
</asp:Content>

