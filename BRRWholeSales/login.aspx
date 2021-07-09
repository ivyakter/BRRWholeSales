<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="frmlogin" Title="Login to admin panel" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head runat="server">
    <title>Log in</title>
    <!-- Bootstrap 3.3.6 -->
    <link href="css/libs/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- iCheck -->
    <link href="css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="css/blue.css" rel="stylesheet" type="text/css" />
</head>
<body class="hold-transition login-page">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                </div>
                <div class="col-md-6">
                    <div class="login-box">
                        <div class="login-logo">
                            <a href="../../index2.html"><b>Login</b>Panel</a>
                        </div>
                        <!-- /.login-logo -->
                        <div class="login-box-body">
                            <p class="login-box-msg">Sign in to start your session</p>

                            <form action="../../index2.html" method="post">
                                <div class="form-group has-feedback">
                                    <asp:TextBox ID="txtusername" AutoPostBack="true" OnTextChanged="txtusername_TextChanged" runat="server" class="form-control"></asp:TextBox>
                                    <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
                                </div>
                                <div class="form-group has-feedback">
                                    <asp:TextBox ID="txtpassword" runat="server" class="form-control"
                                        TextMode="Password"></asp:TextBox>
                                    <span class="glyphicon glyphicon-lock form-control-feedback"></span>
                                </div>
                                <div class="row">
                                    <div class="col-xs-8">
                                        <div class="checkbox icheck">
                                        </div>
                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:CheckBox ID="remember" runat="server" Text="Remember Me" />
                                    </div>
                                    <!-- /.col -->
                                    <div class="col-xs-4">
                                        <asp:Button ID="btnlogin" runat="server" Text="Login"
                                            class="btn btn-primary btn-block btn-flat" OnClick="btnlogin_Click" />

                                    </div>
                                    <!-- /.col -->
                                </div>
                            </form>
                            <asp:Label ID="laMeg" runat="server"></asp:Label>
                            <div class="social-auth-links text-center">
                                <p>- OR -</p>
                                <asp:Button ID="btnCancel" runat="server"
                                    class="btn btn-primary btn-block btn-flat" Text="Cancel" Width="320px"
                                    OnClick="btnCancel_Click1" />
                                <a href="#" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i>Sign in using
        Facebook</a>
                                <a href="#" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i>Sign in using
        Google+</a>
                            </div>
                            <!-- /.social-auth-links -->
                            <asp:LinkButton ID="lbtnForgotPass" runat="server"
                                OnClick="lbtnForgotPass_Click"><b>Forgot Password</b></asp:LinkButton>

                            <asp:Label ID="label" Visible="false" runat="server"></asp:Label>
                            <asp:Label ID="label1" Visible="false" runat="server"></asp:Label>
                            <asp:Label ID="label2" Visible="false" runat="server"></asp:Label>
                            <asp:Label ID="label3" Visible="false" runat="server"></asp:Label>

                            <br />
                            <a href="#" class="text-center">Register a new membership</a>

                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                </div>
            </div>

        </div>



    </form>
    <script src="../../plugins/jQuery/jquery-2.2.3.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <!-- Bootstrap 3.3.6 -->
    <!-- iCheck -->
    <script src="../../plugins/iCheck/icheck.min.js"></script>
    <script>
        $(function () {
            $('input').iCheck({
                checkboxClass: 'icheckbox_square-blue',
                radioClass: 'iradio_square-blue',
                increaseArea: '20%' // optional
            });
        });
    </script>
</body>
</html>

