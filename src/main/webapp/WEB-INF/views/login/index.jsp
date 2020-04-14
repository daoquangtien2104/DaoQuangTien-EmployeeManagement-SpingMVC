<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="main-content">
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Argon Dashboard - Free Dashboard for Bootstrap 4 by Creative Tim</title>
<!-- Extra details for Live View on GitHub Pages -->
<!-- Canonical SEO -->
<link rel="canonical" href="https://www.creative-tim.com/product/argon-dashboard">
<!--  Social tags      -->
<meta name="keywords"
	content="dashboard, bootstrap 4 dashboard, bootstrap 4 design, bootstrap 4 system, bootstrap 4, bootstrap 4 uit kit, bootstrap 4 kit, argon, argon ui kit, creative tim, html kit, html css template, web template, bootstrap, bootstrap 4, css3 template, frontend, responsive bootstrap template, bootstrap ui kit, responsive ui kit, argon dashboard">
<meta name="description" content="Start your development with a Dashboard for Bootstrap 4.">
<!-- Twitter Card data -->
<meta name="twitter:card" content="product">
<meta name="twitter:site" content="@creativetim">
<meta name="twitter:title" content="Argon - Free Dashboard for Bootstrap 4 by Creative Tim">
<meta name="twitter:description" content="Start your development with a Dashboard for Bootstrap 4.">
<meta name="twitter:creator" content="@creativetim">
<meta name="twitter:image" content="https://s3.amazonaws.com/creativetim_bucket/products/96/original/opt_ad_thumbnail.jpg">
<!-- Open Graph data -->
<meta property="fb:app_id" content="655968634437471">
<meta property="og:title" content="Argon - Free Dashboard for Bootstrap 4 by Creative Tim">
<meta property="og:type" content="article">
<meta property="og:url" content="https://demos.creative-tim.com/argon-dashboard/index.html">
<meta property="og:image" content="https://s3.amazonaws.com/creativetim_bucket/products/96/original/opt_ad_thumbnail.jpg">
<meta property="og:description" content="Start your development with a Dashboard for Bootstrap 4.">
<meta property="og:site_name" content="Creative Tim">
<!-- Favicon -->
<link href="${pageContext.request.contextPath}/resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="${pageContext.request.contextPath}/resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet">
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.min.css?v=1.1.0" rel="stylesheet">
<!-- Google Tag Manager -->
<script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script>
<script src="https://connect.facebook.net/signals/plugins/inferredEvents.js?v=2.9.4" async=""></script>
<script src="https://connect.facebook.net/signals/config/111649226022273?v=2.9.4&amp;r=stable" async=""></script>
<script async="" src="//connect.facebook.net/en_US/fbevents.js"></script>
<script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-NKDMSK6"></script>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			'gtm.start' : new Date().getTime(),
			event : 'gtm.js'
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != 'dataLayer' ? '&l='
				+ l
				: '';
		j.async = true;
		j.src = 'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, 'script', 'dataLayer', 'GTM-NKDMSK6');
</script>
<!-- End Google Tag Manager -->
</head>
	<c:if test="${sessionScope.users != null}">
		<c:redirect url="/index"></c:redirect>
	</c:if>
<body class="bg-default">
	<!-- Extra details for Live View on GitHub Pages -->
	<!-- Google Tag Manager (noscript) -->
	<noscript>
		<iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NKDMSK6" height="0" width="0" style="display: none; visibility: hidden"></iframe>
	</noscript>
	<!-- End Google Tag Manager (noscript) -->
	<div class="main-content">
		<!-- Navbar -->

		<!-- Header -->
		<div class="header bg-gradient-primary py-7 py-lg-8">
			<div class="container">
				<div class="header-body text-center mb-7">
					<div class="row justify-content-center">
<!-- 						<div class="col-lg-5 col-md-6"> -->
<!-- 							<h1 class="text-white">Welcome!</h1> -->
<!-- 							<p class="text-lead text-light"></p> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
			<c:if test="${messeger != null}">
				<div class="alert alert-warning mb-5 w-50" role="alert" style="margin: auto; width: 500px">${messeger}</div>
			</c:if>
			<div class="separator separator-bottom separator-skew zindex-100">
				<svg x="0" y="0" viewBox="0 0 2560 100" preserveAspectRatio="none" version="1.1" xmlns="http://www.w3.org/2000/svg">
          <polygon class="fill-default" points="2560 0 2560 100 0 100"></polygon>
        </svg>
			</div>
		</div>
		<!-- Page content -->
		<div class="container mt--9 pb-7">
			<div class="row justify-content-center">
				<div class="col-sm-12 col-md-8 col-lg-5">
					<div class="card bg-secondary shadow border-0">
						<div class="card-header bg-transparent pb-3">
							<!-- 							<div class="text-muted text-center mt-2 mb-3"> -->
							<!-- 								<small>Sign in with</small> -->
							<!-- 							</div> -->
							<!-- 							<div class="btn-wrapper text-center"> -->
							<%-- 								<a href="#" class="btn btn-neutral btn-icon"> <span class="btn-inner--icon"><img src="${pageContext.request.contextPath}/resources/assets/img/icons/common/github.svg"></span> <span --%>
							<!-- 									class="btn-inner--text">Github</span> -->
							<%-- 								</a> <a href="#" class="btn btn-neutral btn-icon"> <span class="btn-inner--icon"><img src="${pageContext.request.contextPath}/resources/assets/img/icons/common/google.svg"></span> <span --%>
							<!-- 									class="btn-inner--text">Google</span> -->
							<!-- 								</a> -->
							<!-- 							</div> -->
						</div>
						<div class="card-body px-lg-5 py-lg-3">
							<div class="text-center text-muted mb-5">
								<b style="font-size: 30px">Đăng nhập hệ thống</b>
							</div>
							<form role="form" action="${pageContext.request.contextPath}/login/sign" method="post">
								<div class="form-group mb-3">
									<div class="input-group input-group-alternative mb-4">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="ni ni-badge"></i></span>
										</div>

										<input class="form-control" placeholder="Tài khoản" 
										name="username" type="text" 
										value="${cookie.user_username.value != null ? cookie.user_username.value : ''}">
									</div>
								</div>
								<div class="form-group">
									<div class="input-group input-group-alternative">
										<div class="input-group-prepend">
											<span class="input-group-text"><i class="ni ni-lock-circle-open"></i></span>
										</div>
										<input class="form-control" placeholder="Mật khẩu" 
										name="password" type="password" 
										value="${cookie.user_password.value != null ? cookie.user_password.value : ''}">
									</div>
								</div>
								<div class="custom-control custom-control-alternative custom-checkbox">
									<input class="custom-control-input" id=" customCheckLogin" 
									name="remember" type="checkbox" ${cookie.user_username.value != null ? 'checked' : ''}> 
									<label class="custom-control-label" for=" customCheckLogin"> <span class="text-muted">Remember
											me</span>
									</label>
								</div>
								<div class="text-center">
									<button type="submit" class="btn btn-primary my-4">Đăng nhập</button>
								</div>
							</form>
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-6">
							<a href="#" class="text-light"><small>Forgot password?</small></a>
						</div>
<!-- 						<div class="col-6 text-right"> -->
<!-- 							<a href="#" class="text-light"><small>Create new account</small></a> -->
<!-- 						</div> -->
					</div>
				</div>
			</div>
		</div>
		
		<footer class="py-5">
			<div class="container">
				<div class="row align-items-center justify-content-xl-between">
					<div class="col-xl-6">
						<div class="copyright text-center text-xl-left text-muted">
							© 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
						</div>
					</div>
					<div class="col-xl-6">
						<ul class="nav nav-footer justify-content-center justify-content-xl-end">
							<li class="nav-item"><a  class="nav-link" target="_blank">Creative Tiendqps08547</a></li>
 							<li class="nav-item"><a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a></li>
 							<li class="nav-item"><a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a></li>
 							<li class="nav-item"><a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a></li>
 						</ul> 
					</div>
				</div>
			</div>
		</footer>
	</div>
	
	<!--   Core   -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
	<!--   Optional JS   -->
	<noscript>
		<img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
	</noscript>
	<!--   Argon JS   -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
	
	<script>
		// Facebook Pixel Code Don't Delete
		!function(f, b, e, v, n, t, s) {
			if (f.fbq)
				return;
			n = f.fbq = function() {
				n.callMethod ? n.callMethod.apply(n, arguments) : n.queue
						.push(arguments)
			};
			if (!f._fbq)
				f._fbq = n;
			n.push = n;
			n.loaded = !0;
			n.version = '2.0';
			n.queue = [];
			t = b.createElement(e);
			t.async = !0;
			t.src = v;
			s = b.getElementsByTagName(e)[0];
			s.parentNode.insertBefore(t, s)
		}(window, document, 'script',
				'//connect.facebook.net/en_US/fbevents.js');

		try {
			fbq('init', '111649226022273');
			fbq('track', "PageView");

		} catch (err) {
			console.log('Facebook Track Error:', err);
		}
	</script>
	<noscript>
		<img height="1" width="1" style="display: none" src="https://www.facebook.com/tr?id=111649226022273&ev=PageView&noscript=1" />
	</noscript>
	
	

</body>
</html>