<%@ Page Language="C#" AutoEventWireup="true" CodeFile="8000.aspx.cs" Inherits="_8000" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Admin Login</title>

      <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css' />
    <%--   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />--%>
    <link rel="stylesheet" type="text/css" href="css/libs/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/jquery.fancybox.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/owl.transitions.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/owl.theme.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/jquery.mCustomScrollbar.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/animate.css" />
    <link rel="stylesheet" type="text/css" href="css/libs/hover.css" />
    <link rel="stylesheet" type="text/css" href="css/color-magenta3.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/theme.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/responsive.css" media="all" />
    <link rel="stylesheet" type="text/css" href="css/browser.css" media="all" />

    <style>
        body {
            font-family: Arial, Helvetica, sans-serif;
        }

        #frmid {
            border: 3px solid #f1f1f1;
        }

        input {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        .button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

            .button:hover {
                opacity: 0.8;
            }

        .cancelbtn {
            width: auto;
            padding: 10px 18px;
            background-color: #f44336;
        }

        .imgcontainer {
            text-align: center;
            margin: 24px 0 12px 0;
        }

        img.avatar {
            width: 40%;
            border-radius: 50%;
        }

        .container {
            padding: 16px;
        }

        span.psw {
            float: right;
            padding-top: 16px;
        }

        /* Change styles for span and cancel button on extra small screens */
        /*@media screen and (max-width: 300px) {
            span.psw {
                display: block;
                float: none;
            }

            .cancelbtn {
                width: 100%;
            }
        }*/
    </style>


</head>
<body>
    <form id="form1" runat="server">
      
           <h2 style="text-align:center">Login Form</h2>
        <div id="frmid" class="col-md-offset-4 col-md-4" >
           

            <div class="imgcontainer">
                <img src="images/Avatar/img_avatar2.png" alt="Avatar" class="avatar"/>
            </div>

            <div class="container">
                <label for="uname"><b>Username</b></label>
                <asp:TextBox ID="txtemaillog" CssClass="input" placeholder="Enter Username" runat="server"></asp:TextBox>
          

                <label for="psw"><b>Password</b></label>
           
                    <asp:TextBox ID="txtpasslog" runat="server"  TextMode="Password" CssClass="form-control input" placeholder="Enter Password" />
          
                   <asp:Button runat="server" ID="btnlogin" OnClick="btnlogin_Click" CssClass="button" Text="Login" />
            
                    <div class="row">
                        <div class="col-md-2">
                              <asp:CheckBox runat="server" ID="chk" Checked="true" />
                        </div>
                        <div class="col-md-4">
                             Remember me
                        </div>                                   
                    </div>                           
            </div>

            <div class="container" style="background-color: #f1f1f1">
                <asp:Button runat="server" ID="btncancel" CssClass="cancelbtn button" Text="Cancel" />
            
                <span class="psw">Forgot <a href="#">password?</a></span>
            </div>
        </div>




    </form>

    <script src="<%= Page.ResolveUrl("~")%>js/jquery.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/bootstrap.min.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery.fancybox.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/owl.carousel.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery.jcarousellite.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery.elevatezoom.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery.mCustomScrollbar.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/TimeCircles.js"></script>
    <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/theme.js"></script>
</body>
</html>
