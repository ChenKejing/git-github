<%@ Page Language="VB" MasterPageFile="~/PPQ.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" title="Untitled Page" %>
<%@ Register Src="Cart.ascx" TagName="Cart" TagPrefix="uc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:Wizard ID="Wizard1" runat="server" BackColor="#E6E2D8" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"
        Font-Names="Verdana" Font-Size="0.8em" Width="100%" ActiveStepIndex="2">
        <SideBarStyle VerticalAlign="Top" BackColor="#1C5E55" Font-Size="0.9em" />
        <StepStyle BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px" />
        <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
        <SideBarButtonStyle ForeColor="White" />
        <HeaderStyle BackColor="#666666" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px"
            Font-Bold="True" Font-Size="0.9em" ForeColor="White" HorizontalAlign="Center" />
        <WizardSteps>
            <asp:WizardStep ID="WizardStep1" runat="server" Title="Delivery Address">
                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server"
                    TypeName="StoredShoppingCart" SelectMethod="Read" UpdateMethod="Update"
                    OnUpdating="ObjectDataSource1_Updating">
                    <UpdateParameters>
                        <asp:Parameter Name="DeliveryCharge" Type="Decimal" />
                    </UpdateParameters>
                </asp:ObjectDataSource>
                <table style="border:0">
                    <tr><td>Name</td><td><asp:textbox id="txtName" runat="server" /></td></tr>
                    <tr><td>Address</td><td><asp:textbox id="txtAddress" runat="server" TextMode="MultiLine" Rows="5" Columns="30"/></td></tr>
                    <tr><td>Zip Code</td><td><asp:textbox id="txtZipCode" runat="server" /></td></tr>
                    <tr><td>Area</td><td>
                        <asp:FormView ID="FormView1" runat="server"
                            DefaultMode="Edit" DataSourceID="ObjectDataSource1">
                            <EditItemTemplate>
                                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="XML-Data/delivery-costs.xml">
                                </asp:XmlDataSource>
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="XmlDataSource1"
                                    DataTextField="name" DataValueField="delivery-cost"
                                    AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"
                                    SelectedValue='<%#Eval("DeliveryCharge")%>'>
                                </asp:DropDownList>
                            </EditItemTemplate>
                        </asp:FormView>
                    </td></tr>
                </table>
            </asp:WizardStep>
            
            <asp:WizardStep ID="WizardStep2" runat="server" Title="Payment">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True"
                    OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                    <asp:ListItem Value="COD" Text="Cash on Delivery" Selected="True"></asp:ListItem>
                    <asp:ListItem Value="CC" Text="Credit Card"></asp:ListItem>
                </asp:RadioButtonList>
                <asp:Panel ID="CreditCardPayment" runat="server" Visible="False" Width="100%">
                    <br />
                    Card Type: 
                    <asp:DropDownList id="lstCardType" runat="server">
                        <asp:ListItem>MasterCard</asp:ListItem>    
                        <asp:ListItem>Visa</asp:ListItem>    
                    </asp:DropDownList>
                    <br />
                    Card Number: <asp:Textbox id="txtNumber" runat="server" Text="0123456789" ReadOnly="True"/>
                    <br />
                    Expires:
                    <asp:textbox id="txtExpiresMonth" runat="server" columns="2" />
                    /
                    <asp:textbox id="txtExpiresYear" runat="server"  columns="4" />
                </asp:Panel>
            </asp:WizardStep>

            <asp:WizardStep ID="WizardStep3" runat="server" Title="Shopping Cart" StepType="Finish">
                <uc1:Cart ID="Cart1" runat="server" />

                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server"
                    TypeName="StoredShoppingCart" SelectMethod="Read">
                </asp:ObjectDataSource>

                <asp:DetailsView ID="DetailsView1" runat="server" DataSourceID="ObjectDataSource2"
                    AutoGenerateRows="False" DefaultMode="Edit" Width="100%">
                    <Fields>
                        <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                        <asp:BoundField DataField="DeliveryCharge" HeaderText="DeliveryCharge" SortExpression="DeliveryCharge" />
                        <asp:BoundField DataField="SubTotal" HeaderText="SubTotal" ReadOnly="True" SortExpression="SubTotal" />
                        <asp:BoundField DataField="SalesTaxPercent" HeaderText="SalesTaxPercent" ReadOnly="True"
                            SortExpression="SalesTaxPercent" />
                        <asp:BoundField DataField="SalesTax" HeaderText="SalesTax" ReadOnly="True" SortExpression="SalesTax" />
                    </Fields>
                </asp:DetailsView>

                <br /><br />
                Please confirm you wish to have 
                deducted from your credit card.

            </asp:WizardStep>
            
            <asp:WizardStep ID="WizardStep5" runat="server" StepType="Complete" Title="Order Complete">
                Thank you for your order.
            </asp:WizardStep>
        </WizardSteps>
    </asp:Wizard>

                                    
    <asp:Label ID="CreateOrderSuccessLabel" runat="server" Visible="false">
        Our trusty delivery boy is at this moment donning <br />
        his crash helmet, ready to leap aboard his skateboard to head to your residence.<br />
        Remember that if the delivery doesn't arrive within the alloted time you'll get<br />
        a full refund and the boss will personally take a helicopter to your door to ensure it<br />
        gets there.
    </asp:Label>
    
    <asp:Label ID="CreateOrderErrorLabel" runat="server" Visible="false">
        We're sorry but something appears to have gone wrong with the creation of that order.<br />
        Please give us a ring and will place it on high priority.
    </asp:Label>    </asp:Content>

