<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MainMaster.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Pages_Blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div id="content">
		<div class="content-page">
			<div class="container">
				<div class="bread-crumb radius">
					<a href="#">Home</a> <span>Blog</span>
				</div>
				<!-- End Bread Crumb -->
				<div class="content-blog-masonry">
					<div class="sort-pagi-bar clearfix">
						<div class="sort-bar select-box pull-left">
							<label>Sort By:</label>
							<select>
								<option value="">position</option>
								<option value="">price</option>
							</select>
						</div>
						<div class="sort-paginav pull-right">
							<div class="show-bar select-box">
								<label>Show:</label>
								<select>
									<option value="">20</option>
									<option value="">12</option>
									<option value="">24</option>
								</select>
							</div>
						</div>
					</div>
					<!-- End Sort PagiBar -->
					<div class="list-post-masonry">
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Slide</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/11.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Image</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/3.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Image Gallery</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/1.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Slide</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/8.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Row -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Slide</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/6.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Image</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/2.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Image Gallery</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/9.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Slide</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/7.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Row -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Slide</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/5.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Image</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/10.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Image Gallery</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/12.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Item -->
						<div class="item-post-masonry">
							<div class="post-item">
								<h3 class="post-title"><a href="#">Post Fomat - Slide</a></h3>
								<div class="post-thumb">
									<a class="post-thumb-link" href="#"><img alt="" src="images/photos/blog/13.jpg"></a>
								</div>
								<div class="post-info">
									<ul class="post-date-comment">
										<li><i aria-hidden="true" class="fa fa-clock-o"></i><span>Dec.8. 2016</span></li>
										<li><i aria-hidden="true" class="fa fa-comment"></i><a href="#comment">9 Comments </a></li>
									</ul>
									<p class="desc">Our urban and streetwear fashion place is no Old Navy, Banana Republic or a Walmart clothing </p>
									<a href="#" class="readmore">Read more</a>
								</div>
							</div>
						</div>
						<!-- End Row -->
					</div>
					<!-- End List Post Masonry -->
					<div class="btn-loadmore"><a href="#"><i aria-hidden="true" class="fa fa-spinner fa-spin"></i></a></div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Content -->

</asp:Content>

