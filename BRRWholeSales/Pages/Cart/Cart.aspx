<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Pages_Cart_Cart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        th{
            text-align:center !important;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>

    <asp:Label runat="server" ID="lblloigin" Visible="false"></asp:Label>

    <asp:Panel runat="server" ID="pnl2">

        <%--<div style="font-size:5px;">

        </div>--%>

        <div id="content">
            <div class="content-page woocommerce">
                <div class="container">
                    <div class="cart-content-page">
                        <br />
                        <h2 class="title-shop-page">my cart</h2>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label2" Text=" Account Id:" Font-Bold="true" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="lblAccId" runat="server"></asp:Label>
                            </div>
                        </div>
                        
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label4" Text="Date & Time:" Font-Bold="true" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="lblDateTime" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label3" Text="Shopping Type:" Font-Bold="true" runat="server"></asp:Label>
                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="lblShoppingType" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-3">
                                <asp:Label ID="Label5" Text="Address:" Font-Bold="true" runat="server"></asp:Label>

                            </div>
                            <div class="col-md-3">
                                <asp:Label ID="labAddress" runat="server"></asp:Label>
                            </div>

                        </div>
                        <br />
                        <asp:GridView ID="GridView1" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound"
                            OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting"
                            OnRowCommand="GridView1_RowCommand" CssClass="table table-striped table-bordered table-hover" DataKeyNames="pid" AutoGenerateColumns="False"
                            runat="server" Visible="False" EmptyDataText="Empty Shopping Cart">

                            <AlternatingRowStyle BackColor="White" />

                            <Columns>

                                <asp:TemplateField HeaderText="" HeaderStyle-HorizontalAlign="Center" >
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgBtnEdit" runat="server" ImageUrl="../../images/dltgrd.png" CommandName="cmdDelete" CommandArgument='<%#Eval("pid")%>' />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:CommandField Visible="false" ButtonType="Button" ShowDeleteButton="True" />

                                <asp:TemplateField HeaderText="Image" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <img src="../../ProductImage/<%#Eval("pid") %>/<%#Eval("Imagename")%><%#Eval("Imageextension")%>" width="70px" height="70px" alt="<%#Eval("Imagename")%>" />
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Product Id" Visible="false" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%# Eval("pid") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Product Code" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblBarcode" runat="server" Text='<%# Eval("Barcode") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Product Name" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblpname" runat="server" Text='<%# Eval("pname") %>'></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Unit Price" FooterStyle-Font-Bold="True" FooterStyle-HorizontalAlign="Left"
                                    ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblprice" runat="server" Text='<%# string.Format("{0:0.00 }", Eval("price")) %>'></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        &nbsp;
                            <asp:Label ID="Label1" runat="server" Text="Grand Total :"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Center" Font-Bold="True"></FooterStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>


                                <asp:TemplateField HeaderText="Quantity"  HeaderStyle-HorizontalAlign="Center" FooterStyle-HorizontalAlign="Right">
                                    <ItemTemplate>
                                        <asp:Button ID="btdcre" runat="server" Text="-" CommandName="decrement" Visible="false" CausesValidation="false"
                                            CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                        <asp:Label ID="LblQ1" Visible="false" runat="server" Text='<%# Eval("quantity") %>'></asp:Label>
                                        <asp:TextBox ID="LblQ" Text='<%# Eval("quantity") %>'  CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" CommandName="textChang"  OnTextChanged="LblQ_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                                        <%--<asp:Button ID="btincre" runat="server" Text="+" CommandName="increment" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />--%>
                                        <asp:Button ID="btincre" runat="server" Text="+" CausesValidation="false" CommandName="increment" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtCtyUpdate" runat="server" Width="20px" Text='<%# Eval("quantity") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lvlTotalQuantity" Font-Bold="true" Text="0" runat="server"></asp:Label>
                                    </FooterTemplate>
                                    <ControlStyle Height="20px" Width="50px" />
                                    <FooterStyle HorizontalAlign="center"></FooterStyle>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Vat Amount" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lblhfvatamount" Visible="false" runat="server" Text='<%# Eval("hfvatamount") %>'></asp:Label>
                                        <asp:Label ID="lvlVatAmount" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lvlTotalVat" Font-Bold="true" Text="0" runat="server"></asp:Label>
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <FooterStyle HorizontalAlign="center"></FooterStyle>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Total Price" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:Label ID="lbltotal" runat="server" Text='<%# string.Format("{0:0.00 }", Eval("total")) %>' ></asp:Label>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="lbltt" Font-Bold="true" runat="server" />
                                    </FooterTemplate>
                                    <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                    <FooterStyle HorizontalAlign="Center" />
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>

                    </div>
                    <br />
                    <div class="cart-collaterals">
                        <div class="cart_totals ">
                            <h2>Cart Totals</h2>
                            <div class="table-responsive">
                                <table cellspacing="0" class="table">
                                    <tbody>
                                        <tr class="cart-subtotal">
                                            <th>Total Product</th>
                                            <td><strong class="amount">
                                                <asp:Label ID="lbltotalP" runat="server"></asp:Label></strong></td>
                                        </tr>
                                        <tr class="cart-subtotal">
                                            <th>Net Amount</th>
                                            <td><strong class="amount">
                                                £<asp:Label ID="lblNetAmount" runat="server"></asp:Label></strong></td>
                                        </tr>
                                        <tr class="cart-subtotal">
                                            <th>Vat Amount</th>
                                            <td><strong class="amount">
                                                £<asp:Label ID="lvlTotalVatAmount" runat="server"></asp:Label></strong></td>
                                        </tr>

                                        <tr class="order-total">
                                            <th>Total</th>
                                            <td><strong><span class="amount">£
                                                <asp:Label ID="lblTotal" runat="server"></asp:Label></span></strong> </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>


                    <br />

                    <div class="row" style="text-align: center">
                        <asp:Button runat="server" ID="Button1" Text="Empty Cart" OnClick="btnCancel_Click" CssClass="buttonstyle" CausesValidation="false" />


                        &nbsp;&nbsp;&nbsp;
                         <asp:Button runat="server" ID="btncontinue" Text="Continue Shopping" OnClick="btncontinue_Click" CssClass="buttonstyle"  CausesValidation="false"  />

                        <asp:Button runat="server" ID="btncheckout" Text="Checkout" CssClass="buttonstyle" CausesValidation="false" OnClick="btncheckout_Click" />
                        <%--<a href="../../Home.aspx" class="buttonstyle">Continur Shopping</a>--%>
                    </div>
                </div>
            </div>
        </div>


    </asp:Panel>
    <br />
    <br />
    <asp:UpdatePanel runat="server" ID="up1">
        <ContentTemplate>
            <asp:Panel runat="server" ID="pan1" Visible="false">

                <div id="content">
                    <div class="content-page woocommerce">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-12">
                                    <h2 class="title-shop-page">checkout</h2>
                                    <div class="row">
                                        <div class="cart-collaterals">
                                            <div class="cart_totals ">
                                                <h2>Cart Totals</h2>
                                                <div class="table-responsive">
                                                    <table cellspacing="0" class="table">
                                                        <tbody>
                                                            <tr class="cart-subtotal">
                                                                <th>Account Id</th>
                                                                <td><strong class="amount">
                                                                    <asp:Label ID="lblAccId1" runat="server"></asp:Label></strong></td>
                                                            </tr>
                                                            <tr class="cart-subtotal">
                                                                <th>Shopping Type</th>
                                                                <td><strong class="amount">
                                                                    <asp:Label ID="lblShoppingType1" runat="server"></asp:Label></strong></td>
                                                            </tr>
                                                            <tr class="cart-subtotal">
                                                                <th>Address</th>
                                                                <td><strong class="amount">
                                                                    <asp:Label ID="labAddress1" runat="server"></asp:Label></strong></td>
                                                            </tr>
                                                            <tr class="cart-subtotal">
                                                                <th>Date & Time</th>
                                                                <td><strong class="amount">
                                                                    <asp:Label ID="lblDateTime1" runat="server"></asp:Label></strong></td>
                                                            </tr>
                                                            <tr class="cart-subtotal">
                                                                <th>Total Product</th>
                                                                <td><strong class="amount">
                                                                    <asp:Label ID="lbltotalP1" runat="server"></asp:Label></strong></td>
                                                            </tr>
                                                            <tr class="cart-subtotal">
                                                                <th>Net Amount</th>
                                                                <td><strong class="amount">£<asp:Label ID="lblNetAmount1" runat="server"></asp:Label></strong></td>
                                                            </tr>
                                                            <tr class="cart-subtotal">
                                                                <th>Vat Amount</th>
                                                                <td><strong class="amount">£<asp:Label ID="lvlTotalVatAmount1" runat="server"></asp:Label></strong></td>
                                                            </tr>

                                                            <tr class="order-total">
                                                                <th>Total</th>
                                                                <td><strong><span class="amount">£<asp:Label ID="lblTotal1" runat="server"></asp:Label></span></strong> </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row form-group">
                                        <div class="col-sm-12 inputGroupContainer">
                                            <div class="input-group">

                                                <asp:TextBox ID="txtspecialrequest" TextMode="MultiLine" runat="server" CssClass="form-control" placeholder="Special Requist" />
                                                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>

                                            </div>
                                        </div>

                                    </div>
                                    <div class="form-row place-order">
                                        <asp:Button ID="place_order" Text="Pay Now" OnClick="place_order_Click" runat="server" class="button alt" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </ContentTemplate>
    </asp:UpdatePanel>



</asp:Content>

