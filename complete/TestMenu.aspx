<%@ Page Language="VB" MasterPageFile="~/PPQ.master" %>

<asp:Content runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
  <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True"
      AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None"
      BorderWidth="1px" CellPadding="4" DataKeyNames="MenuItemID" DataSourceID="SqlDataSource1"
      EmptyDataText="There are no data records to display." ForeColor="Black" GridLines="Vertical">
      <FooterStyle BackColor="#CCCC99" />
      <Columns>
          <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
          <asp:BoundField DataField="MenuItemType" HeaderText="MenuItemType" SortExpression="MenuItemType" />
          <asp:BoundField DataField="ItemName" HeaderText="ItemName" SortExpression="ItemName" />
          <asp:BoundField DataField="PizzaToppings" HeaderText="PizzaToppings" SortExpression="PizzaToppings" />
          <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
      </Columns>
      <RowStyle BackColor="#F7F7DE" />
      <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
      <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
      <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
      <AlternatingRowStyle BackColor="White" />
  </asp:GridView>
  <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:PPQ_DataConnectionString1 %>"
      DeleteCommand="DELETE FROM [MenuItems] WHERE [MenuItemID] = @MenuItemID" InsertCommand="INSERT INTO [MenuItems] ([MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName]) VALUES (@MenuItemType, @ItemName, @PizzaToppings, @Description, @GraphicFileName)"
      ProviderName="<%$ ConnectionStrings:PPQ_DataConnectionString1.ProviderName %>"
      SelectCommand="SELECT [MenuItemID], [MenuItemType], [ItemName], [PizzaToppings], [Description], [GraphicFileName] FROM [MenuItems]"
      UpdateCommand="UPDATE [MenuItems] SET [MenuItemType] = @MenuItemType, [ItemName] = @ItemName, [PizzaToppings] = @PizzaToppings, [Description] = @Description, [GraphicFileName] = @GraphicFileName WHERE [MenuItemID] = @MenuItemID">
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
          <asp:Parameter Name="MenuItemID" Type="Int32" />
      </UpdateParameters>
      <DeleteParameters>
          <asp:Parameter Name="MenuItemID" Type="Int32" />
      </DeleteParameters>
  </asp:SqlDataSource>
</asp:Content>