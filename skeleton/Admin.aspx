<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Admin.aspx.vb" Inherits="Admin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
            DeleteCommand="DELETE FROM [MenuItems] WHERE [MenuItemsID] = @MenuItemsID" InsertCommand="INSERT INTO [MenuItems] ([MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName]) VALUES (@MenuItemType, @ItemName, @PizzaToppings, @Description, @GraphicFileName)"
            SelectCommand="SELECT * FROM [MenuItems] WHERE ([MenuItemsID] = @MenuItemsID)" UpdateCommand="UPDATE [MenuItems] SET [MenuItemType] = @MenuItemType, [ItemName] = @ItemName, [PizzaToppings] = @PizzaToppings, [Description] = @Description, [GraphicFileName] = @GraphicFileName WHERE [MenuItemsID] = @MenuItemsID">
            <DeleteParameters>
                <asp:Parameter Name="MenuItemsID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="MenuItemType" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="PizzaToppings" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="GraphicFileName" Type="String" />
                <asp:Parameter Name="MenuItemsID" Type="Int32" />
            </UpdateParameters>
            <InsertParameters>
                <asp:Parameter Name="MenuItemType" Type="String" />
                <asp:Parameter Name="ItemName" Type="String" />
                <asp:Parameter Name="PizzaToppings" Type="String" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="GraphicFileName" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:ControlParameter ControlID="GridView1" Name="MenuItemsID" PropertyName="SelectedValue"
                    Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>    
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MenuItemsID"
            DataSourceID="SqlDataSource2">
            <Columns>
                <asp:CommandField ShowSelectButton="True" />
                <asp:BoundField DataField="MenuItemsID" HeaderText="MenuItemsID" InsertVisible="False"
                    ReadOnly="True" SortExpression="MenuItemsID" />
                <asp:BoundField DataField="MenuItemType" HeaderText="MenuItemType" SortExpression="MenuItemType" />
                <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
                <asp:BoundField DataField="PizzaToppings" HeaderText="PizzaToppings" SortExpression="PizzaToppings" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:BoundField DataField="GraphicFileName" HeaderText="GraphicFileName" SortExpression="GraphicFileName" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
            SelectCommand="SELECT * FROM [MenuItems]"></asp:SqlDataSource>
    </div>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="MenuItemsID"
            DataSourceID="SqlDataSource1" Height="50px" Width="125px">
            <Fields>
                <asp:BoundField DataField="MenuItemsID" HeaderText="MenuItemsID" InsertVisible="False"
                    ReadOnly="True" SortExpression="MenuItemsID" />
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
    </form>
</body>
</html>
