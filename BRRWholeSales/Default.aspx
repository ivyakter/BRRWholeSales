<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" MaintainScrollPositionOnPostback="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label runat="server" ID="lblloigin" Visible="false"></asp:Label>

    <!-- End Header -->
    <div id="content">
        <div class="container">
            <div class="content-top12">
                <div class="row">
                    <div class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                        <div class="wrap-cat-icon wrap-cat-icon12">
                            <h2 class="title14 title-cat-icon">Shopping Categories</h2>

                            <ul class="list-cat-icon">
                                <li class="has-cat-mega">
                                    <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=1">
                                        <span>Popular </span>
                                        <i class='fa fa-star-o pull-right'></i>
                                    </a>
                                </li>
                            </ul>
                            <ul class="list-cat-icon">

                                <asp:Repeater ID="rptrMain" runat="server" OnItemDataBound="rptrMain_ItemDataBound">
                                    <ItemTemplate>
                                        <li class="has-cat-mega">
                                            <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=<%# Eval("Id")%> ">

                                                <%--    <i class='fa <%#Eval("MenuText") %>'></i><span><%#Eval("Icon") %></span> <i class="fa fa-angle-left pull-right"></i>--%>

                                                <span><%#Eval("MenuText") %> </span>
                                                <i class='fa <%#Eval("Icon") %> pull-right'></i>
                                            </a>
                                            <div class="cat-mega-menu cat-mega-style1">
                                                <h2 class="title-cat-mega-menu"><%#Eval("MenuText") %></h2>
                                                <asp:HiddenField ID="hfCateId" runat="server" Value='<%#Eval("Id") %>' />

                                                <asp:Repeater ID="rptrSubCate" runat="server">
                                                    <HeaderTemplate>
                                                        <ul>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <%--<li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                    <FooterTemplate>
                                                        </ul>
                                                    </FooterTemplate>
                                                </asp:Repeater>

                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                            <ul class="list-cat-icon">
                                <li class="has-cat-mega">
                                    <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=13 ">
                                        <span>Sales </span>
                                        <i class='fa fa-star-o pull-right'></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-9 col-sm-8 col-xs-12">
                        <div class="banner-slider banner-slider12">
                            <div class="wrap-item" data-pagination="false" data-autoplay="true" data-transition="fade" data-navigation="true" data-itemscustom="[[0,1]]">


                                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                                    <ol class="carousel-indicators">

                                        <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
                                        <li data-target="#myCarousel" data-slide-to="2"></li>
                                        <li data-target="#myCarousel" data-slide-to="3"></li>
                                        <li data-target="#myCarousel" data-slide-to="4"></li>
                                        <li data-target="#myCarousel" data-slide-to="5"></li>

                                    </ol>
                                    <div class="carousel-inner">

                                        <div class="item active sliderimage">
                                            <div class="banner-thumb">
                                                <a href="#">

                                                    <img class="img-responsive sliderimage" src="SliderImage/1.jpg" alt="Chicago" />
                                                </a>
                                            </div>

                                            <div class="banner-info white bg-color animated" data-animated="slideInUp">
                                                <h2 class="animated" data-animated="slideInLeft">
                                                    <asp:Label runat="server" ID="firstslidertitle"></asp:Label></h2>
                                                <p class="animated" data-animated="slideInRight">
                                                    <asp:Label runat="server" ID="firstsliderdetails"></asp:Label>
                                                </p>
                                            </div>

                                        </div>
                                        <div class="item sliderimage">

                                            <div class="banner-thumb">
                                                <a href="#">
                                                    <img class="img-responsive sliderimage" src="SliderImage/2.jpg" alt="New york">
                                                </a>
                                            </div>
                                            <div class="banner-info white bg-color animated" data-animated="slideInUp">
                                                <h2 class="animated" data-animated="slideInLeft">
                                                    <asp:Label runat="server" ID="secondslidertitle"></asp:Label></h2>
                                                <p class="animated" data-animated="slideInRight">
                                                    <asp:Label runat="server" ID="secondsliderdetails"></asp:Label>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="item sliderimage">
                                            <div class="banner-thumb">
                                                <a href="#">
                                                    <img class="img-responsive sliderimage" src="SliderImage/3.jpg" alt="Chicago" />
                                                </a>
                                            </div>
                                            <div class="banner-info white bg-color animated" data-animated="slideInUp">
                                                <h2 class="animated" data-animated="slideInLeft">
                                                    <asp:Label runat="server" ID="thirdslidertitle"></asp:Label></h2>
                                                <p class="animated" data-animated="slideInRight">
                                                    <asp:Label runat="server" ID="thirdsliderdetails"></asp:Label></p>
                                            </div>

                                        </div>
                                        <div class="item sliderimage">
                                            <div class="banner-thumb">
                                                <a href="#">

                                                    <img class="img-responsive sliderimage" src="SliderImage/4.jpg" alt="Chicago" />
                                                </a>
                                            </div>
                                            <div class="banner-info white bg-color animated" data-animated="slideInUp">
                                                <h2 class="animated" data-animated="slideInLeft">
                                                    <asp:Label runat="server" ID="fourthslidertitle"></asp:Label></h2>
                                                <p class="animated" data-animated="slideInRight">
                                                    <asp:Label runat="server" ID="fourthsliderdetails"></asp:Label>
                                                </p>
                                            </div>

                                        </div>
                                        <div class="item sliderimage">
                                            <div class="banner-thumb">
                                                <a href="#">
                                                    <img class="img-responsive sliderimage" src="SliderImage/5.jpg" alt="New york" />
                                                </a>
                                            </div>
                                            <div class="banner-info white bg-color animated" data-animated="slideInUp">
                                                <h2 class="animated" data-animated="slideInLeft">
                                                    <asp:Label runat="server" ID="fifthslidertitle"></asp:Label></h2>
                                                <p class="animated" data-animated="slideInRight">
                                                    <asp:Label runat="server" ID="fifthsliderdetails"></asp:Label>
                                                </p>
                                            </div>

                                        </div>

                                    </div>
                                    <%-- <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span><span class="sr-only">Previous</span> </a>
                                    <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span><span class="sr-only">Next</span> </a>--%>
                                    <a class="left carousel-control" href="#myCarousel" data-slide="prev"><span class="fa fa-angle-left" style="padding-top: 270px; font-size: 48px;"></span><span class="sr-only">Previous</span> </a>
                                    <a class="right carousel-control" href="#myCarousel" data-slide="next"><span class="fa fa-angle-right" style="padding-top: 270px; font-size: 48px;"></span><span class="sr-only">Next</span> </a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-12 col-sm-12 col-xs-12">
                        <div class="supper-deal12 top-review11">
                            <h2 class="title14 title-top12">
                                <asp:Label runat="server" ID="lblOffer"></asp:Label></h2>
                            <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1]]">

                                <div class="list-pro-seller clearfix">
                                    <asp:Repeater runat="server" ID="rptrsuperdeals" OnItemDataBound="rptrMain_ItemDataBound1">
                                        <ItemTemplate>
                                            <div class="item-pro-seller">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                        <span style="font-size: x-small"><%# Eval("OccationRemain") %></span>
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>
                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title" style="font-size: 10px; font-weight: bold;"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' ><%# Eval("PName") %></a></h3>

                                                    <div class="product-price">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("PSelPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999;font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label><br />
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span>  <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("CollectionPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>

                                                        <br />



                                                    </div>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>


                            </div>
                            <div class="banner-zoom">
                                <a href="#" class="thumb-zoom">

                                    <asp:LinkButton ID="Allsuperdeals" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="Allsuperdeals_Click"> View All</asp:LinkButton>


                                    <%--    <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                          <i class="fa fa-shopping-basket"></i> All Products</asp:LinkButton>--%>
                                    <%--   <img src="images/photos/home12/ad-3.png" alt="" />--%>

                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Content Top -->
            <div class="hot-product12">
                <%--   <h2 class="title-hot12 title24 text-center"><span>hot products</span></h2>--%>

                <div class="product-tab12">
                    <div class="title-tab12">
                        <ul class="list-none">
                            <li class="active"><a href="#fas2" data-toggle="tab">Home new arrivals</a></li>
                            <li><a href="#fas1" data-toggle="tab">Home Best sellers</a></li>
                            <li><a href="#fas3" data-toggle="tab">Home On Sale</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <!-- End Tab -->
                        <div id="fas2" class="tab-pane active">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">

                                    <asp:Repeater ID="rptrHotnewarrivalProducts" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">

                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> <del style="color: #999; font-size: small"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                        <br />
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins> <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                    </div>

                                                    <br />
                                                    <div>
                                                        <%--  <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("SubCategoryID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />

                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>


                        <div id="fas1" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">

                                    <asp:Repeater ID="rptrHotbestsellersProducts" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <%--<a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="Pages/quickview-link plus fancybox.iframe">quick view</a>--%>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>
                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> <del style="color: #999; font-size: small"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                        <br />
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins> <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>

                        <!-- End Tab -->
                        <div id="fas3" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrHotdealsProducts" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <%--<a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="Pages/quickview-link plus fancybox.iframe">quick view</a>--%>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>
                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> <del style="color: #999; font-size: small"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                        <br />
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins> <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--  <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%--  <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                    </div>
                </div>

            </div>
            <!-- End Hot Product -->
        </div>

        <div class="product-box12">
            <div class="container">
                <div class="header-box12">
                    <h2 class="title24">Food Cupboard</h2>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <ul class="list-cat-icon">
                                <li class="has-cat-mega">
                                    <asp:Repeater ID="rptrSubCateFoodcupboard" runat="server">
                                        <HeaderTemplate>
                                            <ul>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%-- <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                            <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9 col-sm-12">
                            <div class="banner-box banner-box12">
                                <a href="#" class="link-banner-box">
                                    <%-- <asp:Image runat="server" ID="foodcupboaedbanner" ImageUrl="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" />
                                    <img src="images/photos/home12/fashion/food.jpg" alt="" /></a>--%>

                                    <asp:Repeater ID="rptrfoodcupboardimage" runat="server">
                                        <ItemTemplate>
                                            <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="580" height="300" alt="<%#Eval("Name")%>" />


                                            <div class="banner-info">
                                                <h2 class="title24"><%#Eval("Title")%></h2>
                                                <h3 class="title18 color"><%#Eval("Description")%></h3>
                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=<%# Eval("Id")%> " class="shopnow">Shop now</a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12">
                            <div class="list-banner-zoom12">
                                <div class="row">

                                    <asp:Repeater ID="rptrfoodcupboardthumbimage" runat="server">
                                        <ItemTemplate>


                                            <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                                <div class="banner-zoom banner-zoom12">
                                                    <a href="#" class="thumb-zoom">
                                                        <%--  <img src="images/photos/home12/fashion/banner-2.png" alt="" /></a>--%>
                                                        <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Header Box -->
                <div class="product-tab12">
                    <div class="title-tab12">
                        <ul class="list-none">
                            <li class="active"><a href="#fas1" data-toggle="tab">new arrivals</a></li>
                            <li><a href="#fas2" data-toggle="tab">Best sellers</a></li>
                            <li><a href="#fas3" data-toggle="tab">On Sale</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div id="Div1" class="tab-pane active">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">

                                    <asp:Repeater ID="rptrFoodcupboardnewarrivals" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">

                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins>&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>

                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins> <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--   <span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="Div2" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrFoodcupboardbestsellers" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="Pages/quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins>
                                                        <asp:Label runat="server" ID="Collectionoldprice">  <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>

                                                    <div class="product-price" style="text-align: left">
                                                        <span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>
                                                        <asp:Label runat="server" ID="lvldell">  <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%-- <span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />

                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="Div3" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrFoodcupboarddeals" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="Pages/quickview-link plus fancybox.iframe">quick view</a>
                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <span style="font-size: small">Col :</span>£<ins><span><%# Eval("CollectionPrice") %></span></ins>
                                                        <asp:Label runat="server" ID="Collectionoldprice">  <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>

                                                    <div class="product-price" style="text-align: left">
                                                        <span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>
                                                        <asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%-- <span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--   <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%--<asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                    </div>
                </div>
                <!-- End Product Tab -->
            </div>
        </div>
        <!-- End Product Box -->



        <div class="product-box12 block-orange">
            <div class="container">
                <div class="header-box12">
                    <h2 class="title24">Fresh</h2>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <ul class="list-cat-icon">
                                <li class="has-cat-mega">
                                    <asp:Repeater ID="rptrforFresh" runat="server">
                                        <HeaderTemplate>
                                            <ul>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                            <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9 col-sm-12">
                            <div class="banner-box banner-box12">
                                <a href="#" class="link-banner-box">
                                    <%-- <img src="images/photos/home12/electronics/fresh.jpg" alt="" />--%>

                                    <asp:Repeater ID="rptrfresgbannerimage" runat="server">
                                        <ItemTemplate>
                                            <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="580" height="300" alt="<%#Eval("Name")%>" />


                                            <div class="banner-info">
                                                <h2 class="title24"><%#Eval("Title")%></h2>
                                                <h3 class="title18 color"><%#Eval("Description")%></h3>
                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=<%# Eval("Id")%> " class="shopnow">Shop now</a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12">
                            <div class="list-banner-zoom12">
                                <div class="row">
                                    <asp:Repeater ID="rptrfresgthumbimage" runat="server">
                                        <ItemTemplate>


                                            <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                                <div class="banner-zoom banner-zoom12">
                                                    <a href="#" class="thumb-zoom">
                                                        <%--<img src="images/photos/home12/electronics/freshsmall1.png" alt="" />--%>
                                                        <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Header Box -->
                <div class="product-tab12">
                    <div class="title-tab12">
                        <ul class="list-none">
                            <li class="active"><a href="#ele1" data-toggle="tab">new arrivals</a></li>
                            <li><a href="#ele2" data-toggle="tab">Best sellers </a></li>
                            <li><a href="#ele3" data-toggle="tab">On Sale</a></li>
                        </ul>
                    </div>

                    <div class="tab-content">
                        <div id="ele1" class="tab-pane active">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">

                                    <asp:Repeater ID="rptrFreshnewarrivalproduct" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> <del style="color: #999; font-size: small"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                        <br />
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins> <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--  <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="ele2" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrFreshbestsellersproduct" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> <del style="color: #999; font-size: small"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                        <br />
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins> <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <br />
                                                    <div class="">
                                                        <%--  <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="ele3" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrFreshdealsproduct" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> <del style="color: #999; font-size: small"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                        <br />
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins> <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <br />
                                                    <div class="">
                                                        <%--  <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                    </div>

                </div>
                <!-- End Product Tab -->
            </div>
        </div>



        <!-- End Product Box -->
        <div class="product-box12 block-green">
            <div class="container">
                <div class="header-box12">
                    <h2 class="title24">Drink and beverage </h2>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <ul class="list-cat-icon">
                                <li class="has-cat-mega">
                                    <asp:Repeater ID="rptrdrinkandbreverage" runat="server">
                                        <HeaderTemplate>
                                            <ul>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%-- <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                            <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9 col-sm-12">
                            <div class="banner-box banner-box12">
                                <a href="#" class="link-banner-box">
                                    <%--<img src="images/photos/home12/electronics/drink.jpg" alt="" />--%>
                                    <asp:Repeater ID="rptrdrinkandbreveragebanner" runat="server">
                                        <ItemTemplate>
                                            <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="580" height="300" alt="<%#Eval("Name")%>" />


                                            <div class="banner-info">
                                                <h2 class="title24"><%#Eval("Title")%></h2>
                                                <h3 class="title18 color"><%#Eval("Description")%></h3>
                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=<%# Eval("Id")%> " class="shopnow">Shop now</a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12">
                            <div class="list-banner-zoom12">
                                <div class="row">
                                    <asp:Repeater ID="rptrdrinkandthumpimage" runat="server">
                                        <ItemTemplate>


                                            <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                                <div class="banner-zoom banner-zoom12">
                                                    <a href="#" class="thumb-zoom">
                                                        <%--  <img src="images/photos/home12/electronics/drinksmall1.jpg" alt="" />--%>
                                                        <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                </div>
                                            </div>


                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Header Box -->
                <div class="product-tab12">
                    <div class="title-tab12">
                        <ul class="list-none">
                            <li class="active"><a href="#hom1" data-toggle="tab">new arrivals</a></li>
                            <li><a href="#hom2" data-toggle="tab">Best sellers</a></li>
                            <li><a href="#hom3" data-toggle="tab">On Sale</a></li>
                        </ul>
                    </div>

                    <div class="tab-content">
                        <div id="hom1" class="tab-pane active">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">

                                    <asp:Repeater ID="rptrdrinkandbrevaragebestnewarrivals" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins>&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins><del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%-- <span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="hom2" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrdrinkandbrevaragebestsells" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins><del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%-- <span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="hom3" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrdrinkandbrevaragedeals" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins><del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%-- <span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                    </div>

                </div>
                <!-- End Product Tab -->
            </div>
        </div>



        <!-- End Product Box -->
        <div class="product-box12 block-yellow hidden">
            <div class="container">
                <div class="header-box12">
                    <h2 class="title24">Dairy and Cheese</h2>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <ul class="list-cat-icon">
                                <li class="has-cat-mega">
                                    <asp:Repeater ID="rptrdairyandchese" runat="server">
                                        <HeaderTemplate>
                                            <ul>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                            <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9 col-sm-12">
                            <div class="banner-box banner-box12">
                                <a href="#" class="link-banner-box">
                                    <%-- <img src="images/photos/home12/electronics/cheese.jpg" alt="" />--%>
                                    <asp:Repeater ID="rptrdairyandcheese" runat="server">
                                        <ItemTemplate>
                                            <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="580" height="300" alt="<%#Eval("Name")%>" />


                                            <div class="banner-info">
                                                <h2 class="title24"><%#Eval("Title")%></h2>
                                                <h3 class="title18 color"><%#Eval("Description")%></h3>
                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=<%# Eval("Id")%> " class="shopnow">Shop now</a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12">
                            <div class="list-banner-zoom12">
                                <div class="row">
                                    <asp:Repeater ID="rptrdairyandcheesethumbimage" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                                <div class="banner-zoom banner-zoom12">
                                                    <a href="#" class="thumb-zoom">

                                                        <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Header Box -->
                <div class="product-tab12">
                    <div class="title-tab12">
                        <ul class="list-none">
                            <li class="active"><a href="#spo1" data-toggle="tab">new arrivals</a></li>
                            <li><a href="#spo2" data-toggle="tab">Best sellers</a></li>
                            <li><a href="#spo3" data-toggle="tab">On Sale</a></li>
                        </ul>
                    </div>

                    <div class="tab-content">
                        <div id="spo1" class="tab-pane active">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">

                                    <asp:Repeater ID="rptrdairyandcheesenewarrival" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>

                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--   <span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%--  <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="spo2" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrdairyandcheesebestsells" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="Pages/quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>
                                                        <asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--<span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%--<asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="spo3" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrdairyandcheesedeals" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="Pages/quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"> <span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"> <span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--<span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--<asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%--<asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                    </div>

                </div>
                <!-- End Product Tab -->
            </div>
        </div>
        <!-- End Products-->
        <div class="product-box12 block-purple hidden">
            <div class="container">
                <div class="header-box12">
                    <h2 class="title24">Packaging & disposable</h2>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <ul class="list-cat-icon">
                                <li class="has-cat-mega">
                                    <asp:Repeater ID="rptrpacaginganddisposal" runat="server">
                                        <HeaderTemplate>
                                            <ul>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                            <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9 col-sm-12">
                            <div class="banner-box banner-box12">
                                <a href="#" class="link-banner-box">
                                    <%--  <img src="images/photos/home12/electronics/frozen.jpg" alt="" />--%>
                                    <asp:Repeater ID="rptrpackaginganddisposalbanner" runat="server">
                                        <ItemTemplate>
                                            <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="580" height="300" alt="<%#Eval("Name")%>" />


                                            <div class="banner-info">
                                                <h2 class="title24"><%#Eval("Title")%></h2>
                                                <h3 class="title18 color"><%#Eval("Description")%></h3>
                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=<%# Eval("Id")%> " class="shopnow">Shop now</a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12">
                            <div class="list-banner-zoom12">
                                <div class="row">
                                    <asp:Repeater ID="rptrpackaginganddisposalthumbimage" runat="server">
                                        <ItemTemplate>
                                            <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                                <div class="banner-zoom banner-zoom12">
                                                    <a href="#" class="thumb-zoom">

                                                        <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                </div>
                                            </div>

                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Header Box -->
                <div class="product-tab12">
                    <div class="title-tab12">
                        <ul class="list-none">
                            <li class="active"><a href="#rea1" data-toggle="tab">new arrivals</a></li>
                            <li><a href="#rea2" data-toggle="tab">Best sellers</a></li>
                            <li><a href="#rea3" data-toggle="tab">On Sale</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div id="rea1" class="tab-pane active">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">

                                    <asp:Repeater ID="rptrpackaginganddisposalnewarrival" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins> <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%-- <span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--<asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="rea2" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrpackaginganddisposalbestsellers" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="Pages/quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--<span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--<asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="rea3" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrpackaginganddisposaldeals" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="Pages/quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>
                                                        <asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--<span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%-- <asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%--  <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                    </div>
                </div>
                <!-- End Product Tab -->
            </div>
        </div>

        <!-- End Product Box -->
        <div class="product-box12 block-purple">
            <div class="container">
                <div class="header-box12">
                    <h2 class="title24">Frozen Food</h2>
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <ul class="list-cat-icon">
                                <li class="has-cat-mega">
                                    <asp:Repeater ID="rptrfrozenfood" runat="server">
                                        <HeaderTemplate>
                                            <ul>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                            <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </ul>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </li>
                            </ul>
                        </div>
                        <div class="col-lg-6 col-md-9 col-sm-12">
                            <div class="banner-box banner-box12">
                                <a href="#" class="link-banner-box">
                                    <%--  <img src="images/photos/home12/electronics/frozen.jpg" alt="" />--%>
                                    <asp:Repeater ID="rptrfrozenfoodbanner" runat="server">
                                        <ItemTemplate>
                                            <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="580" height="300" alt="<%#Eval("Name")%>" />


                                            <div class="banner-info">
                                                <h2 class="title24"><%#Eval("Title")%></h2>
                                                <h3 class="title18 color"><%#Eval("Description")%></h3>
                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=<%# Eval("Id")%> " class="shopnow">Shop now</a>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-12 col-sm-12">
                            <div class="list-banner-zoom12">
                                <div class="row">

                                    <asp:Repeater ID="rptrfrozenthumbimage" runat="server">
                                        <ItemTemplate>


                                            <div class="col-lg-12 col-md-6 col-sm-6 col-xs-6">
                                                <div class="banner-zoom banner-zoom12">
                                                    <a href="#" class="thumb-zoom">
                                                        <img src="CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />

                                                    </a>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Header Box -->
                <div class="product-tab12">
                    <div class="title-tab12">
                        <ul class="list-none">
                            <li class="active"><a href="#bea1" data-toggle="tab">new arrivals</a></li>
                            <li><a href="#bea2" data-toggle="tab">Best sellers</a></li>
                            <li><a href="#bea3" data-toggle="tab">On Sale</a></li>
                        </ul>
                    </div>
                    <div class="tab-content">
                        <div id="bea1" class="tab-pane active">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">

                                    <asp:Repeater ID="rptrFrozennewarrival" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins>&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>  <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--<span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--<asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>


                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="bea2" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrFrozenbestsells" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>  <del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--<span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--<asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                        <div id="bea3" class="tab-pane">
                            <div class="product-slider12">
                                <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1],[480,2],[768,3],[980,4],[1200,5]]">
                                    <asp:Repeater ID="rptrFrozendeals" runat="server">
                                        <ItemTemplate>

                                            <div class="item-product">
                                                <div class="product-thumb">
                                                    <a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                        <img height="150" width="300" src="ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                    </a>
                                                    <a href='<%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>

                                                </div>
                                                <div class="product-info">
                                                    <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> &nbsp; <del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label>
                                                    </div>
                                                    <div class="product-price" style="text-align: left">
                                                        <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins>  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <%--<span style="font-size: small">Del :</span> £<asp:Label runat="server" ID="Deliveryoldprice">  <del style="color: #999;"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                        <ins><span><%# Eval("PSelPrice") %></span></ins>--%>
                                                    </div>


                                                    <br />
                                                    <div class="">
                                                        <%--<asp:Button ID="btnaddtocart" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1" runat="server" Text="Add Item" />--%>
                                                        <asp:LinkButton ID="btnaddtocart" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click1">
                                                               <i class="fa fa-shopping-basket"></i> Add Item</asp:LinkButton>
                                                    </div>

                                                    <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                    <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                    <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                    <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                    <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfprice" Value='<%# Eval("PPrice") %>' runat="server" />
                                                    <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                    <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                    <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </div>
                            </div>
                        </div>
                        <!-- End Tab -->
                    </div>
                </div>
                <!-- End Product Tab -->
            </div>
        </div>
        <!-- End Product Box -->
        <div class="this-month12">
            <div class="container">
                <div class="topcat-thismonth">
                    <h1 class="section-title">Our Services </h1>


                    <%--  <section id="what-we-do">
                        <div class="container-fluid">
                            <h2 class="section-title mb-2 h1">Our Services</h2>
                          
                            <div class="row mt-5">
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                                    <div class="cardfooter">
                                        <div class="cardfooter-block block-1">
                                            <h3 class="cardfooter-title">Special title</h3>
                                            <p class="cardfooter-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <a href="javascript:void();" title="Read more" class="read-more">Read more<i class="fa fa-angle-double-right ml-2"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                                    <div class="cardfooter">
                                        <div class="cardfooter-block block-2">
                                            <h3 class="cardfooter-title">Special title</h3>
                                            <p class="cardfooter-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <a href="javascript:void();" title="Read more" class="read-more">Read more<i class="fa fa-angle-double-right ml-2"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                                    <div class="cardfooter">
                                        <div class="cardfooter-block block-3">
                                            <h3 class="cardfooter-title">Special title</h3>
                                            <p class="cardfooter-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <a href="javascript:void();" title="Read more" class="read-more">Read more<i class="fa fa-angle-double-right ml-2"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                                    <div class="cardfooter">
                                        <div class="cardfooter-block block-4">
                                            <h3 class="cardfooter-title">Special title</h3>
                                            <p class="cardfooter-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <a href="javascript:void();" title="Read more" class="read-more">Read more<i class="fa fa-angle-double-right ml-2"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                                    <div class="cardfooter">
                                        <div class="cardfooter-block block-5">
                                            <h3 class="cardfooter-title">Special title</h3>
                                            <p class="cardfooter-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <a href="javascript:void();" title="Read more" class="read-more">Read more<i class="fa fa-angle-double-right ml-2"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4 col-xl-4">
                                    <div class="cardfooter">
                                        <div class="cardfooter-block block-6">
                                            <h3 class="cardfooter-title">Special title</h3>
                                            <p class="cardfooter-text">With supporting text below as a natural lead-in to additional content.</p>
                                            <a href="javascript:void();" title="Read more" class="read-more">Read more<i class="fa fa-angle-double-right ml-2"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>--%>

                    <section class="gallery-block gallery-front">
                        <%--  <div class="container">--%>
                        <div class="row">
                            <a href="Pages/OurServices/IndianRestaurent.aspx" data-lightbox="example-1">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="gallery-image">
                                        <img width="370" height="235" src="images/Ourservices/work1.jpg" />
                                        <h3 style="text-align: center">Indian Resturent</h3>
                                        <div class="overlay">
                                            <%--<a class="info" href="Pages/Services/IndianRestaurent.aspx" data-lightbox="example-1"></a>--%>
                                            <p>double room .We cater for a range of dietary requirements including the growing demand for Halal-certified ingredients. According to the Agriculture & Horticulture Development Board the halal market is growing and represents excellent opportunities for our catering customers, particularly in the shee</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="Pages/OurServices/Hotels.aspx" data-lightbox="example-1">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="gallery-image">
                                        <img width="370" height="235" src="images/Ourservices/work3.png" />
                                        <h3 style="text-align: center">Hotels  </h3>
                                        <div class="overlay">
                                            <%--  <a class="info" href="#" data-lightbox="example-1"></a>--%>
                                            <p>double room .We cater for a range of dietary requirements including the growing demand for Halal-certified ingredients. According to the Agriculture & Horticulture Development Board the halal market is growing and represents excellent opportunities for our catering customers, particularly in the shee</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="Pages/OurServices/FriedChickenAndChips.aspx" data-lightbox="example-1">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="gallery-image">
                                        <img width="370" height="235" src="images/Ourservices/work4.png" />
                                        <h3 style="text-align: center">Fried Chicken & chips</h3>
                                        <div class="overlay">
                                            <%--<a class="info" href="#" data-lightbox="example-1"></a>--%>
                                            <p>double room .We cater for a range of dietary requirements including the growing demand for Halal-certified ingredients. According to the Agriculture & Horticulture Development Board the halal market is growing and represents excellent opportunities for our catering customers, particularly in the shee</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="Pages/OurServices/FishAndChips.aspx" data-lightbox="example-1">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="gallery-image">
                                        <img width="370" height="235" src="images/Ourservices/work5.jpg" />
                                        <h3 style="text-align: center">Fish & Chips</h3>
                                        <div class="overlay">
                                            <%--<a class="info" href="#" data-lightbox="example-1"></a>--%>
                                            <p>double room .We cater for a range of dietary requirements including the growing demand for Halal-certified ingredients. According to the Agriculture & Horticulture Development Board the halal market is growing and represents excellent opportunities for our catering customers, particularly in the shee</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="Pages/OurServices/CoffeeShop.aspx" data-lightbox="example-1">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="gallery-image">
                                        <img width="370" height="235" src="images/Ourservices/work6.jpg" />
                                        <h3 style="text-align: center">Coffee Shop</h3>
                                        <div class="overlay">
                                            <%--<a class="info" href="#" data-lightbox="example-1"></a>--%>
                                            <p>double room .We cater for a range of dietary requirements including the growing demand for Halal-certified ingredients. According to the Agriculture & Horticulture Development Board the halal market is growing and represents excellent opportunities for our catering customers, particularly in the shee</p>
                                        </div>
                                    </div>
                                </div>
                            </a>
                            <a href="Pages/OurServices/School.aspx" data-lightbox="example-1">
                                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                                    <div class="gallery-image">
                                        <img width="370" height="235" src="images/Ourservices/work8.jpg" />

                                        <h3 style="text-align: center">School </h3>


                                        <div class="overlay">
                                            <%--<a class="info" href="#" data-lightbox="example-1"></a>--%>
                                            <p>double room .We cater for a range of dietary requirements including the growing demand for Halal-certified ingredients. According to the Agriculture & Horticulture Development Board the halal market is growing and represents excellent opportunities for our catering customers, particularly in the shee</p>
                                        </div>
                                    </div>
                                </div>
                        </div>
                        </a>
                        <%--   </div>--%>
                    </section>

                </div>

            </div>
        </div>


        <!-- End Brand -->
    </div>
    <!-- End Content -->

</asp:Content>

