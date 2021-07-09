<%@ Page Title="" MaintainScrollPositionOnPostback="true" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="CategoryGridPage.aspx.cs" Inherits="Pages_CategoryGridPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function PassValue(obj) {
            document.getElementById("hf").value = obj.value;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Label runat="server" ID="lblloigin" Visible="false"></asp:Label>
    <div id="content">
        <div class="banner-shop full-width">
            <div class="banner-shop-thumb">
                <center>
                <asp:Repeater ID="LoadBigImageinCategory" runat="server">
                    <ItemTemplate>
                        <a href="#">
                            <img src="../CategoryImage/<%#Eval("CatID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                             <div class="banner-info"><br /><br />
                              <h3><%#Eval("Title")%></h3>
                              <h2><%#Eval("Description")%></h2>
                             </div>
                        </a>
                    </ItemTemplate>
                </asp:Repeater>
               </center>
            </div>
            <%--   <div class="banner-shop-info text-center">
            </div>--%>
            <div class="bread-crumb">
                <div class="container">
                    <a href="#">Home</a> <span>
                        <asp:Label ID="lblCatName" runat="server"></asp:Label>
                    </span>
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
                                    <ul>
                                        <li class="has-sub-cat"></li>
                                    </ul>
                                    <ul>
                                        <li class="has-sub-cat">
                                            <a href="#">Food Cupboard</a>
                                            <ul>
                                                <asp:Repeater ID="rptrSubCateFoodcupboard" runat="server">
                                                    <ItemTemplate>
                                                        <%-- <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Fresh</a>
                                            <ul>
                                                <asp:Repeater ID="rptrforFresh" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Drink and beverage</a>
                                            <ul>
                                                <asp:Repeater ID="rptrdrinkandbreverage" runat="server">
                                                    <ItemTemplate>
                                                        <%-- <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Dairy and Cheese</a>
                                            <ul>

                                                <asp:Repeater ID="rptrdairyandchese" runat="server">

                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Frozen Food</a>
                                            <ul>
                                                <asp:Repeater ID="rptrfrozenfood" runat="server">

                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>

                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                        <li class="has-sub-cat">
                                            <a href="#">Cooing Oil & Fat</a>
                                            <ul>
                                                <asp:Repeater ID="rptrcookingoilandfat" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>
                                        <li class="has-sub-cat">
                                            <a href="#">Packaging & Disposable</a>
                                            <ul>
                                                <asp:Repeater ID="rptrpackaginganddisposable" runat="server">
                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </ul>
                                        </li>

                                        <li class="has-sub-cat">
                                            <a href="#">Hygiene & Cleaning</a>
                                            <ul>

                                                <asp:Repeater ID="rptrhygieneandcleaning" runat="server">

                                                    <ItemTemplate>
                                                        <%--  <li style="list-style-type: none; padding-bottom: 10px; padding-top: 10px; border-bottom: 1px solid #ddd"><a href='Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>'><%#Eval("MenuText") %> </a></li>--%>
                                                        <li><a href='../Pages/CategoryGridPage.aspx?Subcatid=<%# Eval("Id")%>&catid=<%# Eval("ParentId")%>'><%#Eval("MenuText") %> </a></li>
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
                                        <%--<asp:Label id="lvlnumber1" runat="server"></asp:Label>--%>
                                        <input type="text" id="lvlnumber1" name="lvlnumber1" style="display: none" />
                                        <input type="text" id="lvlnumber2" name="lvlnumber2" style="display: none" />

                                        <%-- <%# LoadFilterProducts(lvlnumber1.Value, lvlnumber1.Value){ } %>--%>
                                        <asp:TextBox ID="txtnumber1" Style="display: none" runat="server"></asp:TextBox>
                                        <asp:TextBox ID="txtnumber2" Style="display: none" runat="server"></asp:TextBox>
                                        <div id="amount"></div>
                                        <%--<button class="btn-filter" onclick="">Filter</button>--%>

                                        <asp:Button ID="btnFilter" class="btn-filter" runat="server" OnClick="btnFilter_Click" Text="Filter" />

                                    </div>
                                </div>
                            </div>
                            <!-- End widget -->
                            <%--         <div class="widget widget-filter-size">
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
                            <%--<div class="widget widget-filter-color">
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
                                            <asp:Repeater runat="server" OnItemDataBound="rptrMain_ItemDataBound1" ID="rptrHotbestsellersProducts">
                                                <ItemTemplate>
                                                    <div class="item-pro-seller">
                                                        <div class="product-thumb">
                                                            <a href='<%= Page.ResolveUrl("~")%><%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link">
                                                                <img src="<%= Page.ResolveUrl("~")%>ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                                <span style="font-size: x-small"><%# Eval("OccationRemain") %></span>
                                                            </a>
                                                            <a href='<%= Page.ResolveUrl("~")%><%# String.Concat("Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>
                                                        </div>
                                                        <div class="product-info">
                                                            <h3 class="product-title"><a href='<%# String.Concat("ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'><%# Eval("PName") %></a></h3>

                                                            <div class="product-price">

                                                                <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span><ins style="display: inline-block"><span style="font-size: small"> £<%# Eval("CollectionPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label><br />
                                                                <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span><ins style="display: inline-block"><span style="font-size: small"> £<%# Eval("PSelPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999;font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:LinkButton ID="Allsuperdeals" runat="server" CssClass="buttonstyle" CausesValidation="false" OnClick="Allsuperdeals_Click"> View All</asp:LinkButton>

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

                                    <%--   <a href="CategoryGridPage.aspx" class="grid-view active"></a>--%>
                                    <asp:LinkButton ID="linkPnlGrid" runat="server" Visible="false" class="grid-view active" OnClick="linkPnlGrid_Click">
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="linkPnlList" runat="server" Visible="false" class="list-view" OnClick="linkPnlList_Click">                                        
                                    </asp:LinkButton>
                                    <asp:Label ID="lblcatid" Visible="false" runat="server"></asp:Label>
                                    <asp:Label ID="lblSubcatid" Visible="false" runat="server"></asp:Label>
                                    <asp:Label ID="lblParentid" Visible="false" runat="server"></asp:Label>

                                    <%-- <a href="CategoryPage.aspx" class="list-view"></a>--%>
                                    <%--                                    <a class="list-view" href="CategoryPage.aspx?CatID=<%=lblcatid.Text%>&Subcatid=<%=lblSubcatid.Text%> &ParentId=<%=lblParentid.Text%>">
                                        <asp:Label ID="lblcatid" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="lblSubcatid" Visible="false" runat="server"></asp:Label>
                                        <asp:Label ID="lblParentid" Visible="false" runat="server"></asp:Label>
                                    </a>--%>
                                </div>
                                <div class="sort-paginav pull-right">
                                    <div class="select-box">
                                        <label>Sort By:</label>
                                        <asp:DropDownList ID="ddlOrderBy" AutoPostBack="true" OnSelectedIndexChanged="ddlOrderBy_SelectedIndexChanged" runat="server">
                                            <asp:ListItem Value="0">Position</asp:ListItem>
                                            <asp:ListItem Value="1">Price</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button runat="server" ID="btnA2Z" class="btn btn-default btn-sm glyphicon glyphicon-sort-by-attributes" Text="&#xe151;" OnClick="btnA2Z_Click"></asp:Button>
                                        <%--<i class="fas fa-arrow-down"></i>--%>
                                        <asp:Button runat="server" ID="btnZ2A" class="btn btn-default btn-sm glyphicon glyphicon-sort-by-alphabet-alt" Text="&#xe152;" OnClick="btnZ2A_Click"></asp:Button>
                                        <asp:LinkButton runat="server" ID="btnH2L" Visible="false" class="btn btn-default btn-sm " OnClick="btnH2L_Click"><i class="fa fa-sort-amount-down"></i> </asp:LinkButton>
                                        <asp:LinkButton runat="server" ID="btnL2H" Visible="false" class="btn btn-default btn-sm " OnClick="btnL2H_Click"><i class="fa fa-sort-amount-up"></i> </asp:LinkButton>
                                    </div>
                                    <div class="show-bar select-box">
                                        <label>Show:</label>
                                        <asp:DropDownList ID="ddlFilterByNumber" AutoPostBack="true" OnSelectedIndexChanged="ddlFilterByNumber_SelectedIndexChanged" runat="server">
                                            <asp:ListItem Value="12">12</asp:ListItem>
                                            <asp:ListItem Value="24">24</asp:ListItem>
                                            <asp:ListItem Value="48">48</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <%--  <div class="pagi-bar">
                                        <a href="#" class="current-page">1</a>
                                        <a href="#">2</a>
                                        <a href="#" class="next-page"><i class="fa fa-caret-right" aria-hidden="true"></i></a>
                                    </div>--%>
                                </div>
                            </div>
                            <!-- End Sort PagiBar -->
                            <asp:Panel runat="server" ID="pnlGrid">
                                <div class="grid-pro-color">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <asp:Label runat="server" ID="lblproduct" Visible="false" ForeColor="Red" Font-Size="XX-Large" Text="There are no products in this category"></asp:Label>
                                        </div>
                                    </div>
                                    <br />
                                    <div class="row">
                                        <div class="row">
                                            <div class="col-md-12 text-center">
                                                <asp:Panel runat="server" Visible="false" ID="Panel1">
                                                    <asp:Label runat="server" ID="lblproductSearch" ForeColor="Red" Font-Size="XX-Large" Text="Sorry! we dont have any products related to your search keyword please try another one"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <br />
                                                    <nav class="main-nav main-nav12">
                                                        <ul>
                                                            <li style="background-color: #f44d60; padding: 0px 15px; border-radius: 15px; margin-right: 3px;"><a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=2 ">Food Cupboard</a></li>
                                                            <li style="background-color: #f44d60; padding: 0px 15px; border-radius: 15px; margin: 5px;">
                                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=3 ">Fresh </a></li>
                                                            <li style="background-color: #f44d60; padding: 0px 15px; border-radius: 15px; margin-right: 3px;">
                                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=4 ">Drink & beverage  </a></li>
                                                            <li style="background-color: #f44d60; padding: 0px 15px; border-radius: 15px; margin-right: 3px;">
                                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=8 ">Dairy and Cheese </a></li>
                                                            <li style="background-color: #f44d60; padding: 0px 15px; border-radius: 15px; margin-right: 3px;">
                                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=9 ">Frozen Food </a></li>
                                                            <li style="background-color: #f44d60; padding: 0px 15px; border-radius: 15px; margin-right: 3px;">
                                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=10 ">Cooking Oil and Fat  </a></li>
                                                            <li style="background-color: #f44d60; padding: 0px 15px; border-radius: 15px; margin: 5px;">
                                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=11">Packaging & disposable </a></li>
                                                            <li style="background-color: #f44d60; padding: 0px 15px; border-radius: 15px; margin: 5px;">
                                                                <a href="<%= Page.ResolveUrl("~")%>Pages/CategoryGridPage.aspx?CatID=12 ">Hygiene and Cleaning  </a></li>
                                                        </ul>
                                                    </nav>
                                                </asp:Panel>
                                            </div>
                                        </div>
                                        <asp:Repeater ID="rptrFoodcupboardnewarrivals" OnItemDataBound="rptrMain_ItemDataBound1" runat="server">
                                            <ItemTemplate>
                                                <div class="col-lg-3 col-md-3 col-sm-6 col-xs-12" style="border: 1px solid #f44d60; border-radius: 4px; padding-top: 8px; width:calc(33% - 5px); margin: 2px; ">
                                                    <div class="item-pro-color">
                                                        <div class="product-thumb">
                                                            <a href='<%# String.Concat("../Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'>
                                                                <img height="150" width="90%" src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                            </a>
                                                            <a href='<%# String.Concat("../Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>
                                                        </div>

                                                        <div class="product-info">
                                                            <h3 class="product-title" style="font-size:16px"><a href='<%# String.Concat("../Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'><%# Eval("PName") %></a></h3>
                                                            <div class="product-price">
                                                                <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span> £<ins><span><%# Eval("CollectionPrice") %></span></ins> <del style="color: #999; font-size: small"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label><br />
                                                                <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> £<ins><span><%# Eval("PSelPrice") %></span></ins><del style="color: #999; font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                            </div>


                                                            <div class="product-extra-link">
                                                                <%-- <asp:linkbutton  runat="server" id="addtocart" OnClick="addtocart_ServerClick"  class="addcart-link"><i class="fa fa-shopping-basket" aria-hidden="true"></i><span>Add to Cart</span></asp:linkbutton>--%>
                                                                <asp:LinkButton runat="server" class="addcart-link" CausesValidation="false" OnClick="addtocart_ServerClick"><i class="fa fa-shopping-basket" aria-hidden="true"></i><span>Add to Cart</span></asp:LinkButton>

                                                                <%--                                                            <a href="#" class="wishlist-link"><i class="fa fa-heart" aria-hidden="true"></i><span>Wishlist</span></a>
                                                            <a href="#" class="compare-link"><i class="fa fa-refresh" aria-hidden="true"></i><span>Compare</span></a>--%>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <asp:HiddenField ID="hfCatID" Value='<%# Eval("CategoryID") %>' runat="server" />
                                                <%--  <asp:HiddenField ID="hfSubCatID" Value='<%# Eval("PSubCatID") %>' runat="server" />--%>
                                                <asp:HiddenField ID="hfBrandID" Value='<%# Eval("PBrandID") %>' runat="server" />
                                                <asp:HiddenField ID="hfPId" Value='<%# Eval("PID") %>' runat="server" />
                                                <asp:HiddenField ID="hfname" Value='<%# Eval("PName") %>' runat="server" />
                                                <asp:HiddenField ID="hfprice" Value='<%# Eval("PSelPrice") %>' runat="server" />
                                                <asp:HiddenField ID="hfCollentionP" Value='<%# Eval("CollectionPrice") %>' runat="server" />
                                                <asp:HiddenField ID="hfproductid" Value='<%# Eval("ProductCode") %>' runat="server" />
                                                <asp:HiddenField ID="hfimagename" Value='<%# Eval("Name") %>' runat="server" />
                                                <asp:HiddenField ID="hfimageExtesion" Value='<%# Eval("Extention") %>' runat="server" />
                                                <asp:HiddenField ID="hfvatamount" Value='<%# Eval("Vat") %>' runat="server" />

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
                                    <br />

                                    <div class="pagi-bar bottom 1">
                                        <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnPage" CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server"> <%# Container.DataItem %> </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                        <%--<a class="current-page" href="#">1</a>
                                        <a href="#">2</a>
                                        <a class="next-page" href="#"><i aria-hidden="true" class="fa fa-caret-right"></i></a>--%>
                                    </div>


                                </div>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="pnlList" Visible="false">
                                <div class="list-pro-color">
                                    <div class="row">
                                        <div class="col-md-12 text-center">
                                            <asp:Label runat="server" ID="Label1" Visible="false" ForeColor="Red" Font-Size="XX-Large" Text="There Is No Product Fro This Category"></asp:Label>
                                        </div>
                                    </div>

                                    <asp:Repeater ID="rptrList" runat="server">
                                        <ItemTemplate>
                                            <div class="item-product-list">

                                                <div class="row">
                                                    <div class="col-md-3 col-sm-4 col-xs-12">
                                                        <div class="item-pro-color">
                                                            <div class="product-thumb">
                                                                <a href='<%# String.Concat("../Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'>
                                                                    <img src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                                </a>
                                                                <a href='<%# String.Concat("../Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-9 col-sm-8 col-xs-12">
                                                        <div class="product-info">
                                                            <h3 class="product-title"><a href='<%# String.Concat("../Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'><%# Eval("PName") %></a></h3>
                                                            <div class="product-price">
                                                                <span style="font-size: small">Col :</span>  £<ins><span><%# Eval("CollectionPrice") %></span></ins>
                                                                <br />
                                                                <span style="font-size: small">Del :</span> £<del><span><%# Eval("PPrice") %></span></del>
                                                                <ins><span><%# Eval("PSelPrice") %></span></ins>
                                                            </div>
                                                            <p class="desc">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla paria tur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                            <div class="product-rate">
                                                                <div class="product-rating" style="width: 90%"></div>
                                                            </div>
                                                            <div class="product-extra-link2">
                                                                <%-- <a href="#" class="addcart-link">Add to Cart</a>--%>
                                                                <asp:LinkButton class="addcart-link" runat="server" ID="addtocart" CausesValidation="false">Add to Cart</asp:LinkButton>
                                                                <a href="#" class="wishlist-link"><i class="fa fa-heart" aria-hidden="true"></i></a>
                                                                <a href="#" class="compare-link"><i class="fa fa-refresh" aria-hidden="true"></i></a>
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

                                    <div class="pagi-bar bottom" >
                                        <%--<asp:Repeater ID="rptPaging1" runat="server" OnItemCommand="rptPaging_ItemCommand">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnPage" CommandName="Page" CommandArgument="<%# Container.DataItem %>" runat="server"> <%# Container.DataItem %> </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:Repeater>--%>
                                        <%--<a class="current-page" href="#">1</a>
                                        <a href="#">2</a>
                                        <a class="next-page" href="#"><i aria-hidden="true" class="fa fa-caret-right"></i></a>--%>
                                    </div>

                                </div>

                            </asp:Panel>
                            <%-- pagination --%>
                            <%--<div style="overflow: hidden;">
                                <asp:Repeater ID="rptPaging" runat="server" OnItemCommand="rptPaging_ItemCommand">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="btnPage"
                                            Style="padding: 8px; margin: 2px; background: #ffa100; border: solid 1px #666; font: 8pt tahoma;"
                                            CommandName="Page" CommandArgument="<%# Container.DataItem %>"
                                            runat="server" ForeColor="White" Font-Bold="True">
                                                <%# Container.DataItem %>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>--%>

                            <!-- End List Pro color -->
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</asp:Content>

