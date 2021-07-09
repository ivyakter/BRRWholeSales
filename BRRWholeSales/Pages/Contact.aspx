<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Pages_Contace" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="content">
		<div class="content-page">
			<div class="container">
				<div class="contact-map">
					<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d9928.098537753069!2d0.003301!3d51.531108!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6fd7aec7e2fb9eb6!2sBRR%20Wholesale%20Ltd!5e0!3m2!1sen!2sbd!4v1582812795595!5m2!1sen!2sbd" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
				</div>
				<!-- End Map -->
				<div class="contact-info-page">
					<div class="list-contact-info">
						<div class="row">
							<div class="col-md-4 col-sm-4 col-xs-12">
								<div class="item-contact-info">
									<a class="contact-icon icon-mobile" href="#"><i class="fa fa-mobile"></i></a>
									<h2>Hotline: <a href="#">01992 252141</a></h2>
								</div>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<div class="item-contact-info">
									<a class="contact-icon icon-phone" href="#"><i class="fa fa-phone"></i></a>
									<h2>Call: <a href="#">01992 252141</a></h2>
								</div>
							</div>
							<div class="col-md-4 col-sm-4 col-xs-12">
								<div class="item-contact-info last-item">
									<a class="contact-icon icon-email" href="mailto:7uptheme@gmail.com"><i class="fa fa-envelope"></i></a>
									<h2><a href="mailto:sales@brrwholesale.com">sales@brrwholesale.com</a></h2>
								</div>
							</div>
						</div>
					</div>
					<p class="desc">If the supplier fails to ship your products on time or the product quality does not meet the standards set in your contract, Aloshop will refund the covered amount of your payment.</p>
				</div>
				<div class="contact-form-page">
					<h2>contact from</h2>
					<div class="form-contact">
						<form>
							<div class="row">
								<div class="col-md-3 col-sm-4 col-xs-12">
									<input type="text" name="name" value="Name *" onfocus="if (this.value==this.defaultValue) this.value = ''" onblur="if (this.value=='') this.value = this.defaultValue">
								</div>
								<div class="col-md-3 col-sm-4 col-xs-12">
									<input type="text" name="email" value="Email *" onfocus="if (this.value==this.defaultValue) this.value = ''" onblur="if (this.value=='') this.value = this.defaultValue">
								</div>
								<div class="col-md-6 col-sm-4 col-xs-12">
									<input type="text" name="Contact No" value="Contact No" onfocus="if (this.value==this.defaultValue) this.value = ''" onblur="if (this.value=='') this.value = this.defaultValue">
								</div>
								<div class="col-md-12 col-sm-12 col-xs-12">
									<textarea name="message" cols="30" rows="8" onfocus="if (this.value==this.defaultValue) this.value = ''" onblur="if (this.value=='') this.value = this.defaultValue">Message</textarea>
									<input type="submit" value="Send" />
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->

</asp:Content>

