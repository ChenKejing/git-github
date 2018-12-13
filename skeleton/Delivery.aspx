<%@ Page Language="VB" MasterPageFile="~/PPQMasterPage.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XML-Data/delivery.xml"></asp:XmlDataSource>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="XmlDataSource1"
        Width="307px">
        <Columns>
            <asp:BoundField DataField="id" HeaderText="id" SortExpression="id" />
            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
            <asp:BoundField DataField="delivery-cost" HeaderText="delivery-cost" SortExpression="delivery-cost" />
        </Columns>
    </asp:GridView>
</asp:Content>

