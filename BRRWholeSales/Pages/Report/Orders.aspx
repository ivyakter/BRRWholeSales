<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/AdminActivity.master" AutoEventWireup="true" CodeFile="Orders.aspx.cs" Inherits="Pages_Report_Orders" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">

   <%-- <div style="width:50%;float:left">

    </div>--%>


    <asp:ScriptManager runat="server" ID="sc1"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12">


            <asp:GridView ID="GvExistingOrder" runat="server" OnPageIndexChanging="GvExistingOrder_PageIndexChanging"  AutoGenerateColumns="false" CssClass="table table-striped table-bordered table-hover"
                SkinID="SampleGridView" AllowPaging="True" PageSize="20" Width="100%">
                <Columns>
                    <asp:TemplateField HeaderText="Order ID">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblorder" Text='<%# Eval("orderid")%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Customer Name">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblfname" Text='<%# Eval("FirstName")%>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="PreView">
                        <ItemTemplate>
                  
                            <asp:LinkButton ID="lnkBtnEdit"  runat="server" Text="Preview" CssClass="btn btn-info"
                                OnClick="Display"></asp:LinkButton>
                            <%--<a style="color:pink" data-toggle="modal" href="#myModal"><span class="ti-zoom-in" style="font-size:30px"></span></a>--%>
                        </ItemTemplate>
                    </asp:TemplateField>



                    <asp:TemplateField HeaderText="Delivery Date ">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbldeliverydate" Text=' <%# Eval("DeliveyDate","{0:d}")%>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Shopping Type ">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblshoppingtype" Text='<%# Eval("ShoppingType")%>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lblstatus" Text='<%# Eval("Status")%>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Total ">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbltotal" Text='<%# Eval("Total")%>'></asp:Label>

                        </ItemTemplate>
                    </asp:TemplateField>


                </Columns>
            </asp:GridView>

        </div>
    </div>



    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">
                        &times;</button>
                    <h4 class="modal-title">Order Details</h4>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12 col-sm-12 col-md-12 col-xs-12">
                        <div class="form-group">
                            <asp:Label ID="lblstudent" runat="server" Text="Aadmission No: "></asp:Label>
                            <asp:Label ID="lblstudentid" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="Label1" runat="server" Text="Month"></asp:Label>
                            <asp:Label ID="lblmonth" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="form-group">
                            <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>
                            <asp:TextBox ID="txtAmount" runat="server" TabIndex="3" MaxLength="75" CssClass="form-control"
                                placeholder="Enter Amount"></asp:TextBox>
                        </div>


                    </div>
                </div>
                <div class="modal-footer">
                    <%--<asp:Button ID="btnSave" runat="server" Text="Pay" OnClick="btnSave_Click" CssClass="btn btn-info" />--%>
                    <button type="button" class="btn btn-info" data-dismiss="modal">
                        Close</button>
                </div>
            </div>
        </div>

    </div>

     <div id="mask">
    </div>
    <asp:Panel ID="pnlpopup" runat="server" BackColor="White" Height="175px"
        Width="300px" Style="z-index: 111; background-color: White; position: absolute; left: 35%; top: 12%; border: outset 2px gray; padding: 5px; display: none">
        <table width="100%" style="width: 100%; height: 100%;" cellpadding="0" cellspacing="5">
            <tr style="background-color: #0924BC">
                <td colspan="2" style="color: White; font-weight: bold; font-size: 1.2em; padding: 3px"
                    align="center">Customer Details <a id="closebtn" style="color: white; float: right; text-decoration: none" class="btnClose" href="#">X</a>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 45%; text-align: center;">
                    <asp:Label ID="LabelValidate" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right" style="width: 45%">CustomerID:
                </td>
                <td>
                    <asp:Label ID="lblID" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">Contact Name:
                </td>
                <td>
                    <asp:Label ID="lblContactName" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right">Address:
                </td>
                <td>
                    <asp:TextBox ID="txtAddress" runat="server" />
                </td>
            </tr>
            <tr>
                <td align="right">City:
                </td>
                <td>
                    <asp:TextBox ID="txtCity" runat="server" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <%--<asp:Button ID="btnUpdate" CommandName="Update" runat="server" Text="Update" OnClick="btnUpdate_Click" />--%>
                    <input type="button" class="btnClose" value="Cancel" />
                </td>
            </tr>
        </table>
    </asp:Panel>


<%--                  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />--%>

      <script type='text/javascript'>


          function openModal() {
              
                    $('[id*=myModal]').modal('show');
                } 
            </script>

      
</asp:Content>

