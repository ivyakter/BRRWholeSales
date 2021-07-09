<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="CategoryPage.aspx.cs" Inherits="Pages_CategoryPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label runat="server" ID="lblloigin" Visible="false"></asp:Label>
    <div id="content">
        <div class="banner-shop full-width">
            <div class="banner-shop-thumb">
                <asp:Repeater ID="LoadBigImageinCategory" runat="server">
                    <ItemTemplate>
                        <a href="#">
                            <img src="../CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
                <%--   <a href="#">
                    <img src="../images/shop/bn-fullwidth.jpg" alt="" />

                </a>--%>
            </div>
            <div class="banner-shop-info text-center">
                <h3>big sale</h3>
                <h2>up to 30% off</h2>
            </div>
            <div class="bread-crumb">
                <div class="container">
                    <a href="#">Home</a> <span>Fashion</span>
                </div>
            </div>
            <!-- End Bread Crumb -->
        </div>
        <!-- End Banner -->
        <div class="content-page">
            <div class="container">
                <div class="row">
                    <div class="col-md-3 col-sm-4 col-xs-12">
                        <div class="sidebar sidebar-left">
                            <div class="widget widget-product-cat">
                                <h2 class="widget-title title14">Categories</h2>
                                <div class="widget-content">
                                    <ul><li class="has-sub-cat"></li></ul>
                                    <ul>
                                        <li class="has-sub-cat">
                                            <a href="#">Food Cupboard</a>
                                            <ul>
                                                <asp:Repeater ID="rptrSubCateFoodcupboard" runat="server">
                                                    <ItemTemplate>
                                                        <%-- <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Fresh</a>
                                            <ul>
                                                <asp:Repeater ID="rptrforFresh" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Drink and beverage</a>
                                            <ul>
                                                <asp:Repeater ID="rptrdrinkandbreverage" runat="server">
                                                    <ItemTemplate>
                                                        <%-- <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                        <li class="has-sub-cat">
                                            <a href="#">Dairy and Cheese</a>
                                            <ul>
                                                <asp:Repeater ID="rptrdairyandchese" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                        <li class="has-sub-cat">
                                            <a href="#">Frozen Food</a>
                                            <ul>
                                                <asp:Repeater ID="rptrfrozenfood" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                        <li class="has-sub-cat">
                                            <a href="#">Cooing Oil & Fat</a>
                                            <ul>
                                                <asp:Repeater ID="rptrcookingoilandfat" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Packaging & Disposable</a>
                                            <ul>
                                                <asp:Repeater ID="rptrpackaginganddisposable" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Hygiene & Cleaning</a>
                                            <ul>
                                                <asp:Repeater ID="rptrhygieneandcleaning" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/Home/ProductsByCategory.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>

                            <!-- End widget -->
                            <div class="widget widget-filter-price">
                                <h2 class="widget-title title14">Price</h2>
                                <div class="widget-content">
                                    <div class="range-filter">
                                        <div id="slider-range"></div>
                                        <div id="amount">
                                        <asp:Label id="lvlnumber1" runat="server"></asp:Label>
                                        <asp:Label id="lvlnumber2" runat="server"></asp:Label>
                                            </div>
                                        <%--<button " class="btn-filter">Filter</button>--%>
                                        <asp:Button OnClick="btnFilter_Click" class="btn-filter" ID="btnFilter" runat="server" Text="Filter" />
                                    </div>
                                </div>
                            </div>
                            <!-- End widget -->
                            <%--  <div class="widget widget-filter-size">
                                <h2 class="widget-title title14">Size</h2>
                                <div class="widget-content">
                                    <ul class="list-filter size-filter">
                                        <li><a href="#">s</a></li>
                                        <li class="active"><a href="#">m</a></li>
                                        <li><a href="#">l</a></li>
                                        <li><a href="#">xl</a></li>
                                        <li><a href="#">2xl</a></li>
                                    </ul>
                                </div>
                            </div>--%>
                            <!-- End widget -->
                            <%-- <div class="widget widget-filter-color">
                                <h2 class="widget-title title14">Color</h2>
                                <div class="widget-content">
                                    <ul class="list-filter color-filter">
                                        <li><a href="#"><span style="background: #404040"></span></a></li>
                                        <li><a href="#"><span style="background: #ffbb51"></span></a></li>
                                        <li><a href="#"><span style="background: #80e6ff"></span></a></li>
                                        <li><a href="#"><span style="background: #38cf46"></span></a></li>
                                        <li><a href="#"><span style="background: #ff8ff8"></span></a></li>
                                        <li><a href="#"><span style="background: #868fff"></span></a></li>
                                        <li><a href="#"><span style="background: #ff596d"></span></a></li>
                                        <li><a href="#"><span style="background: #ffdb33"></span></a></li>
                                        <li class="active"><a href="#"><span style="background: #ffffff"></span></a></li>
                                    </ul>
                                </div>
                            </div>--%>
                            <!-- End widget -->
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
                            <%-- <div class="widget widget-brand">
                                <h2 class="widget-title title14">Brands</h2>
                                <div class="widget-content">
                                    <div class="item-brand-side">
                                        <div class="brand-side-thumb">
                                            <a href="#">
                                                <img class="wobble-vertical" src="../images/photos/brands/logo1.png" alt="" /></a>
                                        </div>
                                        <div class="brand-side-info">
                                            <p>Extra 9% Off On Non Electronics </p>
                                            <span style="color: #1a79c7">Philips</span>
                                        </div>
                                    </div>
                                    <div class="item-brand-side">
                                        <div class="brand-side-thumb">
                                            <a href="#">
                                                <img class="wobble-vertical" src="../images/photos/brands/logo2.png" alt="" /></a>
                                        </div>
                                        <div class="brand-side-info">
                                            <p>Upto 50% + Non Electronics </p>
                                            <span style="color: #ee3124">Canon</span>
                                        </div>
                                    </div>
                                    <div class="item-brand-side">
                                        <div class="brand-side-thumb">
                                            <a href="#">
                                                <img class="wobble-vertical" src="../images/photos/brands/logo20.png" alt="" /></a>
                                        </div>
                                        <div class="brand-side-info">
                                            <p>Flat 5% To 35% Off Best Price </p>
                                            <span style="color: #0b2089">Samsung</span>
                                        </div>
                                    </div>
                                </div>
                            </div>--%>
                            <!-- End widget -->
                        </div>
                    </div>
                    <div class="col-md-9 col-sm-8 col-xs-12">
                        <div class="content-grid-boxed">
                            <div class="sort-pagi-bar clearfix">
                                <div class="view-type pull-left">
<%--                                    <a href="CategoryGridPage.aspx" class="grid-view"></a>--%>
                                    <a class="grid-view" href="CategoryGridPage.aspx?catid=<%=lblcatid.Text%>&Subcatid=<%=lblSubcatid.Text%> &Parentid=<%=lblParentid.Text%>">
                                        <asp:Label ID="lblcatid" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="lblSubcatid" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="lblParentid" Visible="false" runat="server"></asp:Label>
                                    </a>
                                    <a href="CategoryPage.aspx" class="list-view active"></a>
                                </div>
                                <div class="sort-paginav pull-right">
                                    <div class="select-box">
                                        <label>Sort By:</label>
                                        <asp:DropDownList ID="ddlOrderBy" AutoPostBack="true" OnSelectedIndexChanged="ddlOrderBy_SelectedIndexChanged" runat="server">
                                            <asp:ListItem Value="0">Position</asp:ListItem>
                                            <asp:ListItem Value="1">Price</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:button runat="server" ID="btnA2Z" class="btn btn-default btn-sm glyphicon" Text="&#xe151;" OnClick="btnA2Z_Click"></asp:button>
                                        <asp:button runat="server" ID="btnZ2A" class="btn btn-default btn-sm glyphicon" Text="&#xe152;" OnClick="btnZ2A_Click"></asp:button>
                                        <asp:button runat="server" ID="btnH2L" Visible="false" class="btn btn-default btn-sm glyphicon" Text="&#xe114;" OnClick="btnH2L_Click"></asp:button>
                                        <asp:button runat="server" ID="btnL2H" Visible="false" class="btn btn-default btn-sm glyphicon" Text="&#xe113;" OnClick="btnL2H_Click"></asp:button>
                                    </div>
                                    <div class="show-bar select-box">
                                        <label>Show:</label>
                                        <asp:DropDownList ID="ddlFilterByNumber" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterByNumber_SelectedIndexChanged" runat="server">
                                            <asp:ListItem Value="0">12</asp:ListItem>
                                            <asp:ListItem Value="1">24</asp:ListItem>
                                            <asp:ListItem Value="2">48</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="pagi-bar">
                                        <a href="#" class="current-page">1</a>
                                        <a href="#">2</a>
                                        <a href="#" class="next-page"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
                                    </div>
                                </div>
                            </div>
                            <!-- End Sort PagiBar -->
                            <div class="list-pro-color">
                                <div class="row">
                                    <div class="col-md-12 text-center">
                                        <asp:Label runat="server" ID="lblproduct" Visible="false" ForeColor="Red" Font-Size="XX-Large" Text="There are no products in this category"></asp:Label>
                                    </div>
                                </div>

                                <asp:Repeater ID="rptrFoodcupboardnewarrivals" runat="server">
                                    <ItemTemplate>
                                        <div class="item-product-list">

                                            <div class="row">
                                                <div class="col-md-3 col-sm-4 col-xs-12">
                                                    <div class="item-pro-color">
                                                        <div class="product-thumb">
                                                            <a href='<%# String.Concat("../Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'>
                                                                <img height="150" width="300" src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                            </a>
                                                            <a href='<%# String.Concat("../Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-9 col-sm-8 col-xs-12">
                                                    <div class="product-info">
                                                        <h3 class="product-title"><a href='<%# String.Concat("../Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'><%# Eval("PName") %></a></h3>
                                                        <div class="product-price">
                                                            <span style="font-size: small">Col :</span> <ins style="display: inline-block"> £<span><%# Eval("CollectionPrice") %></span></ins><br /><span style="font-size: small">Del :</span> <ins style="display: inline-block">£<span><%# Eval("PSelPrice") %></span></ins><del>£<span><%# Eval("PPrice") %></span></del></div>
                                                        <p class="desc">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla paria tur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                        <div class="product-rate">
                                                            <div class="product-rating" style="width: 90%"></div>
                                                        </div>
                                                        <div class="product-extra-link2">
                                                            <%-- <a href="#" class="addcart-link">Add to Cart</a>--%>
                                                            <asp:LinkButton class="addcart-link" runat="server" ID="addtocart" OnClick="addtocart_Click" CausesValidation="false">Add to Cart</asp:LinkButton>
<%--                                                            <a href="#" class="wishlist-link"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                            <a href="#" class="compare-link"><i class="fa fa-refresh" aria-hidden="true"></i></a>--%>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                        <%-- <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                        <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                        <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                        <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                        <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                        <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                        <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                        <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                         <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />
                                    </ItemTemplate>
                                </asp:Repeater>
                                <!-- End Item -->
                                <div class="pagi-bar bottom">
                                    <a class="current-page" href="#">1</a>
                                    <a href="#">2</a>
                                    <a class="next-page" href="#"><i aria-hidden="true" class="fa fa-caret-right"></i></a>
                                </div>
                            </div>
                            <!-- End List Pro color -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

