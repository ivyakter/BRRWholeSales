<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quickview.aspx.cs" Inherits="Pages_quick_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="description" content="Brr wholesales" />
    <meta name="keywords" content="Brr wholesales" />
    <meta name="robots" content="noodp,index,follow" />
    <meta name='revisit-after' content='1 days' />
    <title>Quick View</title>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,700' rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="../css/libs/font-awesome.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/bootstrap.min.css?v={2/version-1}" />
    <link rel="stylesheet" type="text/css" href="../css/libs/bootstrap-theme.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/jquery.fancybox.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/jquery-ui.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/owl.carousel.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/owl.transitions.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/owl.theme.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/jquery.mCustomScrollbar.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/animate.css" />
    <link rel="stylesheet" type="text/css" href="../css/libs/hover.css" />
    <link rel="stylesheet" type="text/css" href="../css/theme.css?v={2/version-1}" media="all" />
    <link rel="stylesheet" type="text/css" href="../css/color-orange.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../css/responsive.css" media="all" />
    <link rel="stylesheet" type="text/css" href="../css/browser.css" media="all" />
    <!-- <link rel="stylesheet" type="text/css" href="css/rtl.css" media="all"/> -->
</head>
<body style="background: #f4f4f4">
    <form id="form1" runat="server">
        <div class="wrap">
            <div id="content">
                <div class="content-page">
                    <div class="container">
                        <div class="product-quickview">

                            <div class="row text-center" style="background-color: #F44D60;">

                                <h4>
                                    <asp:Label runat="server" ID="lblproductname"></asp:Label></h4>

                            </div>
                            <div class="row text-center" style="background-color: #120C0CCF; color: white;">

                                <h4>
                                    <asp:Label runat="server" ID="lblProductcode"></asp:Label>

                                </h4>
                            </div>
                            <br />
                            <div class="row">

                                <div class="col-md-5 col-sm-6 col-xs-12">
                                    <div class="detail-gallery">

                                        <asp:Repeater runat="server" ID="rptrsingleimage">
                                            <ItemTemplate>
                                                <div class="mid">
                                                    <center>  <img src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="340" height="340" alt="<%#Eval("Name")%>" /></center>
                                                </div>
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
                                            <li><a href="#" class="soci-fa soc-facebook"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                            <li><a href="#" class="soci-fa soc-twitter"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                            <li><a href="#" class="soci-fa soc-twitter" style="background-color: red"><i class="fa fa-youtube" aria-hidden="true"></i></a></li>
                                            <li><a href="#" class="soci-fa soc-twitter" style="background-color: #125688"><i class="fa fa-instagram" aria-hidden="true"></i></a></li>
                                            <li><a href="#" class="soci-fa soc-twitter" style="background-color: #cb2027"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                            <li><a href="#" class="soci-fa soc-twitter" style="background-color: #007bb5"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                            
                                        </ul>
                                    </div>
                                </div>




                                <div class="col-md-7 col-sm-6 col-xs-12">



                                    <div class="detail-info">

                                        <!-- Nav tabs -->
                                        <div class="card">
                                            <ul class="nav nav-tabs"  role="tablist">
                                                <li role="presentation" class="active"><a href="#Price"  style="font-weight:bold; padding: 10px 5px !important;" aria-controls="home" role="tab" data-toggle="tab">Price</a></li>
                                                <li role="presentation"><a href="#Ingredients"  style="font-weight:bold; padding: 10px 5px !important;" aria-controls="profile" role="tab" data-toggle="tab">Ingredients</a></li>
                                                <li role="presentation"><a href="#Nutrition"  style="font-weight:bold; padding: 10px 5px !important; " aria-controls="messages" role="tab" data-toggle="tab">Nutrition value</a></li>
                                                <li role="presentation"><a href="#Allergy"  style="font-weight:bold; padding: 10px 5px !important;" aria-controls="settings" role="tab" data-toggle="tab">Allergy advice</a></li>
                                            </ul>

                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                                <asp:Repeater runat="server" ID="rptrproductinfo" OnItemDataBound="rptrproductinfo_ItemDataBound">
                                                    <ItemTemplate>

                                                        <div role="tabpanel" class="tab-pane active" id="Price">

                                                            <div class="product-price">

                                                                <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Collection Price :</span>  <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("CollectionPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label><br />
                                                                
                                                                <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Delivery Price :</span> <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("PSelPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999;font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label><br />
                                                                 <strong>Availability: </strong><asp:Label class="in-stock" runat="server" ID="lblInstock"></asp:Label>
                                                            </div>                                                        
                                                            <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />


                                                            <br />

                                                             <div class="carousel" style="padding-left: 125px">

                                                                <ul style="list-style: none;">
                                                                    <asp:Repeater runat="server" ID="rptrBrandimage">
                                                                        <ItemTemplate>
                                                                            <li style="height: 58px; float: left; padding: 5px">
                                                                                <img src="../BrandImage/<%#Eval("BID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="40" height="40" alt="<%#Eval("Name")%>" />
                                                                            </li>

                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </ul>

                                                            </div>

                                                            <br />

                                                            <div class="detail-extralink form-group">
                                                                <div class="detail-qty border radius">
                                                                    <asp:TextBox ID="txtqty" runat="server" TextMode="Number" Height="40px" Width="95%" min="1" max="50" Text="1" class="form-control"></asp:TextBox>
                                                                    <asp:RangeValidator ID="txt_12hours" runat="server" ControlToValidate="txtqty" ErrorMessage="Range 1-50" MaximumValue="50" MinimumValue="1" Type="Double" ForeColor="Red"></asp:RangeValidator>
                                                                </div>
                                                                <div class="product-extra-link2">

                                                                    <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click" runat="server" Text="Add To Cart" />

                                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click">Add To Cart</asp:LinkButton>--%>
                                                                    
                                                                </div>
                                                            </div>

                                                            <%--<div class="detail-extralink">
                                                                <div class="detail-qty border radius">
                                                                    <a href="#" class="qty-down"><i class="fa fa-caret-down" aria-hidden="true"></i></a>
                                                                    <span class="qty-val">1</span>
                                                                    <a href="#" class="qty-up"><i class="fa fa-caret-up" aria-hidden="true"></i></a>
                                                                </div>
                                                                <div class="product-extra-link2">
                                                                    <a class="addcart-link" href="#">Add to Cart</a>

                                                                </div>
                                                            </div>--%>
                                                        </div>

                                                        <div role="tabpanel" class="tab-pane" id="Ingredients">
                                                            <%# Server.HtmlDecode(Eval("PProductDetails").ToString()) %>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane" id="Nutrition">
                                                            <%#Eval("PPrice") %>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane" id="Allergy">
                                                            fourth
                                                        </div>

                                                    </ItemTemplate>
                                                </asp:Repeater>

                                            </div>
                                        </div>



                                    </div>


                                    <!-- Detail Info -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Content -->
        </div>
    </form>

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
</body>
</html>
