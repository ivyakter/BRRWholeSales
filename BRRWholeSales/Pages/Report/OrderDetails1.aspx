<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="OrderDetails1.aspx.cs" Inherits="Pages_Report_OrderDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

    <div class="row">
        <div class="col-md-12 card">
            <br />
            <h2 class="text-center">Order No .<asp:Label runat="server" ID="lblorderdetails"></asp:Label></h2>
            <hr />
            <div class="card-body">

                <div class="col-md-4" style="float: left">
                    <h4 class="text-center">General </h4>
                    <br />

                    <asp:Label runat="server" ID="lvl2" Text="Date created:" Font-Bold="true"></asp:Label>
                    <asp:Label runat="server" ID="lblcreateddate"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="Label1" Text="Status :" Font-Bold="true"></asp:Label>
                    <asp:DropDownList runat="server" CssClass="form-control" AutoPostBack="true" OnSelectedIndexChanged="ddlaction_SelectedIndexChanged" Width="80%" ID="ddlaction">
                        <asp:ListItem Value="1"> Processing</asp:ListItem>
                        <asp:ListItem Value="2"> On Hold</asp:ListItem>
                        <asp:ListItem Value="3"> Completed</asp:ListItem>
                        <asp:ListItem Value="4"> Cancell</asp:ListItem>
                        <asp:ListItem Value="5"> Refund</asp:ListItem>
                        <asp:ListItem Value="6"> Failed</asp:ListItem>
                    </asp:DropDownList>

                </div>

                <div class="col-md-4 text-center" style="float: left">
                    <h4 class="text-center">Billing </h4>
                    <br />
                    <asp:Label runat="server" ID="lbladdress"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="Label2" Text=" Email :" Font-Bold="true"></asp:Label>
                    <asp:Label runat="server" ID="lblemail"></asp:Label>
                    <br />
                    <asp:Label runat="server" ID="Label3" Text="Phone :" Font-Bold="true"></asp:Label>
                    <asp:Label runat="server" ID="lblphone"></asp:Label>
                </div>

                <div class="col-md-4 text-center" style="float: left">
                    <h4 class="text-center">Shipping </h4>
                    <br />
                    <asp:Label runat="server" ID="lbladdress2"></asp:Label>


                </div>

            </div>
        </div>
    </div>




    <div class="row">
        <div class="col-md-12">

            <asp:GridView ID="GvExistingOrder" ShowFooter="true" runat="server" AutoGenerateColumns="false" OnRowDataBound="GvExistingOrder_RowDataBound" CssClass="table table-striped table-bordered table-hover"
                SkinID="SampleGridView" AllowPaging="True" PageSize="20" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>
                            &nbsp;&nbsp; <%# Eval("orderid")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Customer Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblfname" Text='<%# Eval("FirstName")%>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Product Name ">
                        <ItemTemplate>
                            &nbsp;&nbsp; <%# Eval("Pname")%>
                        </ItemTemplate>
                         <FooterTemplate>
                            <asp:Label ID="lblTotaltext" runat="server" Text="Total" Font-Size="Large"></asp:Label>
                        </FooterTemplate> 
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Quantity ">
                        <ItemTemplate>
                            &nbsp;&nbsp; <%# Eval("Quantity")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Price ">
                        <ItemTemplate>
                            &nbsp;&nbsp; <%# Eval("Price")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total ">

                        <ItemTemplate>
                            <asp:Label ID="lblAmount" runat="server" Text='<%#(Convert.ToDecimal(Eval("Total").ToString())) %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="lblAmountTotal" runat="server" Font-Size="Large"></asp:Label>
                        </FooterTemplate>                 
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Ordered Date ">
                        <ItemTemplate>
                            &nbsp;&nbsp; <%# Eval("Date","{0:d}")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Delivery Date ">
                        <ItemTemplate>
                            &nbsp;&nbsp; <%# Eval("DeliveyDate","{0:d}")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Shopping Type ">
                        <ItemTemplate>
                            &nbsp;&nbsp; <%# Eval("ShoppingType")%>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Time Slot ">
                        <ItemTemplate>
                            &nbsp;&nbsp; <%# Eval("TimeSlot")%>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <%--   <asp:TemplateField HeaderText="&nbsp;&nbsp; Edit">
                                                    <ItemTemplate>
                                                        <asp:Button CssClass="btn-edit" ID="btnEdit" runat="server" Text="Edit" PostBackUrl='<%# String.Concat("AddSize.aspx?ID=", Eval("ID").ToString()) %>'
                                                            meta:resourcekey="btnEditResource1" />

                                                    </ItemTemplate>
                                                    <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="&nbsp;&nbsp; Delete">
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                                        <asp:Button CssClass="btn-delete" ID="btnDelete" runat="server" Text="Delete"
                                                            OnClientClick=" return confirm('Clicking ok will delete this record permanently.') "
                                                            OnClick="btnDelete_Click" />
                                                    </ItemTemplate>
                                                    <ItemStyle Width="80px" HorizontalAlign="Center"></ItemStyle>
                                                </asp:TemplateField>--%>
                </Columns>
            </asp:GridView>

        </div>
    </div>
</asp:Content>

