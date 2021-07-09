<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="HowToBuy.aspx.cs" Inherits="Pages_About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="content">
		<div class="content-page">
			<div class="container">
				<div class="about-banner banner-image">
					<a href="#"><img src="<%=Page.ResolveUrl("~")%>images/pages/about-banner.jpg" alt="" /></a>
				</div>
				<div class="contact-info-page about-info-page">
					<div class="list-contact-info">
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12">
								<div class="item-contact-info">
									<a class="contact-icon icon-quality" href="#"><i class="fa fa-diamond"></i></a>
									<h2><a href="#">How to Buy Stocks</a></h2>
								</div>
							</div>
						</div>
					</div>
					<p class="desc"><b>Step 1:</b>Open an online brokerage account</p>
                    <p class="desc">Wondering where to buy stocks? Movies love to show frenzied traders shouting orders on the floor of the New York Stock Exchange, but these days very few stock trades happen this way. Today, the easiest option is to buy stocks online through an online stockbroker.
Opening an online brokerage account is as easy as setting up a bank account: You complete an account application, provide proof of identification and choose how you want to fund the account. You may fund your account by mailing a check or transferring funds electronically.</p>
                    <br /><br />
                    <p class="desc"><b>Step 2:</b>Select the stocks you want to buy</p>
                    <p class="desc">Once you’ve set up and funded your brokerage account, it’s time to dive into the business of picking stocks. A good place to start is by researching companies you already know from your experiences as a consumer.
Don’t let the deluge of data and real-time market gyrations overwhelm you as you conduct your research. Keep the objective simple: You’re looking for companies of which you want to become a part owner.

Warren Buffett famously said, “Buy into a company because you want to own it, not because you want the stock to go up.” He’s done pretty well for himself by following that rule.

Start with the company’s annual report — specifically management’s annual letter to shareholders. The letter will give you a general narrative of what’s happening with the business and provide context for the numbers in the report.</p>
                    <br /><br />
                    <p class="desc"><b>Step 3:</b>Decide how many shares to buy</p>
                    <p class="desc">You should feel absolutely no pressure to buy a certain number of shares or fill your entire portfolio with a stock all at once. Consider starting small — really small — by purchasing just a single share to get a feel for what it’s like to own individual stocks and whether you have the fortitude to ride through the rough patches with minimal sleep loss. You can add to your position over time as you master the shareholder swagger.</p>
                    <br /><br />
                    <p class="desc"><b>Step 4:</b>Choose your stock order type</p>
                    <p class="desc">Don’t be put off by all those numbers and nonsensical word combinations on your broker’s online order page. Refer to cheat sheet.</p>
                    <br /><br />
                    <p class="desc"><b>Step 5:</b>Optimize your stock portfolio</p>
                    <p class="desc">We hope your first stock purchase marks the beginning of a lifelong journey of successful investing. But if things turn difficult, remember that every investor — even Warren Buffett — goes through rough patches. The key to coming out ahead in the long term is to keep your perspective and concentrate on the things that you can control. Market gyrations aren’t among them. What you can do.</p>
                    <br /><br />
				</div>
				<div class="protect-video">
					<div class="row">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="about-full-protec">
								<h2 class="title-default">To get full protection</h2>
								<ul>
									<li><span class="about-num"><span>1</span></span> <p>CONFIRM your order online with a Trade Assurance supplier</p></li>
									<li><span class="about-num"><span>2</span></span> <p>PAY to the supplier’s CITIBANK account designated by Aloshop with credit card or bank transfer</p></li>
								</ul>
								<a href="#" class="new-user-guide">View New User Guide</a>
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="video-about">
								<a href="#"><img src="<%=Page.ResolveUrl("~")%>images/pages/about-video.jpg" alt="" /></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->

</asp:Content>

