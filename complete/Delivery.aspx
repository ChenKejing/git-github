<%@ Page Language="VB" MasterPageFile="~/PPQ.master" Title="Untitled Page" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XML-Data/delivery-costs.xml">
	</asp:XmlDataSource>
	<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
		DataSourceID="XmlDataSource1" ForeColor="#333333" GridLines="None">
		<FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
		<Columns>
			<asp:BoundField DataField="name" HeaderText="Delivery Area" SortExpression="name" />
			<asp:TemplateField HeaderText="Cost" SortExpression="delivery-cost">
				<ItemTemplate>
					<asp:Label ID="Label1" runat="server" 
					     Text='<%# "$ " & String.Format("{0:F2}", Double.Parse(XPath("@delivery-cost"))) %>'>
  	      </asp:Label>
				</ItemTemplate>
			</asp:TemplateField>
		</Columns>
		<RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
		<SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
		<PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
		<HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
		<AlternatingRowStyle BackColor="White" />
	</asp:GridView>
</asp:Content>

