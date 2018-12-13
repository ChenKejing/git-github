<%@ Page Language="VB" %>

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
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
          SelectCommand="usp_GetAllMenuItems" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
    </div>
       <asp:DetailsView ID="DetailsView1" runat="server" AllowPaging="True" AutoGenerateRows="False"
          CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None"
          Height="50px" Width="402px">
          <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <CommandRowStyle BackColor="#C5BBAF" Font-Bold="True" />
          <EditRowStyle BackColor="#7C6F57" />
          <RowStyle BackColor="#E3EAEB" />
          <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
          <Fields>
             <asp:BoundField DataField="MenuItemID" HeaderText="MenuItemID" InsertVisible="False"
                ReadOnly="True" SortExpression="MenuItemID" />
             <asp:BoundField DataField="MenuItemType" HeaderText="MenuItemType" SortExpression="MenuItemType" />
             <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
             <asp:BoundField DataField="PizzaToppings" HeaderText="PizzaToppings" SortExpression="PizzaToppings" />
             <asp:BoundField DataField="GraphicFileName" HeaderText="GraphicFileName" SortExpression="GraphicFileName" />
             <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
             <asp:BoundField DataField="ItemSize" HeaderText="ItemSize" SortExpression="ItemSize" />
             <asp:BoundField DataField="ItemPrice" HeaderText="ItemPrice" SortExpression="ItemPrice" />
          </Fields>
          <FieldHeaderStyle BackColor="#D0D0D0" Font-Bold="True" />
          <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <AlternatingRowStyle BackColor="White" />
       </asp:DetailsView>
       <br />
       <asp:FormView ID="FormView1" runat="server" AllowPaging="True" CellPadding="4" DataSourceID="SqlDataSource1"
          ForeColor="#333333">
          <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
          <EditRowStyle BackColor="#7C6F57" />
          <EditItemTemplate>
             MenuItemID:
             <asp:Label ID="MenuItemIDLabel1" runat="server" Text='<%# Eval("MenuItemID") %>'>
             </asp:Label><br />
             MenuItemType:
             <asp:TextBox ID="MenuItemTypeTextBox" runat="server" Text='<%# Bind("MenuItemType") %>'>
             </asp:TextBox><br />
             ItemName:
             <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>'>
             </asp:TextBox><br />
             PizzaToppings:
             <asp:TextBox ID="PizzaToppingsTextBox" runat="server" Text='<%# Bind("PizzaToppings") %>'>
             </asp:TextBox><br />
             GraphicFileName:
             <asp:TextBox ID="GraphicFileNameTextBox" runat="server" Text='<%# Bind("GraphicFileName") %>'>
             </asp:TextBox><br />
             Description:
             <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'>
             </asp:TextBox><br />
             ItemSize:
             <asp:TextBox ID="ItemSizeTextBox" runat="server" Text='<%# Bind("ItemSize") %>'>
             </asp:TextBox><br />
             ItemPrice:
             <asp:TextBox ID="ItemPriceTextBox" runat="server" Text='<%# Bind("ItemPrice") %>'>
             </asp:TextBox><br />
             <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                Text="Update">
             </asp:LinkButton>
             <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
             </asp:LinkButton>
          </EditItemTemplate>
          <RowStyle BackColor="#E3EAEB" />
          <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
          <InsertItemTemplate>
             MenuItemType:
             <asp:TextBox ID="MenuItemTypeTextBox" runat="server" Text='<%# Bind("MenuItemType") %>'>
             </asp:TextBox><br />
             ItemName:
             <asp:TextBox ID="ItemNameTextBox" runat="server" Text='<%# Bind("ItemName") %>'>
             </asp:TextBox><br />
             PizzaToppings:
             <asp:TextBox ID="PizzaToppingsTextBox" runat="server" Text='<%# Bind("PizzaToppings") %>'>
             </asp:TextBox><br />
             GraphicFileName:
             <asp:TextBox ID="GraphicFileNameTextBox" runat="server" Text='<%# Bind("GraphicFileName") %>'>
             </asp:TextBox><br />
             Description:
             <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>'>
             </asp:TextBox><br />
             ItemSize:
             <asp:TextBox ID="ItemSizeTextBox" runat="server" Text='<%# Bind("ItemSize") %>'>
             </asp:TextBox><br />
             ItemPrice:
             <asp:TextBox ID="ItemPriceTextBox" runat="server" Text='<%# Bind("ItemPrice") %>'>
             </asp:TextBox><br />
             <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                Text="Insert">
             </asp:LinkButton>
             <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                Text="Cancel">
             </asp:LinkButton>
          </InsertItemTemplate>
          <ItemTemplate>
             MenuItemID:
             <asp:Label ID="MenuItemIDLabel" runat="server" Text='<%# Eval("MenuItemID") %>'>
             </asp:Label><br />
             MenuItemType:
             <asp:Label ID="MenuItemTypeLabel" runat="server" Text='<%# Bind("MenuItemType") %>'>
             </asp:Label><br />
             ItemName:
             <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Bind("ItemName") %>'></asp:Label><br />
             PizzaToppings:
             <asp:Label ID="PizzaToppingsLabel" runat="server" Text='<%# Bind("PizzaToppings") %>'>
             </asp:Label><br />
             GraphicFileName:
             <asp:Label ID="GraphicFileNameLabel" runat="server" Text='<%# Bind("GraphicFileName") %>'>
             </asp:Label><br />
             Description:
             <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Bind("Description") %>'>
             </asp:Label><br />
             ItemSize:
             <asp:Label ID="ItemSizeLabel" runat="server" Text='<%# Bind("ItemSize") %>'></asp:Label><br />
             ItemPrice:
             <asp:Label ID="ItemPriceLabel" runat="server" Text='<%# Bind("ItemPrice") %>'></asp:Label><br />
          </ItemTemplate>
          <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
       </asp:FormView>
    </form>
</body>
</html>
