<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Hệ Thống Quản Lý Nhân Viên</title>
<!-- Favicon -->
<link href="${pageContext.request.contextPath}/resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="${pageContext.request.contextPath}/resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<%-- <link href="${pageContext.request.contextPath}/resources/css/jquery.dataTables.css" rel="stylesheet" /> --%>
<link href="${pageContext.request.contextPath}/resources/css/sweetalert2.min.css" rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="${pageContext.request.contextPath}/resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/dataTables.bootstrap4.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@8/dist/polyfill.js"></script>	
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css"> -->
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script> -->
<script src="${pageContext.request.contextPath}/resources/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.validate.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
		<div class="container-fluid">
			<!-- Toggler -->
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Brand -->
			<a class="navbar-brand pt-0" href="./index.html"> <img src="${pageContext.request.contextPath}/resources/assets/img/brand/manager.jpg" class="navbar-brand-img w-100 h-20" alt="...">
			</a>
			<!-- User -->
			<ul class="nav align-items-center d-md-none">
				<li class="nav-item dropdown"><a class="nav-link nav-link-icon" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> <i class="ni ni-bell-55"></i>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right" aria-labelledby="navbar-default_dropdown_1">
						<a class="dropdown-item" href="#">Action</a> <a class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
				<li class="nav-item dropdown"><a class="nav-link" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle"> <img alt="Image placeholder" src="${pageContext.request.contextPath}/resources/assets/img/theme/team-1-800x800.jpg
">
							</span>
						</div>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a href="./examples/profile.html" class="dropdown-item"> <i class="ni ni-single-02"></i> <span>My profile</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i class="ni ni-settings-gear-65"></i> <span>Settings</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i class="ni ni-calendar-grid-58"></i> <span>Activity</span>
						</a> <a href="./examples/profile.html" class="dropdown-item"> <i class="ni ni-support-16"></i> <span>Support</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="${pageContext.request.contextPath}/login/logout" class="dropdown-item"><iclass="ni ni-user-run"></i> <span>Logout aa</span></a>
					</div>
				</li>
			</ul>
			<!-- Collapse -->
			<div class="collapse navbar-collapse" id="sidenav-collapse-main">
				<!-- Collapse header -->
				<div class="navbar-collapse-header d-md-none">
					<div class="row">
						<div class="col-6 collapse-brand">
							<a href="./index.html"> <img src="${pageContext.request.contextPath}/resources/assets/img/brand/blue.png">
							</a>
						</div>
						<div class="col-6 collapse-close">
							<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle sidenav">
								<span></span> <span></span>
							</button>
						</div>
					</div>
				</div>
				<!-- Form -->
				<form class="mt-4 mb-3 d-md-none">
					<div class="input-group input-group-rounded input-group-merge">
						<input type="search" class="form-control form-control-rounded form-control-prepended" placeholder="Search" aria-label="Search">
						<div class="input-group-prepend">
							<div class="input-group-text">
								<span class="fa fa-search"></span>
							</div>
						</div>
					</div>
				</form>
				<!-- Navigation -->
				<ul class="navbar-nav">
					<li class="nav-item  class=" active"=""><a class=" nav-link active " href="${pageContext.request.contextPath}/index"> <i class="ni ni-tv-2 text-primary"></i> <s:message code="menu.left.index"/>
					</a></li>
					<li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/staff"> <i class="ni ni-planet text-blue"></i> <s:message code="menu.left.staff"/>
					</a></li>
					<li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/depart"> <i class="ni ni-pin-3 text-orange"></i> <s:message code="menu.left.depart"/>
					</a></li>
					<li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/user"> <i class="ni ni-single-02 text-yellow"></i><s:message code="menu.left.user"/>
					</a></li>
					<li class="nav-item"><a class="nav-link " href="${pageContext.request.contextPath}/record"> <i class="ni ni-bullet-list-67 text-red"></i> <s:message code="menu.left.record"/>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/login/logout"> <i class="ni ni-key-25 text-info"> </i> <s:message code="menu.left.logout"/>
					</a></li>
				</ul>
				<!-- Divider -->
				<hr class="my-3">
<!-- 				Heading -->
<!-- 				<h6 class="navbar-heading text-muted">Documentation</h6> -->
<!-- 				Navigation -->
<!-- 				<ul class="navbar-nav mb-md-3"> -->
<!-- 					<li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/getting-started/overview.html"> <i class="ni ni-spaceship"></i> Getting started -->
<!-- 					</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/foundation/colors.html"> <i class="ni ni-palette"></i> Foundation -->
<!-- 					</a></li> -->
<!-- 					<li class="nav-item"><a class="nav-link" href="https://demos.creative-tim.com/argon-dashboard/docs/components/alerts.html"> <i class="ni ni-ui-04"></i> Components -->
<!-- 					</a></li> -->
<!-- 				</ul> -->
			</div>
		</div>
	</nav>

	<div class="main-content">
		<c:if test="${file_include_path != null}">
			<jsp:include page="${file_include_path}" />
		</c:if>

	</div>



	<%-- 	<c:if test="${site != null && route != null}"> --%>
	<%-- 		<jsp:include page="${site}/${route}.jsp" /> --%>
	<%-- 	</c:if>
	href="trang-chu2?site=depart&route=index" --%>


	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<!-- 	  Optional JS   -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins/chart.js/dist/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/plugins/chart.js/dist/Chart.extension.js"></script>
<!-- 	  Argon JS   -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/argon-dashboard.min.js?v=1.1.0"></script>
		<script src="${pageContext.request.contextPath}/resources/js/sweetalert2.all.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/alert-helper.js"></script>	
	<script src="https://cdn.trackjs.com/agent/v3/latest/t.js"></script>
	<script>
		window.TrackJS && TrackJS.install({
			token : "ee6fab19c5a04ac1a32a645abde4613a",
			application : "argon-dashboard-free"
		});
	</script>
	
	
	<!-- Hien thong bao thanh cong -->
<c:if test="${requestScope.msgSuccess != null}">
	<script>
		$(document).ready(function() {
			AlertHelper.showSimpleSuccess('Thông Báo', '${msgSuccess}');
		});
	</script>
</c:if>

<!-- Hien thong bao that bai -->
<c:if test="${requestScope.msgError != null}">
	<script>
		$(document).ready(function() {
			AlertHelper.showSimpleError('Đã có lỗi', '${msgError}');
		});
	</script>
</c:if>

</body>
</html>