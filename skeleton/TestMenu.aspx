<%@ Page Language="VB"  MasterPageFile="~/PPQMasterPage.master" AutoEventWireup="false" CodeFile="TestMenu.aspx.vb" Inherits="TestMenu" %>
<asp:Content ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

 
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
            AutoGenerateColumns="False" DataKeyNames="MenuItemsID" DataSourceID="SqlDataSource1"
            EmptyDataText="There are no data records to display." Style="position: relative" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <Columns>
                <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                <asp:BoundField DataField="MenuItemType" HeaderText="MenuItemType" SortExpression="MenuItemType" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="PizzaToppings" HeaderText="PizzaToppings" SortExpression="PizzaToppings" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="#CCCCCC" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
            DeleteCommand="DELETE FROM [MenuItems] WHERE [MenuItemsID] = @MenuItemsID" InsertCommand="INSERT INTO [MenuItems] ([MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName]) VALUES (@MenuItemType, @ItemName, @PizzaToppings, @Description, @GraphicFileName)"
            ProviderName="<%$ ConnectionStrings:PPQ_DataConnectionString1.ProviderName %>"
            SelectCommand="SELECT [MenuItemsID], [MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName] FROM [MenuItems]"
            UpdateCommand="UPDATE [MenuItems] SET [MenuItemType] = @MenuItemType, [ItemName] = @ItemName, [PizzaToppings] = @PizzaToppings, [Description] = @Description, [GraphicFileName] = @GraphicFileName WHERE [MenuItemsID] = @MenuItemsID">
            <InsertParameters>
                <asp:Parameter Name="MenuItemType" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="PizzaToppings" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="GraphicFileName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="MenuItemType" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="PizzaToppings" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="GraphicFileName" Type="String" />
                <asp:Parameter Name="MenuItemsID" Type="Int32" />
            </UpdateParameters>
            <DeleteParameters>
                <asp:Parameter Name="MenuItemsID" Type="Int32" />
            </DeleteParameters>
        </asp:SqlDataSource>
        
   
</asp:Content> 

