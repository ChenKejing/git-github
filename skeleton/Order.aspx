<%@ Page Language="VB" MasterPageFile="~/PPQMasterPage.master" AutoEventWireup="false" CodeFile="Order.aspx.vb" Inherits="Order" title="Untitled Page" %>
<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="System.Data.SqlClient" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Label ID="Label1" runat="server" />
    <br />

    <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333">
        <HeaderStyle BackColor="White" Font-Bold="True" Font-Names="Comic Sans MS" Font-Size="XX-Large"
          ForeColor="SlateGray" HorizontalAlign="Center" />
        <FooterStyle HorizontalAlign="Center" />
        <ItemStyle BackColor="White" ForeColor="#284775" />
        <SeparatorStyle HorizontalAlign="Center" />
        <HeaderTemplate>
          Our Stone-Baked Menu<br />
          <asp:Image ID="Image1" runat="server" ImageUrl="images/menu-spacer.gif" GenerateEmptyAlternateText="True" />
        </HeaderTemplate>
        <ItemTemplate>
            <asp:Image ID="Image4" runat="server" ImageAlign="Left" style="margin: 5px 10px 5px 0px"
                ImageUrl='<%# Eval("GraphicFileName", "images/{0}") %>' AlternateText='<%# Eval("ItemName") %>' />
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("MenuItemType") %>' Font-Bold="True" Font-Size="1.2em" /> -
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("ItemName") %>' Font-Bold="True" Font-Size="1.2em" /><br />
            <asp:Label ID="Label4" runat="server" Text='<%# Eval("PizzaToppings", "Generously topped with {0}.") %>' />
            <asp:Label ID="Label5" runat="server" Text='<%# Eval("Description") %>' />.<br />

            <asp:Repeater ID="Repeater1" runat="server"
                DataSource='<%# CType(Container.DataItem, DataRowView).CreateChildView("MenuLink") %>'
                >
                <ItemTemplate>
                    <span style="color:Black;">
                            <%# Eval("ItemSize") %>: <%#Eval("ItemPrice", "${0:F2}")%> &nbsp; </span>
                </ItemTemplate>
            </asp:Repeater>
        </ItemTemplate>
        <SeparatorTemplate>
            <asp:Image ID="Image2" runat="server" ImageUrl="images/menu-spacer.gif" GenerateEmptyAlternateText="True" />
        </SeparatorTemplate>
        <FooterTemplate>
            <asp:Image ID="Image3" runat="server" ImageUrl="images/menu-spacer.gif" GenerateEmptyAlternateText="True" />
        </FooterTemplate>
    </asp:DataList>
    
</asp:Content>

