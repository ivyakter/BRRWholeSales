<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="SearchList.aspx.cs" Inherits="Pages_ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label runat="server" ID="lblloigin" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="lblhiddenPID" Visible="false"></asp:Label>
    <div id="content">
        <div class="content-page">
            <div class="container">

                <!-- End Bread Crumb rptrrelatedproduct-->
                <div class="row">
                    <div class="col-md-9 col-sm-8 col-col-xs-12">                        
                        <h2>Search Product List</h2>
                        <br />
                        <div class="list-pro-color">
                            <div class="row">
                                <div class="col-md-12 text-center">
                                    <asp:Label runat="server" ID="lblproduct" Visible="false" ForeColor="Red" Font-Size="XX-Large" Text="There are no products in this category"></asp:Label>
                                </div>
                            </div>

                            <asp:Repeater ID="rptrrelatedproduct" runat="server">
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
                                                        <span style="font-size: small">Col :</span> <ins style="display: inline-block">£<span><%# Eval("CollectionPrice") %></span></ins><br />
                                                        <span style="font-size: small">Del :</span> <ins style="display: inline-block">£<span><%# Eval("PSelPrice") %></span></ins><del>£<span><%# Eval("PPrice") %></span></del>
                                                    </div>
                                                    <p class="desc">Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla paria tur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                                    <div class="product-rate">
                                                        <div class="product-rating" style="width: 90%"></div>
                                                    </div>
                                                    <div class="product-extra-link2">
                                                        <%-- <a href="#" class="addcart-link">Add to Cart</a>--%>
                                                        <asp:LinkButton class="addcart-link" runat="server" ID="addtocart" OnClick="addtocart_Click"  CausesValidation="false">Add to Cart</asp:LinkButton> 
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
                        <%--//////////////Model Comment//////--%>
                    </div>

                    <div class="col-md-3 col-sm-4 col-col-xs-12">
                        <div class="sidebar sidebar-right">

                            <div class="widget widget-seller">
                                <h2 class="widget-title title14">On Sale Products</h2>
                                <div class="widget-content">
                                    <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1]]">
                                        <div class="list-pro-seller">
                                            <asp:Repeater runat="server" ID="rptrHotdealsProducts">
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
                                                            <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>

                                                            <div class="product-price">

                                                                <span style="font-size: small">Col :</span>  £ <ins style="display: inline-block"><span style="font-size: small"><%# Eval("CollectionPrice") %></span></ins><br />
                                                                <span style="font-size: small">Del :</span> £ 
                                                        <ins style="display: inline-block"><span style="font-size: small"><%# Eval("PSelPrice") %></span></ins>
                                                                <asp:Label runat="server" ID="Deliveryoldprice"><del style="color: #999;font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>


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

                            <div class="widget widget-seller">
                                <h2 class="widget-title title14">best sellers</h2>
                                <div class="widget-content">
                                    <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1]]">
                                        <div class="list-pro-seller">
                                            <asp:Repeater runat="server" ID="rptrHotbestsellersProducts">
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
                                                            <h3 class="product-title"><a href='<%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>' class="product-thumb-link"><%# Eval("PName") %></a></h3>

                                                            <div class="product-price">

                                                                <span style="font-size: small">Col :</span>  £ <ins style="display: inline-block"><span style="font-size: small"><%# Eval("CollectionPrice") %></span></ins><br />
                                                                <span style="font-size: small">Del :</span> £ 
                                                        <ins style="display: inline-block"><span style="font-size: small"><%# Eval("PSelPrice") %></span></ins>
                                                                <asp:Label runat="server" ID="Deliveryoldprice"><del style="color: #999;font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>


                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>

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



</asp:Content>

