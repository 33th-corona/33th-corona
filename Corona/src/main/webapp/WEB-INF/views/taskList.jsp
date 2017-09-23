<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html dir="ltr" lang="ko-KR">
<head>

	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="author" content="SemiColonWeb" />

	<!-- Stylesheets
	============================================= -->
	<link href="http://fonts.googleapis.com/css?family=Lato:300,400,400italic,600,700|Raleway:300,400,500,600,700|Crete+Round:400italic" rel="stylesheet" type="text/css" />
	<link rel="stylesheet" href="css/bootstrap.css" type="text/css" />
	<link rel="stylesheet" href="css/style.css" type="text/css" />
	<link rel="stylesheet" href="css/swiper.css" type="text/css" />
	<link rel="stylesheet" href="css/dark.css" type="text/css" />
	<link rel="stylesheet" href="css/font-icons.css" type="text/css" />
	<link rel="stylesheet" href="css/animate.css" type="text/css" />
	<link rel="stylesheet" href="css/magnific-popup.css" type="text/css" />

	<link rel="stylesheet" href="css/responsive.css" type="text/css" />
	<meta name="viewport" content="width=device-width, initial-scale=1" />
	
	<!-- countdown -->
	

	<script type="text/javascript" src="js/plugins.js"></script>
	<!-- countdown -->
	
	
	<!-- Document Title
	============================================= -->
	<title>Corona - 자료실</title>

</head>
<%@ include file="topMenu.jsp" %>
	<%@ include file="sidebar.jsp" %>

<body class="stretched">

	<!-- Document Wrapper
	============================================= -->
		
	<div id="wrapper" class="clearfix">
	
		<!-- Content
		============================================= -->
		<section id="content">
				<!-- 특정 글 검색 -->
				<div class="search">
					<form id="search" action ="taskList" method="GET" >
					<input type = "hidden" name = "action" value = "taskList">
					<select name="searchtype">
						<option value="title" ${searchtype=='title' ? 'selected' : '' }>제목</option>
						<option value="user_id" ${searchtype=='user_id' ? 'selected' : '' }>작성자</option>
						<option value="content" ${searchtype=='content' ? 'selected' : '' }>내용</option>
					</select>
					<input type="text" name="searchword" value="${searchword}" /> 
					<input class="btn" type="submit" value="검색" />
					</form>
				</div>

			<div class="content-wrap">

				<a class="button button-full button-purple center tright header-stick bottommargin-lg" href="taskWrite">
					<div class="container clearfix">
						<i class="icon-plus" style="top:4px;"></i>
					</div>
				</a>

				<!-- 게시판 시작
				============================================= -->
				<div id="posts" class="post-grid grid-container post-masonry post-masonry-full grid-3 clearfix">
				
				
				<!-- 과제 forEach
				<c:forEach var="task" items="${taskList}" varStatus="stat">
					<div class="entry clearfix">
					
					<div class="clock" id="clock"+"/${stat.count}"/ ></div>
					
						<div class="entry-title">
							<h2><a href="taskDetail?num=${task.num}">${task.title}</a></h2>
						</div>
						<ul class="entry-meta clearfix">
							<li><i class="icon-calendar3"></i>${task.is_closed}</li>
						</ul>
						<div class="entry-content">
							<h2>${task.content}</h2>
							<a href="driveDetail?num=${task.num}" class="more-link">Read More</a>
						</div>
					</div>
				</c:forEach>
				-->
				
				<div class="entry clearfix">
						<div class="entry-image">
							<a href="images/portfolio/full/17.jpg" data-lightbox="image"><img class="image_fade" src="images/blog/small/17.jpg" alt="Standard Post with Image"></a>
						</div>
						<div class="entry-title">
							<h2><a href="blog-single.html">This is a Standard post with a Preview Image</a></h2>
						</div>
						<ul class="entry-meta clearfix">
							<li><i class="icon-calendar3"></i> 10th Feb 2014</li>
							<li><a href="blog-single.html#comments"><i class="icon-comments"></i> 13</a></li>
							<li><a href="#"><i class="icon-camera-retro"></i></a></li>
						</ul>
						<div class="entry-content">
						<div class="clock" id="c1" ></div>
	
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Cupiditate, asperiores quod est tenetur in. Eligendi, deserunt, blanditiis est quisquam doloribus.</p>
							<a href="blog-single.html"class="more-link">Read More</a>
						</div>
					</div>

				   <div class="entry clearfix">
						<div class="entry-image">
							<iframe src="http://player.vimeo.com/video/87701971" width="500" height="281" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
						</div>
						<div class="entry-title">
							<h2><a href="blog-single-full.html">This is a Standard post with an Embedded Video</a></h2>
						</div>
						<ul class="entry-meta clearfix">
							<li><i class="icon-calendar3"></i> 16th Feb 2014</li>
							<li><a href="blog-single-full.html#comments"><i class="icon-comments"></i> 19</a></li>
							<li><a href="#"><i class="icon-film"></i></a></li>
						</ul>
						<div class="entry-content">
							<p>Asperiores, tenetur, blanditiis, quaerat odit ex exercitationem pariatur quibusdam veritatis quisquam laboriosam esse beatae hic perferendis velit deserunt!</p>
							<a href="blog-single-full.html"class="more-link">Read More</a>
						</div>
					</div>

					<div class="entry clearfix">
						<div class="entry-image">
							<div class="fslider" data-arrows="false" data-lightbox="gallery">
								<div class="flexslider">
									<div class="slider-wrap">
										<div class="slide"><a href="images/portfolio/full/10.jpg" data-lightbox="gallery-item"><img class="image_fade" src="images/blog/masonry/10.jpg" alt="Standard Post with Gallery"></a></div>
										<div class="slide"><a href="images/portfolio/full/20.jpg" data-lightbox="gallery-item"><img class="image_fade" src="images/blog/masonry/20.jpg" alt="Standard Post with Gallery"></a></div>
										<div class="slide"><a href="images/portfolio/full/21.jpg" data-lightbox="gallery-item"><img class="image_fade" src="images/blog/masonry/21.jpg" alt="Standard Post with Gallery"></a></div>
									</div>
								</div>
							</div>
						</div>
						<div class="entry-title">
							<h2><a href="blog-single-small.html">This is a Standard post with a Slider Gallery</a></h2>
						</div>
						<ul class="entry-meta clearfix">
							<li><i class="icon-calendar3"></i> 24th Feb 2014</li>
							<li><a href="blog-single-small.html#comments"><i class="icon-comments"></i> 21</a></li>
							<li><a href="#"><i class="icon-picture"></i></a></li>
						</ul>
						<div class="entry-content">
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ratione, voluptatem, dolorem animi nisi autem blanditiis enim culpa reiciendis et explicabo tenetur!</p>
							<a href="blog-single-small.html"class="more-link">Read More</a>
						</div>
					</div>
				
				
				
				</div><!-- #posts end -->
			</div><!-- end content-wrap end -->
			
			<!-- 페이징 시작 -->
			<div id="navigator">
				<ul class="pagination pagination-lg">
					<li><a href="taskList?currentPage= ${navi.currentPage - navi.pagePerGroup}">◁ ◁</a></li>
					<li><a href="taskList?currentPage= ${navi.currentPage-1}&searchtype=${searchtype}&searchword=${searchword}"> ◀ </a></li>
				<c:forEach var="page" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
					<c:if test="${navi.currentPage eq page}">
						<li class="active"><a href="#">${page}</a></li>
					</c:if>
					<c:if test="${navi.currentPage ne page}">
						<li><a href="taskList?currentPage=${page}&searchtype=${searchtype}&searchword=${searchword}">${page}</a></li>
					</c:if>
				</c:forEach>
				<li><a href="taskList?currentPage= ${navi.currentPage+1}&searchtype=${searchtype}&searchword=${searchword}&countPerPage=${countPerPage}">▶</a> </li>
				<li><a href="taskList?currentPage= ${navi.currentPage + navi.pagePerGroup}">▷ ▷</a></li>  
				</ul> 
			</div><!-- end paging -->
			
		</section><!-- #content end -->

		<!-- Footer
		============================================= -->
		<footer id="footer" class="dark">

			<div class="container">

				<!-- Footer Widgets
				============================================= -->
				<div class="footer-widgets-wrap clearfix">

					<div class="col_two_third">

						<div class="col_one_third">

							<div class="widget clearfix">

								<img src="images/footer-widget-logo.png" alt="" class="footer-logo">

								<p>We believe in <strong>Simple</strong>, <strong>Creative</strong> &amp; <strong>Flexible</strong> Design Standards.</p>

								<div style="background: url('images/world-map.png') no-repeat center center; background-size: 100%;">
									<address>
										<strong>Headquarters:</strong><br>
										795 Folsom Ave, Suite 600<br>
										San Francisco, CA 94107<br>
									</address>
									<abbr title="Phone Number"><strong>Phone:</strong></abbr> (91) 8547 632521<br>
									<abbr title="Fax"><strong>Fax:</strong></abbr> (91) 11 4752 1433<br>
									<abbr title="Email Address"><strong>Email:</strong></abbr> info@canvas.com
								</div>

							</div>

						</div>

						<div class="col_one_third">

							<div class="widget widget_links clearfix">

								<h4>Blogroll</h4>

								<ul>
									<li><a href="http://codex.wordpress.org/">Documentation</a></li>
									<li><a href="http://wordpress.org/support/forum/requests-and-feedback">Feedback</a></li>
									<li><a href="http://wordpress.org/extend/plugins/">Plugins</a></li>
									<li><a href="http://wordpress.org/support/">Support Forums</a></li>
									<li><a href="http://wordpress.org/extend/themes/">Themes</a></li>
									<li><a href="http://wordpress.org/news/">WordPress Blog</a></li>
									<li><a href="http://planet.wordpress.org/">WordPress Planet</a></li>
								</ul>

							</div>

						</div>

						<div class="col_one_third col_last">

							<div class="widget clearfix">
								<h4>Recent Posts</h4>

								<div id="post-list-footer">
									<div class="spost clearfix">
										<div class="entry-c">
											<div class="entry-title">
												<h4><a href="#">Lorem ipsum dolor sit amet, consectetur</a></h4>
											</div>
											<ul class="entry-meta">
												<li>10th July 2014</li>
											</ul>
										</div>
									</div>

									<div class="spost clearfix">
										<div class="entry-c">
											<div class="entry-title">
												<h4><a href="#">Elit Assumenda vel amet dolorum quasi</a></h4>
											</div>
											<ul class="entry-meta">
												<li>10th July 2014</li>
											</ul>
										</div>
									</div>

									<div class="spost clearfix">
										<div class="entry-c">
											<div class="entry-title">
												<h4><a href="#">Debitis nihil placeat, illum est nisi</a></h4>
											</div>
											<ul class="entry-meta">
												<li>10th July 2014</li>
											</ul>
										</div>
									</div>
								</div>
							</div>

						</div>

					</div>

					<div class="col_one_third col_last">

						<div class="widget clearfix" style="margin-bottom: -20px;">

							<div class="row">

								<div class="col-md-6 bottommargin-sm">
									<div class="counter counter-small"><span data-from="50" data-to="15065421" data-refresh-interval="80" data-speed="3000" data-comma="true"></span></div>
									<h5 class="nobottommargin">Total Downloads</h5>
								</div>

								<div class="col-md-6 bottommargin-sm">
									<div class="counter counter-small"><span data-from="100" data-to="18465" data-refresh-interval="50" data-speed="2000" data-comma="true"></span></div>
									<h5 class="nobottommargin">Clients</h5>
								</div>

							</div>

						</div>

						<div class="widget subscribe-widget clearfix">
							<h5><strong>Subscribe</strong> to Our Newsletter to get Important News, Amazing Offers &amp; Inside Scoops:</h5>
							<div class="widget-subscribe-form-result"></div>
							<form id="widget-subscribe-form" action="include/subscribe.php" role="form" method="post" class="nobottommargin">
								<div class="input-group divcenter">
									<span class="input-group-addon"><i class="icon-email2"></i></span>
									<input type="email" id="widget-subscribe-form-email" name="widget-subscribe-form-email" class="form-control required email" placeholder="Enter your Email">
									<span class="input-group-btn">
										<button class="btn btn-success" type="submit">Subscribe</button>
									</span>
								</div>
							</form>
						</div>

						<div class="widget clearfix" style="margin-bottom: -20px;">

							<div class="row">

								<div class="col-md-6 clearfix bottommargin-sm">
									<a href="#" class="social-icon si-dark si-colored si-facebook nobottommargin" style="margin-right: 10px;">
										<i class="icon-facebook"></i>
										<i class="icon-facebook"></i>
									</a>
									<a href="#"><small style="display: block; margin-top: 3px;"><strong>Like us</strong><br>on Facebook</small></a>
								</div>
								<div class="col-md-6 clearfix">
									<a href="#" class="social-icon si-dark si-colored si-rss nobottommargin" style="margin-right: 10px;">
										<i class="icon-rss"></i>
										<i class="icon-rss"></i>
									</a>
									<a href="#"><small style="display: block; margin-top: 3px;"><strong>Subscribe</strong><br>to RSS Feeds</small></a>
								</div>

							</div>

						</div>

					</div>

				</div><!-- .footer-widgets-wrap end -->

			</div>

			<!-- Copyrights
			============================================= -->
			<div id="copyrights">

				<div class="container clearfix">

					<div class="col_half">
						Copyrights &copy; 2014 All Rights Reserved by Canvas Inc.<br>
						<div class="copyright-links"><a href="#">Terms of Use</a> / <a href="#">Privacy Policy</a></div>
					</div>

					<div class="col_half col_last tright">
						<div class="fright clearfix">
							<a href="#" class="social-icon si-small si-borderless si-facebook">
								<i class="icon-facebook"></i>
								<i class="icon-facebook"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-twitter">
								<i class="icon-twitter"></i>
								<i class="icon-twitter"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-gplus">
								<i class="icon-gplus"></i>
								<i class="icon-gplus"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-pinterest">
								<i class="icon-pinterest"></i>
								<i class="icon-pinterest"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-vimeo">
								<i class="icon-vimeo"></i>
								<i class="icon-vimeo"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-github">
								<i class="icon-github"></i>
								<i class="icon-github"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-yahoo">
								<i class="icon-yahoo"></i>
								<i class="icon-yahoo"></i>
							</a>

							<a href="#" class="social-icon si-small si-borderless si-linkedin">
								<i class="icon-linkedin"></i>
								<i class="icon-linkedin"></i>
							</a>
						</div>

						<div class="clear"></div>

						<i class="icon-envelope2"></i> info@canvas.com <span class="middot">&middot;</span> <i class="icon-headphones"></i> +91-11-6541-6369 <span class="middot">&middot;</span> <i class="icon-skype2"></i> CanvasOnSkype
					</div>

				</div>

			</div><!-- #copyrights end -->

		</footer><!-- #footer end -->

	</div><!-- #wrapper end -->

	<!-- Go To Top
	============================================= -->
	<div id="gotoTop" class="icon-angle-up"></div>

	<!-- External JavaScripts
	============================================= -->
	<script type="text/javascript" src="js/jquery.js"></script>
	<link rel="stylesheet" href="css/flipclock.css">
	<script src="js/flipclock.js"></script>
	
	<div class="forEach">
	
	<c:forEach var="task" items="${taskList}" varStatus="stat">
		<script type="text/javascript">
			var clock = $("#clock"+${stat.count}).FlipClock(6000, {
				clockFace: 'DailyCounter',
				countdown: true
			});
		</script>
	</c:forEach>
	
	<!-- 
	<script type="text/javascript">
	var clock = $('#c1').FlipClock(60, {
		clockFace: 'DailyCounter',
		countdown: true
	});
	</script>
	-->
	
	</div>

	<!-- Footer Scripts
	============================================= -->
	<script type="text/javascript" src="js/functions.js"></script>

</body>
</html>