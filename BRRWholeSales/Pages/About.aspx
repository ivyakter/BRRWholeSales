<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Pages_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="content">
		<div class="content-page">
			<div class="container">
				
				<div class="protect-video">
					<div class="row">
						<div class="col-md-3 col-sm-3 col-xs-12">
							<div class="about-full-protec">
								<h2 class="title-default">NAVIGATIONS</h2>
								<ul>
									<li> <p><a href="<%=Page.ResolveUrl("~")%>Pages/HowToBuy.aspx">How To buy</a></p></li>
									<li> <p><a href="<%=Page.ResolveUrl("~")%>Pages/FAQ.aspx">Customer Services</a></p></li>
                                    <li> <p><a href="<%=Page.ResolveUrl("~")%>Pages/About.aspx">About us</a></p></li>
                                    <li> <p><a href="<%=Page.ResolveUrl("~")%>Pages/Contact.aspx">Contact us</a></p></li>
                                    <li> <p><a href="<%=Page.ResolveUrl("~")%>Pages/FAQ.aspx">FAQ</a></p></li>
								</ul>
							</div>
						</div>
						<div class="col-md-9 col-sm-9 col-xs-12">
							<div class="video-about">
								<a href="#"><img style="width:100%; height:400Px" src="<%=Page.ResolveUrl("~")%>images/Ourservices/work6.jpg" alt="" /></a>
							</div>
						</div>
					</div>
                    <br />
                    <br />
                    <div class="row">
                        <h2 class="title-default">About us</h2>
								<ul>
									<li> <p>BRRWholesales is an innovative business for your  needs. We are situated in the heart of an upcoming vibrant area, Canning town, East London. With over 15 years experience in the food industry, our team at BRRWholesales has extensive knowledge in item accessories. We have a selection of products from multiple manufacturer’s to bring you a selection to suit your every need whether you are a valued customer or trader.

Our sole business strategy is to provide outstanding customer service, helping you design your perfect home with our exceptional choice of food. Tile House has an extensive product range including traditional, modern, Victorian and contemporary tiles in a variety of colours, textures and sizes.
<br /><br />
As a food-service specialist we offer the highest quality of products and services on the market today. Our 25 years of experience and commitment to excellence have earned us the reputation as one of the best food-service specialists in the industry. Our knowledge of the catering industry means that you can be sure of getting the service, value and support that you need. We have a large product portfolio consisting of over 1500 products, which will give you a choice of quality and value for money on products.
<br />
BRRWholesales aims to offer exceptional levels of customer service and an extensive range of quality tiles at competitive prices that you will not be disappointed with</p></li>
								</ul>
                    </div>
				</div>
			
			</div>
		</div>
	</div>
	<!-- End Content -->

</asp:Content>

