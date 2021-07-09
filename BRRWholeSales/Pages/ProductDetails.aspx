<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="Pages_ProductDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <asp:Label runat="server" ID="lblloigin" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="lblhiddenPID" Visible="false"></asp:Label>
    <div id="content">
        <div class="content-page">
            <div class="container">

                <!-- End Bread Crumb -->
                <div class="row">
                    <div class="col-md-9 col-sm-8 col-col-xs-12">
                        <div class="product-detail accordion-detail border radius">

                            <div class="row text-center" style="background-color: #120C0CCF; color: white; font-weight: 800;">

                                <h4>
                                    <asp:Label runat="server" ID="lblproductname"></asp:Label>

                                </h4>
                            </div>

                            <div class="row text-center" style="background-color: #F44D60; color: white; font-weight: 800;">

                                <h4>
                                    <asp:Label runat="server" ID="lblProductcode"></asp:Label>

                                </h4>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-5 col-sm-12 col-xs-12">
                                    <div class="detail-gallery">
                                        <asp:Repeater runat="server" ID="rptrsingleimage">
                                            <ItemTemplate>
                                                <div class="mid">
                                                    <img src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" width="340" height="340" alt="<%#Eval("Name")%>" />
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
                                                            <li><a href="#">
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

                                <div class="col-md-7 col-sm-12 col-xs-12">

                                    <div class="detail-info">

                                        <!-- Nav tabs -->
                                        <div class="card">
                                            <ul class="nav nav-tabs" role="tablist">
                                                <li role="presentation" class="active"><a href="#Price" style="font-weight: bold" aria-controls="home" role="tab" data-toggle="tab">PRICE</a></li>
                                                <li role="presentation"><a href="#Ingredients" style="font-weight: bold" aria-controls="profile" role="tab" data-toggle="tab">INGREDIENTS</a></li>
                                                <li role="presentation"><a href="#Nutrition" style="font-weight: bold" aria-controls="messages" role="tab" data-toggle="tab">NUTRITION</a></li>
                                                <li role="presentation"><a href="#Allergy" style="font-weight: bold" aria-controls="settings" role="tab" data-toggle="tab">ALLERGY ADVICE</a></li>
                                            </ul>

                                            <!-- Tab panes -->
                                            <div class="tab-content">
                                                <asp:Repeater runat="server" ID="rptrproductinfo" OnItemDataBound="rptrproductinfo_ItemDataBound">
                                                    <ItemTemplate>

                                                        <div role="tabpanel" class="tab-pane active" id="Price">
                                                            <div class="product-price">

                                                              <asp:Label runat="server" ID="lvlCol">  <span style="font-size: medium">Collection Price :</span> <span><ins style="font-size: medium">£<%# Eval("CollectionPrice") %></ins></span> <asp:Label runat="server" ID="collectionoldprice"><del style="color: #999; font-size: medium"><%# Eval("CollectionOldPrice") %></del></asp:Label>
                                                                </asp:Label>
                                                                <br />

                                                               <asp:Label runat="server" ID="lvlDel"> <span style="font-size: medium;">Delivery Price &nbsp; &nbsp;:</span><span><ins style="font-size: medium;"> £<%# Eval("PSelPrice") %></ins></span>
                                                               <asp:Label runat="server" ID="Deliveryoldprice"><del style="color: #999; font-size: medium"><%# Eval("PPrice") %></del></asp:Label></asp:Label>
                                                                <br /><br />
                                                               <strong>Availability: </strong><asp:Label class="in-stock" runat="server" ID="lblInstock"></asp:Label>
                                                            </div>                                                          
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
                                                                    <asp:TextBox ID="txtqty" runat="server" Height="40" TextMode="Number" Width="95%" min="1" max="50" Text="1" class="form-control"></asp:TextBox>
                                                                    <asp:RangeValidator ID="txt_12hours" runat="server" ControlToValidate="txtqty" ErrorMessage="Range 1-50" MaximumValue="50" MinimumValue="1" Type="Double" ForeColor="Red"></asp:RangeValidator>
                                                                </div>
                                                                <div class="product-extra-link2">
                                                                    <asp:Button ID="btnaddtocart" CssClass="btn buttonstyle" CausesValidation="false" OnClick="btnaddtocart_Click" runat="server" Text="Add To Cart" />
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div role="tabpanel" class="tab-pane" id="Ingredients">
                                                            <%# Server.HtmlDecode(Eval("Ingredients").ToString()) %>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane" id="Nutrition">
                                                            <%#Eval("NutritionValue") %>
                                                        </div>
                                                        <div role="tabpanel" class="tab-pane" id="Allergy">
                                                            <%#Eval("AllergyAdvice") %>
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



                                    </div>
                                    <!-- Detail Info -->
                                </div>

                            </div>
                            <div class="tab-detal toggle-tab">

                                <!-- End Main Detail -->
                                <div class="product-related border radius">
                                    <h2 class="title18">RELATED PRODUCTS</h2>
                                    <div class="product-related-slider">
                                        <div class="wrap-item" data-itemscustom="[[0,1],[480,2],[1024,3],[1200,4]]" data-pagination="false" data-navigation="true">
                                            <asp:Repeater runat="server"  OnItemDataBound="rptrMain_ItemDataBound1" ID="rptrrelatedproduct">
                                                <ItemTemplate>
                                                    <div class="item-pro-color">
                                                        <div class="product-thumb">
                                                            <a href='<%# String.Concat("../Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'>
                                                                <img height="150" width="150" src="../ProductImage/<%#Eval("PID") %>/<%#Eval("Name")%><%#Eval("Extention")%>" alt="<%#Eval("Name")%>" />
                                                            </a>
                                                            <a href='<%# String.Concat("../Pages/quickview.aspx?PID=", Eval("PID").ToString()) %>' class="quickview-link plus fancybox.iframe">quick view</a>
                                                        </div>
                                                        <div class="product-info">
                                                            <%--    <div class="list-color">
                                                <a href="#" data-color="black" style="background: #404040"></a>
                                                <a href="#" data-color="purple" style="background: #ff8ff8"></a>
                                                <a href="#" data-color="blue" style="background: #868fff"></a>
                                                <a href="#" data-color="cyan" style="background: #80e6ff"></a>
                                            </div>--%>
                                                            <h3 class="product-title"><a href='<%# String.Concat("../Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'><%# Eval("PName") %></a></h3>
                                                            <div class="product-price">
                                                                <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span>  <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("CollectionPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label><br />
                                                                <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("PSelPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999;font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </ItemTemplate>
                                            </asp:Repeater>

                                            <%--    <div class="item-pro-color">
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
                                    </div>--%>
                                        </div>
                                    </div>
                                </div>
                                <!-- End Product Related -->

                                <div class="item-toggle-tab">
                                    <h2 class="widget-title title14">Reviews</h2>
                                    <div class="toggle-tab-content">
                                        <div class="content-detail-tab">

                                            <!-- End Related Post -->
                                            <div class="comment-list">
                                                <h2>Reviews</h2>
                                                <ol>
                                                    <asp:Repeater ID="rptrMainComment" runat="server" OnItemDataBound="rptrMainComment_ItemDataBound">
                                                        <ItemTemplate>
                                                            <li>
                                                                <div class="item-comment">

                                                                    <asp:HiddenField ID="hfMainId" runat="server" Value='<%#Eval("ID") %>' />
                                                                    <div class="comment-info">
                                                                        <h3><a href="#"><%#Eval("CustomerName") %></a></h3>
                                                                        <ul class="post-date-comment">
                                                                            <li><span><%#Eval("Date") %></span></li>
                                                                            <%-- <li><a href="#comment" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-reply-all" aria-hidden="true"></i>Reply</a></li>--%>
                                                                        </ul>
                                                                        <p class="desc">
                                                                            <asp:Label runat="server" ID="lblmainComment" Text='<%#Eval("Comments") %>'></asp:Label>
                                                                        </p>
                                                                    </div>
                                                                </div>

                                                               <%-- <asp:Repeater ID="rptrReplyComment" Visible="false" runat="server">
                                                                    <HeaderTemplate>
                                                                        <ul>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <div class="item-comment" style="min-width: 800px">

                                                                            <div class="comment-info">
                                                                                <h3><a href="#"><%#Eval("CustomerName") %></a></h3>
                                                                                <ul class="post-date-comment">
                                                                                    <li><span><%#Eval("Date") %></span></li>
                                                                                    <li><a href="#comment"><i class="fa fa-reply-all" aria-hidden="true"></i>Reply</a></li>

                                                                                </ul>
                                                                                <p class="desc">
                                                                                    <asp:Label runat="server" ID="lblReplyComment" Text='<%#Eval("Comments") %>'></asp:Label>
                                                                                </p>
                                                                            </div>
                                                                        </div>
                                                                    </ItemTemplate>
                                                                    <FooterTemplate>
                                                                        </ul>
                                                                    </FooterTemplate>
                                                                </asp:Repeater>--%>

                                                                
                                                            </li>
                                                        </ItemTemplate>
                                                    </asp:Repeater>


                                                </ol>



                                            </div>
                                            <!-- End Comment List -->
                                            <div class="leave-comment">
                                                <h2>Write your Review</h2>
                                                <div class="col-md-6">
                                                    <div class="comment-form">
                                                        <div class="col-sm-12 inputGroupContainer hidden">
                                                            <div class="input-group">
                                                                <asp:TextBox ID="txtName" Width="100%" ValidationGroup="mailVal" runat="server" CssClass="form-control" placeholder="First Name" />
                                                                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                                                            </div>
                                                        </div>
                                                        <div class="col-sm-12 inputGroupContainer hidden">
                                                            <div class="input-group">
                                                                <asp:TextBox ID="txtEmail" Width="100%" ValidationGroup="mailVal" runat="server" CssClass="form-control" placeholder="First Name" />
                                                                <span class="input-group-addon"><i class="fa fa-pencil"></i></span>
                                                            </div>
                                                        </div>
                                                        <%-- <asp:TextBox runat="server" ID="txtName" Enabled="false" class="border radius" CssClass=" fa fa-pencil" type="text" onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" value="Full Name*" name="name" />
                                                    <asp:TextBox runat="server" ID="txtEmail" Enabled="false" class="border radius" CssClass=" fa fa-pencil" type="text" onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" value="Email Address*" name="email" />--%>

                                                        <asp:TextBox runat="server" ID="txtComment" TextMode="MultiLine" class="border radius" name="message" cols="30" Rows="10" onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''">Review*</asp:TextBox>
                                                        <asp:Button runat="server" ID="btncomment" CausesValidation="false" class="radius" BackColor="#f44d60" OnClick="btncomment_Click" Text="Submit Review" />
                                                    </div>
                                                </div>
                                            </div>
                                            <!-- End Leave Comment -->
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <%--//////////////Model Comment//////--%>
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Write your Review</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">

                                        <p>Your email address will not be published. Required fields are marked <span>*</span></p>
                                        <div class="comment-form">
                                            <asp:TextBox runat="server" ID="txtreplyname" Enabled="false" class="border radius" type="text" onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" value="Full Name*" name="name" />
                                            <asp:TextBox runat="server" ID="txtreplyemail" Enabled="false" class="border radius" type="text" onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''" value="Email Address*" name="email" />

                                            <asp:TextBox runat="server" ID="txtreplycomment" TextMode="MultiLine" class="border radius" name="message" cols="30" Rows="10" onblur="if (this.value=='') this.value = this.defaultValue" onfocus="if (this.value==this.defaultValue) this.value = ''">Comment*</asp:TextBox>
                                            <asp:Button runat="server" ID="btnreply" CausesValidation="false" class="radius" OnClick="btnreply_Click" Text="Reply Comment" />
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="col-md-3 col-sm-4 col-col-xs-12">
                        <div class="sidebar sidebar-right">

                            <div class="widget widget-seller">
                                <h2 class="widget-title title14">On Sale Products</h2>
                                <div class="widget-content">
                                    <div class="wrap-item" data-pagination="false" data-navigation="true" data-itemscustom="[[0,1]]">
                                        <div class="list-pro-seller">
                                            <asp:Repeater runat="server" OnItemDataBound="rptrMain_ItemDataBound1" ID="rptrHotdealsProducts">
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
                                                            <h3 class="product-title" style="font-size: 10px; font-weight: bold;"><a href='<%= Page.ResolveUrl("~")%><%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'><%# Eval("PName") %></a></h3>

                                                            <div class="product-price">
                                                                <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span>  <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("CollectionPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label><br />
                                                                <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("PSelPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999;font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>

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
                                                            <h3 class="product-title"><a href='<%= Page.ResolveUrl("~")%><%# String.Concat("Pages/ProductDetails.aspx?PID=", Eval("PID").ToString()) %>'><%# Eval("PName") %></a></h3>

                                                            <div class="product-price">

                                                               <asp:Label runat="server" ID="lvlCol"><span style="font-size: small">Col :</span>  <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("CollectionPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999; font-size: 12px"><span><%# Eval("CollectionOldPrice") %></span></del></asp:Label><br />
                                                                <asp:Label runat="server" ID="lvlDel"><span style="font-size: small">Del :</span> <ins style="display: inline-block"><span style="font-size: small">£<%# Eval("PSelPrice") %></span></ins>&nbsp;&nbsp;<del style="color: #999;font-size: 12px"><span><%# Eval("PPrice") %></span></del></asp:Label>
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

