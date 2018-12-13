<%@ Page Language="VB" MasterPageFile="~/PPQMasterPage.master" AutoEventWireup="false" CodeFile="Checkout.aspx.vb" Inherits="Checkout" title="Untitled Page" %>

<%@ Register Src="user-controls/Cart.ascx" TagName="Cart" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Wizard ID="Wizard1" runat="server" Width="100%" BackColor="#E6E2D8" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" Height="404px" ActiveStepIndex="1">
        <WizardSteps>
            <asp:WizardStep runat="server" StepType="Start" Title="Delivery Address">
                <div style="text-align: left">
                    <table border="0" style="width: 100%; height: 100%">
                        <tr>
                            <td style="width: 129px" valign="top">
                                Name</td>
                            <td style="width: 81px" valign="top">
                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 129px" valign="top">
                                Address</td>
                            <td style="width: 81px" valign="top">
                                <asp:TextBox ID="txtAddress" runat="server" Columns="30" Rows="5" TextMode="MultiLine" Height="77px" Width="203px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 129px" valign="top">
                                Zip Code</td>
                            <td style="width: 81px" valign="top">
                                <asp:TextBox ID="txtZipCode" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 129px" valign="top">
                                Area</td>
                            <td style="width: 81px" valign="top">
                                <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="Read" TypeName="StoredShoppingCart"
                                    UpdateMethod="Update">
                                    <UpdateParameters>
                                        <asp:Parameter Name="DeliveryCharge" Type="Decimal" />
                                    </UpdateParameters>
                                </asp:ObjectDataSource>
                                &nbsp;&nbsp;
                                <asp:FormView ID="FormView1" runat="server" DefaultMode="Edit">
                                    <HeaderTemplate>
                                        Sales Tax (<%#Eval("SalesTaxPercent", "{0:0%}")%>)
                                    </HeaderTemplate>
                                    <EditItemTemplate>
                                        <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XML-Data/delivery-costs.xml"></asp:XmlDataSource>
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="XmlDataSource1"
                                            DataTextField="name" DataValueField="delivery-cost" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" SelectedValue='<%# Bind("DeliveryCharge") %>' Width="100px">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                </asp:FormView>
                                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="XmlDataSource1"
                                    DataTextField="name" DataValueField="delivery-cost">
                                </asp:DropDownList>
                                <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/XML-Data/delivery-costs.xml">
                                </asp:XmlDataSource>
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="Payment">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" Width="100%">
                    <asp:ListItem Selected="True" Value="COD">Cash on Delivery</asp:ListItem>
                    <asp:ListItem Value="CC">Credit Card</asp:ListItem>
                </asp:RadioButtonList>
                <asp:Panel ID="CreditCardPayment" runat="server" Height="264px" Visible="False" Width="100%">
                    Card Type:<asp:DropDownList ID="lstCardType" runat="server">
                        <asp:ListItem>MasterCard</asp:ListItem>
                        <asp:ListItem>Visa</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    Card Number:<asp:TextBox ID="txtCardNumber" runat="server" Width="102px"></asp:TextBox>
                    <br />
                    Expires:
                    <asp:TextBox ID="txtExpiresMonth" runat="server" Columns="2" Width="24px"></asp:TextBox>
                    &nbsp;/
                    <asp:TextBox ID="txtExpiresYear" runat="server" Columns="4" Width="59px"></asp:TextBox>
                </asp:Panel>
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Finish" Title="Shopping Cart">
                <uc1:Cart ID="Cart1" runat="server" />
                <asp:ObjectDataSource ID="ObjectDataSource2" runat="server" SelectMethod="Read" TypeName="StoredShoppingCart">
                </asp:ObjectDataSource>
                <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataSourceID="ObjectDataSource2"
                    DefaultMode="Edit" Height="50px" Width="100%" HorizontalAlign="Right">
                    <Fields>
                        <asp:BoundField DataField="SubTotal" DataFormatString="{0:C}" HeaderText="SubTotal"
                            ReadOnly="True" SortExpression="SubTotal">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DeliveryCharge" DataFormatString="{0:C}" HeaderText="DeliveryCharge"
                            ReadOnly="True" SortExpression="DeliveryCharge">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="SalesTax" SortExpression="SalesTaxPercent">
                            <EditItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("SalesTax", "{0:C}") %>'></asp:Label>                              
                            </EditItemTemplate>
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Total" DataFormatString="{0:C}" HeaderText="Total" ReadOnly="True"
                            SortExpression="Total">
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Fields>
                </asp:DetailsView>
            </asp:WizardStep>
            <asp:WizardStep runat="server" StepType="Complete" Title="Order Complete">
                Thank you for your order<br />
                <br />
                <asp:Label ID="CreateOrderSuccessLabel" runat="server" Height="23px" Text="Label" Width="100%" Visible="False">
                    Our trusty delivery boy is at this moment donning <br />
                    his crash helmet, ready to leap aboard is skateboard to head to your
                    residence.<br />
                    Remember that if the delivery doesn¡¯t arrive within the alloted time you¡¯ll
                    get<br />
                    a full refund and the boss will personally take a helicopter to your door to
                    ensure it<br />
                    gets there.
                </asp:Label>
                <asp:Label ID="CreateOrderErrorLabel" runat="server" Height="19px" Text="Label" Width="100%" Visible="False">
                    We¡¯re sorry but something appears to have gone wrong with the creation of that
                    order.<br />
                    Please give us a ring and will place it on high priority.
                <br />
                <br />
                </asp:Label>
            </asp:WizardStep>
        </WizardSteps>
        <StepStyle BackColor="#F7F6F3" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px" />
        <SideBarStyle BackColor="#1C5E55" Font-Size="0.9em" VerticalAlign="Top" />
        <NavigationButtonStyle BackColor="White" BorderColor="#C5BBAF" BorderStyle="Solid"
            BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" />
        <SideBarButtonStyle ForeColor="White" />
        <HeaderStyle BackColor="#666666" BorderColor="#E6E2D8" BorderStyle="Solid" BorderWidth="2px"
            Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        <StepNavigationTemplate>
            <asp:Button ID="StepPreviousButton" runat="server" BackColor="White" BorderColor="#C5BBAF"
                BorderStyle="Solid" BorderWidth="1px" CausesValidation="False" CommandName="MovePrevious"
                Font-Names="Verdana" Font-Size="0.8em" ForeColor="#1C5E55" Text="Previous" />
            <asp:Button ID="StepNextButton" runat="server" BackColor="White" BorderColor="#C5BBAF"
                BorderStyle="Solid" BorderWidth="1px" CommandName="MoveNext" Font-Names="Verdana"
                Font-Size="0.8em" ForeColor="#1C5E55" Text="Next" />
        </StepNavigationTemplate>
    </asp:Wizard>
</asp:Content>

