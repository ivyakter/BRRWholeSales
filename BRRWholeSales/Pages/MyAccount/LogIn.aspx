<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="LogIn.aspx.cs" Inherits="Pages_MyAccount_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div>
        <div class="modal-dialog modal-md">
            <div class="modal-content">
                <div class="modal-header">
                  <%--  <asp:Button type="button" runat="server" ID="btnX" Text="X" class="close" data-dismiss="modal" aria-hidden="true"></asp:Button>--%>
                    <h2 class="modal-title text-center" id="myModalLabel">Login</h2>
                </div>
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                            <!-- Nav tabs -->
                            <%--   <ul class="nav nav-tabs">
                                                <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                                               
                                            </ul>--%>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="Login">

                                    <div class="row form-group">
                                        <asp:Label runat="server" ID="lblemial1" Text="Email" for="txtemail1" class="col-sm-3 col-sm-offset-1 control-label">
                                        </asp:Label>
                                        <div class="col-sm-6 input-group">

                                            <asp:TextBox ID="txtemaillog" runat="server" ValidationGroup="login" CssClass="form-control" placeholder="Please Enter Email" />
                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                    </div>
                                    <div class="row form-group">
                                        <asp:Label runat="server" ID="lblpass1" Text="Password" for="txtpass1" class="col-sm-3 col-sm-offset-1 control-label">
                                        </asp:Label>
                                        <div class="col-sm-6 input-group">
                                            <asp:TextBox ID="txtpasslog" ValidationGroup="login" runat="server" TextMode="Password" OnTextChanged="txtpasslog_TextChanged" CssClass="form-control" placeholder="Please Enter Password" />
                                            <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                        </div>
                                        <div class="col-md-2">
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">

                                        <div class="col-md-8 col-md-offset-1">
                                            <asp:Button ID="btnlogin" runat="server" ValidationGroup="login" CausesValidation="false" OnClick="btnlogin_Click" Text="Login" CssClass="buttonstyle"></asp:Button>
                                            <a href="<%= Page.ResolveUrl("~")%>Pages/MyAccount/ForgetPassword.aspx">Forgot your password  ?</a>&nbsp;&nbsp; || <a href="<%= Page.ResolveUrl("~")%>Pages/MyAccount/Registration.aspx">Register</a>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ValidationGroup="login" CssClass="text-danger" runat="server" ErrorMessage="Email Is Required" ControlToValidate="txtemaillog"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator4"
                                                runat="server" ErrorMessage="Invalid Email"
                                                ValidationGroup="login" ControlToValidate="txtemaillog"
                                                CssClass="requiredFieldValidateStyle"
                                                ForeColor="Red"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">
                                            </asp:RegularExpressionValidator>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ValidationGroup="login" CssClass="text-danger" runat="server" ErrorMessage="Password Is Required" ControlToValidate="txtpasslog"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

