<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Details.aspx.cs" Inherits="Pages_Details" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Kuteshop is new Html theme that we have designed to help you transform your store into a beautiful online showroom. This is a fully responsive Html theme, with multiple versions for homepage and multiple templates for sub pages as well" />
    <meta name="keywords" content="kuteshop,7uptheme" />
    <meta name="robots" content="noodp,index,follow" />
    <meta name='revisit-after' content='1 days' />
    <title>Kute Shop | Product Detail</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="../css/libs/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/jquery.fancybox.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/owl.transitions.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/owl.theme.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/jquery.mCustomScrollbar.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/animate.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/hover.css" />
    <link rel="stylesheet" type="text/css" href="../css/color-orange.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../css/theme.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../css/responsive.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../css/browser.css" media="all" />
    <!-- <link rel="stylesheet" type="text/css" href="css/rtl.css" media="all"/> -->

    <style>
        #btnaddtocart {
            height: 38px;
            border-radius: 5px;
        }
    </style>
</head>
<body style="background: #f4f4f4">
    <form id="form1" runat="server">
        <div class="wrap">
            <div id="header">
                <div class="header">
                    <div class="top-header top-header4">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-6 col-md-offset-6">
                                

                                         <div class="currency-language">
                                        <div class="language-box">
                                            <a href="../Default.aspx" class="language-current">
                                                <span>Home</span>
                                            </a>                                          

                                        </div>

                                        <div class="language-box">
                                            <a href="#" class="language-current">
                                                <span>Log Out</span>
                                            </a>
                                        </div>
                                    </div>
                                     
                                
                               
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-6">
                                       <div class="currency-language currency-language3">
                                            <div class="language-box">
                                                <a href="#" class="language-current">
                                                    <i class="fa fa-user-circle-o" style="padding-top: 10px; padding-bottom: 5px; font-size: 30px;"></i></a>

                                                <ul class="language-list list-unstyled">
                                                    <li><a href="#" data-toggle="modal" data-target="#myModal">My Account</a></li>
                                                    <li><a href="#" data-toggle="modal" data-target="#myModal">checkout</a></li>
                                                    <%--<li><a href="#">Login</a></li>
                                                <li><a href="#">Register</a></li>--%>
                                                    <li><a href="#" data-toggle="modal" data-target="#myModal">LogIn / Register</a></li>
                                                </ul>
                                            </div>

                                        </div>
                                </div>
                            </div>
                        </div>
                    </div>

                         <%--//////////////////Register/////////////////////////--%>
                    <div class="modal fade" id="myModal" tabindex="-1" style="z-index: 99999;" role="dialog" aria-labelledby="myLargeModalLabel"
                        aria-hidden="true">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <asp:Button type="button" runat="server" ID="btnX" Text="X" class="close" data-dismiss="modal" aria-hidden="true"></asp:Button>
                                    <h4 class="modal-title" id="myModalLabel">Login/Registration</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-12" style="border-right: 1px dotted #C2C2C2; padding-right: 30px;">
                                            <!-- Nav tabs -->
                                            <ul class="nav nav-tabs">
                                                <li class="active"><a href="#Login" data-toggle="tab">Login</a></li>
                                                <li><a href="#Registration" data-toggle="tab">Registration</a></li>
                                            </ul>
                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                                <div class="tab-pane active" id="Login">

                                                    <div class="row form-group">
                                                        <asp:Label runat="server" ID="lblemial1" Text="Email" for="txtemail1" class="col-sm-3 col-sm-offset-2 control-label">
                                                        </asp:Label>
                                                        <div class="col-sm-4 input-group">

                                                            <asp:TextBox ID="txtemaillog" runat="server" CssClass="form-control" placeholder="User Name" />
                                                            <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtemaillog"></asp:RequiredFieldValidator>
                                                       <%-- <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemaillog" ErrorMessage="Invalid"></asp:RegularExpressionValidator>--%>
                                                    </div>
                                                    <div class="row form-group">
                                                        <asp:Label runat="server" ID="lblpass1" Text="Password" for="txtpass1" class="col-sm-3 col-sm-offset-2 control-label">
                                                        </asp:Label>
                                                        <div class="col-sm-4 input-group">
                                                            <asp:TextBox ID="txtpasslog" runat="server" TextMode="Password" CssClass="form-control" placeholder="Password" />
                                                            <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                        </div>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtpasslog"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <br />
                                                    <div class="row">

                                                        <div class="col-sm-8 col-sm-offset-3">
                                                            <asp:Button ID="btnlogin" runat="server" type="submit" CausesValidation="false" OnClick="btnlogin_Click" Text="Submit" CssClass="btn btn-primary btn-sm"></asp:Button>
                                                            <a href="javascript:;">Forgot your password?</a>&nbsp;&nbsp; || <a href="javascript:;">Forgot your password?Register</a>
                                                        </div>
                                                        <%--     <div class="col-md-4">
                                                                <a href="#">For New Customer ? <strong style="color:red">Register</strong></a>
                                                            </div>--%>
                                                    </div>
                                                    <br />


                                                </div>


                                                <div class="tab-pane" id="Registration">

                                                    <div class="col-md-6">


                                                        <div class="row form-group">
                                                            <asp:Label for="email" Text="First Name" runat="server" ID="lblname" class="col-sm-3  control-label">
                                                            </asp:Label>

                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">

                                                                    <asp:TextBox ID="txtfirstname" runat="server" CssClass="form-control" placeholder="First Name" />
                                                                    <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                                                                </div>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtfirstname"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="row form-group">
                                                            <asp:Label for="email" Text="Middle Name" runat="server" ID="Label2" class="col-sm-3 control-label">
                                                            </asp:Label>

                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtmiddlename" runat="server" CssClass="form-control" placeholder="Middle Name" />
                                                                    <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                                                                </div>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtmiddlename"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="row form-group">
                                                            <asp:Label Text="Last Name" runat="server" ID="Label3" class="col-sm-3  control-label">
                                                            </asp:Label>

                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">

                                                                    <asp:TextBox ID="txtlastname" runat="server" CssClass="form-control" placeholder="Last Name" />
                                                                    <span class="input-group-addon"><i class="fa fa-pencil"></i></span>

                                                                </div>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtlastname"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="row form-group">
                                                            <asp:Label ID="lblemaul2" runat="server" Text="Country" class="col-sm-3 control-label">
                                                            </asp:Label>
                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:DropDownList ID="ddlcountry" class="form-control" runat="server">
                                                                        <asp:ListItem>United Kingdoom</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <span class="input-group-addon"><i class="fa fa-globe"></i></span>
                                                                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtemail2"></asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <asp:Label runat="server" Text="Post Code" ID="Label4" class="col-sm-3 control-label">
                                                            </asp:Label>
                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtpostcode" runat="server" class="form-control" placeholder="Post Code" />
                                                                    <span class="input-group-addon"><i class="fa fa-pencil"></i></span>

                                                                </div>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtpostcode"></asp:RequiredFieldValidator>
                                                        </div>

                                                        <div class="row form-group">
                                                            <asp:Label runat="server" Text="Moblile" ID="Label8" class="col-sm-3  control-label">
                                                            </asp:Label>
                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtmobile" runat="server" class="form-control" placeholder="Moblile" />
                                                                    <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>
                                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtmobile"></asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </div>

                                                    <div class="col-md-6">


                                                        <div class="row form-group">
                                                            <asp:Label runat="server" Text="Landline" ID="Label5" class="col-sm-3  control-label">
                                                            </asp:Label>
                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtlandline" runat="server" class="form-control" placeholder="Landline" />
                                                                    <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>
                                                                    <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="This field is Required !" ControlToValidate="txtmobile"></asp:RequiredFieldValidator>--%>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <div class="row form-group">
                                                            <asp:Label runat="server" Text="Email" ID="Label6" class="col-sm-3  control-label">
                                                            </asp:Label>
                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Email" />
                                                                    <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>

                                                                </div>
                                                            </div>
                                                            <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ControlToValidate="txtemail" ErrorMessage="Invalid"></asp:RegularExpressionValidator>
                                                        </div>
                                                        <div class="row form-group">
                                                            <asp:Label runat="server" Text="Email confirmation" ID="Label7" class="col-sm-3 control-label">
                                                            </asp:Label>
                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtemailconfirm" runat="server" class="form-control" placeholder="Email confirmation" />
                                                                    <span class="input-group-addon"><i class="fa fa-phone-square"></i></span>

                                                                </div>
                                                            </div>
                                                            <asp:CompareValidator ID="CompareValidator2" runat="server" CssClass="ValidationError" ErrorMessage="Not Matched" ToolTip="Password must be the same" ControlToValidate="txtemailconfirm" ControlToCompare="txtemail"></asp:CompareValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtemailconfirm"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="row form-group">
                                                            <asp:Label Text="Password" runat="server" ID="lblpass2" class="col-sm-3  control-label">
                                                            </asp:Label>
                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" class="form-control" placeholder="Password" />
                                                                    <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                                                </div>
                                                            </div>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtpassword"></asp:RequiredFieldValidator>
                                                        </div>
                                                        <div class="row form-group">
                                                            <asp:Label Text="Confirm Password" runat="server" ID="Label1" class="col-sm-3  control-label">
                                                            </asp:Label>
                                                            <div class="col-sm-8 inputGroupContainer">
                                                                <div class="input-group">
                                                                    <asp:TextBox ID="txtpasswordconfirm" runat="server" TextMode="Password" class="form-control" placeholder="Confirm Password" />
                                                                    <span class="input-group-addon"><i class="fa fa-key"></i></span>

                                                                </div>
                                                            </div>
                                                            <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="ValidationError" ErrorMessage="Not Matched" ToolTip="Password must be the same" ControlToValidate="txtpasswordconfirm" ControlToCompare="txtpassword"></asp:CompareValidator>
                                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" CssClass="text-danger" runat="server" ErrorMessage="Must" ControlToValidate="txtpasswordconfirm"></asp:RequiredFieldValidator>
                                                        </div>
                                                    </div>

                                                    <div class="row"></div>
                                                    <hr />
                                                    <div class="row">
                                                        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <span>
                                                            <asp:CheckBox ID="chkagree" runat="server" />
                                                            I agree that I am 18 years or over and I also agreed with the BRR Whole Sale terms & conditions.</span>
                                                        <hr />
                                                        <div class="col-sm-7 col-sm-offset-5">
                                                            <asp:Button type="button" ID="btnsaveconti" runat="server" UseSubmitBehavior="false" CausesValidation="false" OnClick="btnsaveconti_Click" Text="Save & Continue" class="btn btn-primary btn-sm"></asp:Button>
                                                            <asp:Button runat="server" ID="btncancel" Text="Cancel" class="btn btn-default btn-sm"></asp:Button>
                                                            <asp:Label ID="lbl" runat="server" Text=""></asp:Label>
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







                    <!-- End Top Header -->
                    <div class="main-header">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-12">
                                    <div class="logo logo4">
                                        <h1 class="hidden">kuteshop wordpress theme</h1>
                                        <a href="index.html">
                                            <img src="../images/home4/logo.png" alt="" /></a>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="smart-search smart-search4">
                                        <div class="select-category">
                                            <a class="category-toggle-link" href="#"><span>All Categories</span></a>
                                            <ul class="list-category-toggle list-unstyled">
                                                <li><a href="#">Computer &amp; Office</a></li>
                                                <li><a href="#">Elextronics</a></li>
                                                <li><a href="#">Jewelry &amp; Watches</a></li>
                                                <li><a href="#">Home &amp; Garden</a></li>
                                                <li><a href="#">Bags &amp; Shoes</a></li>
                                                <li><a href="#">Kids &amp; Baby</a></li>
                                            </ul>
                                        </div>
                                        <div class="smart-search-form">
                                            <input type="text" onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" value="Search...">
                                            <input type="submit" value="">
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3 col-sm-3 col-xs-9">
                                    <div class="check-cart check-cart4">
                                        <div class="mini-cart-box">
                                            <a class="mini-cart-link" href="Cart/Cart.aspx">
                                                <span class="mini-cart-icon"><i class="fa fa-shopping-basket" aria-hidden="true"></i></span>
                                             &nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label runat="server" ID="lblcount" Font-Size="Medium" class="mini-cart-number border radius" Text="0"></asp:Label>
                                            </a>
                                            <div class="mini-cart-content">

                                                <h2>
                                                    <asp:Label runat="server" ID="lblcountinside" class="mini-cart-number border radius" Text="0"></asp:Label>
                                                    ITEMS IN MY CART</h2>

                                                <div class="mini-cart-button">
                                                    <a class="mini-cart-view" href="Cart/Cart.aspx">view my cart </a>
                                                    <a class="mini-cart-checkout" href="#">Checkout</a>
                                                </div>
                                            </div>
                                        </div>
                                    
                                    </div>
                                </div>
                             
                            </div>
                        </div>
                    </div>
                    <!-- End Main Header -->
                </div>


                <!-- End Header On Top -->
            </div>
            <!-- End Header -->
            <div id="content">
                <div class="content-page">
                    <div class="container">

                        <!-- End Bread Crumb -->
                        <div class="row">
                            <div class="col-md-9 col-sm-8 col-col-xs-12">
                                <div class="product-detail accordion-detail border radius">
                                    <div class="row">
                                        <div class="col-md-5 col-sm-12 col-xs-12">
                                            <div class="detail-gallery">

                                                <asp:Repeater runat="server" ID="rptrsingleimage">
                                                    <ItemTemplate>
                                                        <div class="mid">
                                                            <img src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                        </div>
                                                        <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                        <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    </ItemTemplate>
                                                </asp:Repeater>


                                                <div class="gallery-control" style="height: 70px">
                                                    <a href="#" class="prev"><i class="fa fa-angle-left"></i></a>
                                                    <div class="carousel">

                                                        <ul>
                                                            <asp:Repeater runat="server" ID="rptrthreeimage">
                                                                <ItemTemplate>
                                                                    <li style="height: 58px"><a href="#">
                                                                        <img src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" /></a>
                                                                    </li>

                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </ul>

                                                    </div>
                                                    <a href="#" class="next"><i class="fa fa-angle-right"></i></a>
                                                </div>
                                            </div>
                                            <!-- End Gallery -->
                                            <div class="detail-social">
                                                <ul class="list-social-detail list-inline-block">
                                                    <li><a href="#" class="soci-fa soc-tumblr"><i class="fa fa-tumblr" aria-hidden="true"></i></a></li>
                                                    <li><a href="#" class="soci-fa soc-facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                                    <li><a href="#" class="soci-fa soc-twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                                    <li><a href="#" class="soci-fa soc-print"><i class="fa fa-print" aria-hidden="true"></i></a></li>
                                                    <li>
                                                        <div class="more-social">
                                                            <a class="soci-fa add-link soc-add" href="#"><i aria-hidden="true" class="fa fa-plus"></i><span>7</span></a>
                                                            <ul class="list-social-share list-none">
                                                                <li><a href="#"><i class="fa fa-youtube" aria-hidden="true"></i><span>Youtute</span></a></li>
                                                                <li><a href="#"><i class="fa fa-linkedin"></i><span>linkedin</span></a></li>
                                                                <li><a href="#"><i class="fa fa-pinterest"></i><span>pinterest</span></a></li>
                                                                <li><a href="#"><i class="fa fa-google"></i><span>google</span></a></li>
                                                                <li><a href="#"><i class="fa fa-instagram"></i><span>instagram</span></a></li>
                                                                <li><a href="#"><i class="fa fa-flickr"></i><span>flickr</span></a></li>
                                                                <li><a href="#"><i class="fa fa-reddit"></i><span>reddit</span></a></li>
                                                            </ul>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="col-md-7 col-sm-12 col-xs-12">

                                            <div class="detail-info">

                                                <!-- Nav tabs -->
                                                <div class="card">
                                                    <ul class="nav nav-tabs" role="tablist">
                                                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Home</a></li>
                                                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Profile</a></li>
                                                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">Messages</a></li>
                                                        <li role="presentation"><a href="#settings" aria-controls="settings" role="tab" data-toggle="tab">Settings</a></li>
                                                    </ul>

                                                    <!-- Tab panes -->
                                                    <div class="tab-content">
                                                        <asp:Repeater runat="server" ID="rptrproductinfo">
                                                            <ItemTemplate>

                                                                <div role="tabpanel" class="tab-pane active" id="home">
                                                                    <h2 class="title-detail">New Favorite</h2>
                                                                    <div class="product-rate">
                                                                        <div class="product-rating" style="width: 90%"></div>
                                                                    </div>
                                                                    <p class="desc"><%# Server.HtmlDecode(Eval("PDescription").ToString()) %></p>

                                                                </div>

                                                                <div role="tabpanel" class="tab-pane" id="profile">
                                                                    <%# Server.HtmlDecode(Eval("PProductDetails").ToString()) %>
                                                                </div>
                                                                <div role="tabpanel" class="tab-pane" id="messages">
                                                                    <%#Eval("PPrice") %>
                                                                </div>
                                                                <div role="tabpanel" class="tab-pane" id="settings">
                                                                    fourth
                                                                </div>


                                                                <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                               <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                                <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                                <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                                <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                                <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                                <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                                <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />

                                                            </ItemTemplate>
                                                        </asp:Repeater>

                                                    </div>
                                                </div>


                                                <div class="available">
                                                    <strong>Availability: </strong>
                                                    <span class="in-stock">In Stock</span>
                                                </div>

                                                <div class="detail-extralink">

                                                    <div class="product-extra-link2">
                                                        <asp:Label runat="server" ID="lbllog" Visible="false"></asp:Label>
                                                        <%--<a class="addcart-link" href="#">Add to Cart</a>--%>
                                                        <asp:Button ID="btnaddtocart" CssClass="addcart-link" CausesValidation="false" OnClick="btnaddtocart_Click" runat="server" Text="Add Item" />

                                                    </div>
                                                </div>
                                            </div>
                                            <!-- Detail Info -->
                                        </div>
                                    </div>
                                    <div class="tab-detal toggle-tab">
                                        <div class="item-toggle-tab active">
                                            <h2 class="toggle-tab-title title14 radius border">Description</h2>
                                            <div class="toggle-tab-content">
                                                <div class="content-detail-tab">
                                                    <div class="detail-tab-thumb">
                                                        <img src="../images/shop/tab-img.png" alt="" />
                                                    </div>
                                                    <div class="detail-tab-info">
                                                        <p class="desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercit a tion ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen derit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident est laborum.</p>
                                                        <ul>
                                                            <li>Any Product types that You want - Simple, Configurable, Bundled and Grouped Products</li>
                                                            <li>Downloadable/Digital Products, Virtual Products</li>
                                                            <li>Inventory Management with Backordered items</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-toggle-tab">
                                            <h2 class="toggle-tab-title title14 radius border">Tags</h2>
                                            <div class="toggle-tab-content">
                                                <div class="content-detail-tab">
                                                    <div class="detail-tab-thumb">
                                                        <img src="../images/shop/tab-img.png" alt="" />
                                                    </div>
                                                    <div class="detail-tab-info">
                                                        <p class="desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercit a tion ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen derit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident est laborum.</p>
                                                        <ul>
                                                            <li>Any Product types that You want - Simple, Configurable, Bundled and Grouped Products</li>
                                                            <li>Downloadable/Digital Products, Virtual Products</li>
                                                            <li>Inventory Management with Backordered items</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-toggle-tab">
                                            <h2 class="toggle-tab-title title14 radius border">Reviews</h2>
                                            <div class="toggle-tab-content">
                                                <div class="content-detail-tab">
                                                    <div class="detail-tab-thumb">
                                                        <img src="../images/shop/tab-img.png" alt="" />
                                                    </div>
                                                    <div class="detail-tab-info">
                                                        <p class="desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercit a tion ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen derit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident est laborum.</p>
                                                        <ul>
                                                            <li>Any Product types that You want - Simple, Configurable, Bundled and Grouped Products</li>
                                                            <li>Downloadable/Digital Products, Virtual Products</li>
                                                            <li>Inventory Management with Backordered items</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-toggle-tab">
                                            <h2 class="toggle-tab-title title14 radius border">Sizing Guide</h2>
                                            <div class="toggle-tab-content">
                                                <div class="content-detail-tab">
                                                    <div class="detail-tab-thumb">
                                                        <img src="../images/shop/tab-img.png" alt="" />
                                                    </div>
                                                    <div class="detail-tab-info">
                                                        <p class="desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercit a tion ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen derit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident est laborum.</p>
                                                        <ul>
                                                            <li>Any Product types that You want - Simple, Configurable, Bundled and Grouped Products</li>
                                                            <li>Downloadable/Digital Products, Virtual Products</li>
                                                            <li>Inventory Management with Backordered items</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="item-toggle-tab">
                                            <h2 class="toggle-tab-title title14 radius border">Custom Tab</h2>
                                            <div class="toggle-tab-content">
                                                <div class="content-detail-tab">
                                                    <div class="detail-tab-thumb">
                                                        <img src="../images/shop/tab-img.png" alt="" />
                                                    </div>
                                                    <div class="detail-tab-info">
                                                        <p class="desc">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incidid unt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercit a tion ulla mco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehen derit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident est laborum.</p>
                                                        <ul>
                                                            <li>Any Product types that You want - Simple, Configurable, Bundled and Grouped Products</li>
                                                            <li>Downloadable/Digital Products, Virtual Products</li>
                                                            <li>Inventory Management with Backordered items</li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Main Detail -->
                                <div class="product-related border radius">
                                    <h2 class="title18">ALSO PURCHASED</h2>
                                    <div class="product-related-slider">
                                        <div class="wrap-item" data-itemscustom="[[0,1],[480,2],[1024,3],[1200,4]]" data-pagination="false" data-navigation="true">
                                            <div class="item-pro-color">
                                                <div class="product-thumb">
                                                    <a href="detail.html" class="product-thumb-link">
                                                        <img data-color="black" class="active" src="../images/photos/fashion/2.jpg" alt="">
                                                        <img data-color="purple" src="../images/photos/fashion/1.jpg" alt="">
                                                        <img data-color="blue" src="../images/photos/fashion/3.jpg" alt="">
                                                        <img data-color="cyan" src="../images/photos/fashion/4.jpg" alt="">
                                                    </a>
                                                    <a href="quick-view.html" class="quickview-link plus fancybox.iframe"><span>quick view</span></a>
                                                </div>
                                                <div class="product-info">
                                                    <div class="list-color">
                                                        <a href="#" data-color="black" style="background: #404040"></a>
                                                        <a href="#" data-color="purple" style="background: #ff8ff8"></a>
                                                        <a href="#" data-color="blue" style="background: #868fff"></a>
                                                        <a href="#" data-color="cyan" style="background: #80e6ff"></a>
                                                    </div>
                                                    <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                    <div class="product-price">
                                                        <ins><span>$360.00</span></ins>
                                                        <del><span>$400.00</span></del>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item-pro-color">
                                                <div class="product-thumb">
                                                    <div class="product-label">
                                                        <span class="new-label">new</span>
                                                        <span class="sale-label">sale</span>
                                                    </div>
                                                    <a href="detail.html" class="product-thumb-link">
                                                        <img data-color="yellow" class="active" src="../images/photos/fashion/9.jpg" alt="">
                                                        <img data-color="red" src="../images/photos/fashion/10.jpg" alt="">
                                                    </a>
                                                    <a href="quick-view.html" class="quickview-link plus fancybox.iframe"><span>quick view</span></a>
                                                </div>
                                                <div class="product-info">
                                                    <div class="list-color">
                                                        <a href="#" data-color="yellow" style="background: #ffdb33"></a>
                                                        <a href="#" data-color="red" style="background: #ff596d"></a>
                                                    </div>
                                                    <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                    <div class="product-price">
                                                        <ins><span>$360.00</span></ins>
                                                        <del><span>$400.00</span></del>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item-pro-color">
                                                <div class="product-thumb">
                                                    <a href="detail.html" class="product-thumb-link">
                                                        <img data-color="purple" class="active" src="../images/photos/fashion/8.jpg" alt="">
                                                        <img data-color="blue" src="../images/photos/fashion/7.jpg" alt="">
                                                    </a>
                                                    <a href="quick-view.html" class="quickview-link plus fancybox.iframe"><span>quick view</span></a>
                                                </div>
                                                <div class="product-info">
                                                    <div class="list-color">
                                                        <a href="#" data-color="purple" style="background: #ff8ff8"></a>
                                                        <a href="#" data-color="blue" style="background: #868fff"></a>
                                                    </div>
                                                    <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                    <div class="product-price">
                                                        <ins><span>$360.00</span></ins>
                                                        <del><span>$400.00</span></del>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item-pro-color">
                                                <div class="product-thumb">
                                                    <a href="detail.html" class="product-thumb-link">
                                                        <img data-color="black" class="active" src="../images/photos/fashion/10.jpg" alt="">
                                                        <img data-color="green" src="../images/photos/fashion/9.jpg" alt="">
                                                        <img data-color="blue" src="../images/photos/fashion/8.jpg" alt="">
                                                    </a>
                                                    <a href="quick-view.html" class="quickview-link plus fancybox.iframe"><span>quick view</span></a>
                                                </div>
                                                <div class="product-info">
                                                    <div class="list-color">
                                                        <a href="#" data-color="black" style="background: #404040"></a>
                                                        <a href="#" data-color="green" style="background: #c3f1c7"></a>
                                                        <a href="#" data-color="blue" style="background: #868fff"></a>
                                                    </div>
                                                    <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                    <div class="product-price">
                                                        <ins><span>$360.00</span></ins>
                                                        <del><span>$400.00</span></del>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item-pro-color">
                                                <div class="product-thumb">
                                                    <a href="detail.html" class="product-thumb-link">
                                                        <img data-color="purple" class="active" src="../images/photos/fashion/12.jpg" alt="">
                                                        <img data-color="blue" src="../images/photos/fashion/7.jpg" alt="">
                                                    </a>
                                                    <a href="quick-view.html" class="quickview-link plus fancybox.iframe"><span>quick view</span></a>
                                                </div>
                                                <div class="product-info">
                                                    <div class="list-color">
                                                        <a href="#" data-color="purple" style="background: #ff8ff8"></a>
                                                        <a href="#" data-color="blue" style="background: #868fff"></a>
                                                    </div>
                                                    <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                    <div class="product-price">
                                                        <ins><span>$360.00</span></ins>
                                                        <del><span>$400.00</span></del>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="item-pro-color">
                                                <div class="product-thumb">
                                                    <a href="detail.html" class="product-thumb-link">
                                                        <img data-color="black" class="active" src="../images/photos/fashion/13.jpg" alt="">
                                                        <img data-color="green" src="../images/photos/fashion/9.jpg" alt="">
                                                        <img data-color="blue" src="../images/photos/fashion/8.jpg" alt="">
                                                    </a>
                                                    <a href="quick-view.html" class="quickview-link plus fancybox.iframe"><span>quick view</span></a>
                                                </div>
                                                <div class="product-info">
                                                    <div class="list-color">
                                                        <a href="#" data-color="black" style="background: #404040"></a>
                                                        <a href="#" data-color="green" style="background: #c3f1c7"></a>
                                                        <a href="#" data-color="blue" style="background: #868fff"></a>
                                                    </div>
                                                    <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                    <div class="product-price">
                                                        <ins><span>$360.00</span></ins>
                                                        <del><span>$400.00</span></del>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Product Related -->
                            </div>
                            <div class="col-md-3 col-sm-4 col-col-xs-12">
                                <div class="sidebar sidebar-right">
                                    <div class="list-detail-adv">

                                        <asp:Repeater runat="server" ID="rptrsidebar">
                                            <ItemTemplate>

                                                <div class="detail-adv">
                                                    <a href="#">
                                                        <img src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" height="120" alt="<%#Eval("Name")%>" /></a>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <%--     <div class="detail-adv">
                                            <a href="#">
                                                <img class="radius wobble-horizontal" alt="" src="../images/shop/pro-adv2.jpg"></a>
                                        </div>
                                        <div class="detail-adv">
                                            <a href="#">
                                                <img class="radius wobble-horizontal" alt="" src="../images/shop/pro-adv3.jpg"></a>
                                        </div>--%>
                                    </div>
                                    <div class="widget widget-seller">
                                        <h2 class="widget-title title14">best sellers</h2>
                                        <div class="widget-content">
                                            <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1]]">
                                                <div class="list-pro-seller">
                                                    <div class="item-pro-seller">
                                                        <div class="product-thumb">
                                                            <a href="#" class="product-thumb-link">
                                                                <img src="../images/photos/homeware/8.jpg" alt="" /></a>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                            <div class="product-price">
                                                                <ins><span>$360.00</span></ins>
                                                                <del><span>$400.00</span></del>
                                                            </div>
                                                            <div class="product-rate">
                                                                <div style="width: 90%" class="product-rating"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-pro-seller">
                                                        <div class="product-thumb">
                                                            <a href="#" class="product-thumb-link">
                                                                <img src="../images/photos/homeware/2.jpg" alt="" /></a>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                            <div class="product-price">
                                                                <ins><span>$360.00</span></ins>
                                                                <del><span>$400.00</span></del>
                                                            </div>
                                                            <div class="product-rate">
                                                                <div style="width: 90%" class="product-rating"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-pro-seller">
                                                        <div class="product-thumb">
                                                            <a href="#" class="product-thumb-link">
                                                                <img src="../images/photos/homeware/9.jpg" alt="" /></a>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                            <div class="product-price">
                                                                <ins><span>$360.00</span></ins>
                                                                <del><span>$400.00</span></del>
                                                            </div>
                                                            <div class="product-rate">
                                                                <div style="width: 90%" class="product-rating"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="list-pro-seller">
                                                    <div class="item-pro-seller">
                                                        <div class="product-thumb">
                                                            <a href="#" class="product-thumb-link">
                                                                <img src="../images/photos/homeware/3.jpg" alt="" /></a>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                            <div class="product-price">
                                                                <ins><span>$360.00</span></ins>
                                                                <del><span>$400.00</span></del>
                                                            </div>
                                                            <div class="product-rate">
                                                                <div style="width: 90%" class="product-rating"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-pro-seller">
                                                        <div class="product-thumb">
                                                            <a href="#" class="product-thumb-link">
                                                                <img src="../images/photos/homeware/4.jpg" alt="" /></a>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                            <div class="product-price">
                                                                <ins><span>$360.00</span></ins>
                                                                <del><span>$400.00</span></del>
                                                            </div>
                                                            <div class="product-rate">
                                                                <div style="width: 90%" class="product-rating"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="item-pro-seller">
                                                        <div class="product-thumb">
                                                            <a href="#" class="product-thumb-link">
                                                                <img src="../images/photos/homeware/10.jpg" alt="" /></a>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-title"><a href="detail.html">new favorite</a></h3>
                                                            <div class="product-price">
                                                                <ins><span>$360.00</span></ins>
                                                                <del><span>$400.00</span></del>
                                                            </div>
                                                            <div class="product-rate">
                                                                <div style="width: 90%" class="product-rating"></div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End widget -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Content -->
            <div id="footer">
                <div class="footer footer4">

                    <div class="payment-method text-center">
                        <a href="#" class="wobble-vertical">
                            <img src="<%=Page.ResolveUrl("~")%>images/home4/pay1.png" alt="" /></a>
                        <a href="#" class="wobble-vertical">
                            <img src="<%=Page.ResolveUrl("~")%>images/home4/pay2.png" alt="" /></a>
                        <a href="#" class="wobble-vertical">
                            <img src="<%=Page.ResolveUrl("~")%>images/home4/pay3.png" alt="" /></a>
                        <a href="#" class="wobble-vertical">
                            <img src="<%=Page.ResolveUrl("~")%>images/home4/pay4.png" alt="" /></a>
                    </div>
                    <!-- End Payment -->
                  
                    <!-- End Footer Tab -->
                    <div class="footer-copyright">
                        <div class="container">
                            <div class="row">
                                <div class="col-md-8 col-sm-8 col-xs-12">
                                    <p class="copyright">Copyright © 2019 BRR WHOLE SALE All rights reserved.</p>
                                </div>
                                <div class="col-md-4 col-sm-4 col-xs-12">
                                    <p class="designby">Design by: <a href="mailto:PTI System">ptisystem.com</a></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Footer Copyright -->
                </div>
            </div>
            <!-- End Footer -->
            <a href="#" class="radius scroll-top"><i class="fa fa-angle-up" aria-hidden="true"></i></a>
        </div>       
        <script src="<%= Page.ResolveUrl("~")%>js/jquery.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/bootstrap.min.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery.fancybox.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery-ui.min.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/owl.carousel.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery.jcarousellite.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery.elevatezoom.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/TimeCircles.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/jquery.mCustomScrollbar.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/libs/wow.js"></script>
        <script type="text/javascript" src="<%= Page.ResolveUrl("~")%>js/theme.js"></script>
    </form>
</body>
</html>
