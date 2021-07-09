<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="EditOrder.aspx.cs" Inherits="Pages_Set_EditOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-7">
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label15" runat="server" Text="OrderId"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtOrderId" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label8" runat="server" Text="Payment Details"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtPaymentDetails" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label9" runat="server" Text="Customer IP:"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtCustomerIP" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label10" runat="server" Text="Action"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlStatus" CssClass="form-control" OnSelectedIndexChanged="ddlStatus_SelectedIndexChanged" AutoPostBack="true" runat="server">
                        <asp:ListItem Value="0">Select</asp:ListItem>
                        <asp:ListItem>Print Invoice</asp:ListItem>
                        <asp:ListItem>Download Invoice</asp:ListItem>
                        <asp:ListItem>View Invoice</asp:ListItem>
                    </asp:DropDownList>

                </div>
            </div>
        </div>
    </div>
    <hr />
    <hr />
    <div class="row">
        <div class="col-md-6">
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label1" runat="server" Text="OrderId"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtOrderId2" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label2" runat="server" Text="Order Type"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtOrderType" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label11" runat="server" Text="Name"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtName" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div> 
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label12" runat="server" Text="Email"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtEmail" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div> 
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label13" runat="server" Text="Contect No."></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtContectNo" Enabled="false" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label7" runat="server" Text="Status"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:DropDownList ID="ddlStatus2" CssClass="form-control" runat="server">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Completed</asp:ListItem>
                        <asp:ListItem>Pending Payment</asp:ListItem>
                        <asp:ListItem>Processing</asp:ListItem>
                        <asp:ListItem>On Hold</asp:ListItem>
                        <asp:ListItem>Refunded</asp:ListItem>
                        <asp:ListItem>Cancelled</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div> 
        </div>
        <div class="col-md-6">
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label3" runat="server" Text="Order Date"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtOrderDate" CssClass="form-control" runat="server"></asp:TextBox>
                </div>                
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label4" runat="server" Text="Clearance date:"></asp:Label>
                </div>
                <div class="col-sm-6" >
                    <asp:TextBox ID="txtDeliveryDate" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
              
            </div>
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label14" runat="server" Text="Billing Address"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtBillingAddress" TextMode="MultiLine" Rows="2" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div> 
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label16" runat="server" Text="Shipping Address"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <asp:TextBox ID="txtShippingAddress" TextMode="MultiLine" Rows="2" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div> 
            <div class="row form-group">
                <div class="col-sm-4 col-sm-offset-1">
                    <asp:Label ID="Label17" runat="server" Text="Note"></asp:Label>
                </div>
                <div class="col-sm-6">
                    <textarea name="txtNote" id="txtNote" placeholder="Write a Note.." style="width: 100%;" runat="server"></textarea>
                </div>
            </div>
        </div>        
    </div>


    <div class="row">
        <div class="col-md-12">
            <asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered table-hover" Width="100%" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" ShowFooter="True" EmptyDataText="No Data Record">
                <RowStyle HorizontalAlign="Center" />
                <Columns>
                    <asp:TemplateField HeaderText=" Product Code" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblProductId" runat="server" Visible="true" Text='<%# Eval("ProductCode") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Item" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName1" runat="server" Visible="true" Text='<%# Eval("Pname") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Quantity" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Label ID="lblFirstName2" runat="server" Visible="true" Text='<%# Eval("Quantity") %>'></asp:Label>
                        </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True"></HeaderStyle>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Price" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            £<asp:Label ID="lblPrice" runat="server" Visible="true"></asp:Label>
                        </ItemTemplate>

                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True"></HeaderStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText=" Vat Amount" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            £<asp:Label ID="lblFirstName3" runat="server" Visible="true" Text='<%# Eval("Vat") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <strong>Total Vat Amount: &nbsp;</strong><asp:Label ID="lvlVat" runat="server"></asp:Label>
                                    </FooterTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Center" Font-Bold="True"></HeaderStyle>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Net Amount" HeaderStyle-ForeColor="Black" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            £<asp:Label ID="lblNetAmount" runat="server" Visible="true" Text='<%# Eval("Total") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <strong>Total Net Amount: &nbsp;</strong><asp:Label ID="lvlNet" runat="server"></asp:Label>
                            <br /><br />
                            <strong>Total Paid Amount: &nbsp;</strong><asp:Label ID="lvlPaid" runat="server" ></asp:Label>
                                    </FooterTemplate>
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <HeaderStyle HorizontalAlign="Left" Font-Bold="True"></HeaderStyle>
                    </asp:TemplateField>

                </Columns>
                <HeaderStyle Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>

        </div>
    </div>

    <div class="row">
        <div class="col-md-3"></div>
        <div class="row form-group">

            <div class="col-md-4">
                <asp:Button ID="btnAdd" Style="padding: 5px 9px" runat="server" Text="Update" CssClass="btn-edit btn btn-warning btn-xs" OnClick="btnUpdate_Click" />
            </div>

            <div class="col-md-4">
                <asp:Button ID="btnCencle" runat="server" Style="padding: 5px 9px" Text="Cancel" CausesValidation="false" PostBackUrl="~/Pages/Set/CustomerOrder.aspx" CssClass="btn btn-danger btn-xs" />
            </div>
            <div class="col-md-4">
                <asp:Button ID="Button1" runat="server" Style="padding: 5px 9px" Text="Back To List" CausesValidation="false" PostBackUrl="~/Pages/Set/CustomerOrder.aspx" CssClass="btn btn-primary" />
            </div>
        </div>
    </div>
</asp:Content>

