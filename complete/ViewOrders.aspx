<%@ Page Language="VB" MasterPageFile="~/PPQ.master" AutoEventWireup="false" CodeFile="ViewOrders.aspx.vb" Inherits="ViewOrders" title="View Orders" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1"
        EmptyDataText="There are no data records to display." DataKeyNames="OrderID" CellPadding="4" ForeColor="#333333" GridLines="None"> 
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="OrderDate" HeaderText="Order Date" SortExpression="OrderDate" />
            <asp:BoundField DataField="DeliveryCharge" DataFormatString="{0:d}" HeaderText="Delivery Charge"
                SortExpression="DeliveryCharge">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="TotalValue" DataFormatString="{0:d}" HeaderText="Total Value"
                SortExpression="TotalValue">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <EditRowStyle BackColor="#7C6F57" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
        ProviderName="<%$ ConnectionStrings:PPQ_DataConnectionString1.ProviderName %>"
        SelectCommand="SELECT [OrderID], [OrderDate], [DeliveryCharge], [TotalValue] FROM [Orders] ORDER BY [OrderDate]">
    </asp:SqlDataSource>
    
    <br /><br />
    
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
        EmptyDataText="There are no data records to display." CellPadding="4" ForeColor="#333333" GridLines="None">
        <Columns>
            <asp:BoundField DataField="ItemName" HeaderText="Item Name" SortExpression="ItemName" />
            <asp:BoundField DataField="ItemSize" HeaderText="Item Size" ReadOnly="True" SortExpression="ItemSize" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="LineValue" DataFormatString="{0:d}" HeaderText="Line Value" SortExpression="LineValue">
                <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <RowStyle BackColor="#E3EAEB" />
        <EditRowStyle BackColor="#7C6F57" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
        ProviderName="<%$ ConnectionStrings:PPQ_DataConnectionString1.ProviderName %>"
        SelectCommand="SELECT OrderItems.fkOrderID, OrderItems.fkMenuItemID, OrderItems.ItemSize, OrderItems.ItemName, OrderItems.Quantity, OrderItems.LineValue, OrderItems.fkOrderID, MenuItems.ItemName AS Expr1 FROM OrderItems INNER JOIN MenuItems ON OrderItems.fkMenuItemID = MenuItems.MenuItemID WHERE (OrderItems.fkOrderID = @fkOrderID)">
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="fkOrderID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br /><br />
</asp:Content>

