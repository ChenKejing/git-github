<%@ Page Language="VB" MasterPageFile="~/PPQ.master" AutoEventWireup="false" CodeFile="Admin.aspx.vb" Inherits="Admin" title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
        DeleteCommand="DELETE FROM [MenuItems] WHERE [MenuItemID] = @MenuItemID" InsertCommand="INSERT INTO [MenuItems] ([MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName]) VALUES (@MenuItemType, @ItemName, @PizzaToppings, @Description, @GraphicFileName)"
        SelectCommand="SELECT * FROM [MenuItems] WHERE ([MenuItemID] = @MenuItemID)" UpdateCommand="UPDATE [MenuItems] SET [MenuItemType] = @MenuItemType, [ItemName] = @ItemName, [PizzaToppings] = @PizzaToppings, [Description] = @Description, [GraphicFileName] = @GraphicFileName WHERE [MenuItemID] = @MenuItemID">
        <DeleteParameters>
            <asp:Parameter Name="MenuItemID" Type="Int32" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:Parameter Name="MenuItemType" Type="String" />
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="PizzaToppings" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="GraphicFileName" Type="String" />
            <asp:Parameter Name="MenuItemID" Type="Int32" />
        </UpdateParameters>
        <InsertParameters>
            <asp:Parameter Name="MenuItemType" Type="String" />
            <asp:Parameter Name="ItemName" Type="String" />
            <asp:Parameter Name="PizzaToppings" Type="String" />
            <asp:Parameter Name="Description" Type="String" />
            <asp:Parameter Name="GraphicFileName" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="GridView1" Name="MenuItemID" PropertyName="SelectedValue"
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MenuItemID"
        DataSourceID="SqlDataSource2">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="MenuItemID" HeaderText="MenuItemID" InsertVisible="False"
                ReadOnly="True" SortExpression="MenuItemID" />
            <asp:BoundField DataField="MenuItemType" HeaderText="MenuItemType" SortExpression="MenuItemType" />
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
            <asp:BoundField DataField="PizzaToppings" HeaderText="PizzaToppings" SortExpression="PizzaToppings" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="GraphicFileName" HeaderText="GraphicFileName" SortExpression="GraphicFileName" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
        SelectCommand="SELECT * FROM [MenuItems]"></asp:SqlDataSource>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="MenuItemID"
        DataSourceID="SqlDataSource1" Height="50px" Width="125px">
        <Fields>
            <asp:BoundField DataField="MenuItemID" HeaderText="MenuItemID" InsertVisible="False"
                ReadOnly="True" SortExpression="MenuItemID" />
            <asp:TemplateField HeaderText="MenuItemType" SortExpression="MenuItemType">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("MenuItemType") %>'>
                        <asp:ListItem Selected="True">Pizza</asp:ListItem>
                        <asp:ListItem>Drink</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:DropDownList ID="DropDownList2" runat="server" SelectedValue='<%# Bind("MenuItemType") %>'>
                        <asp:ListItem Selected="True">Pizza</asp:ListItem>
                        <asp:ListItem>Drink</asp:ListItem>
                    </asp:DropDownList>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("MenuItemType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
            <asp:BoundField DataField="PizzaToppings" HeaderText="PizzaToppings" SortExpression="PizzaToppings" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="GraphicFileName" HeaderText="GraphicFileName" SortExpression="GraphicFileName" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
        </Fields>
    </asp:DetailsView>
</asp:Content>

