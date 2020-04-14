<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div class="main-content">
	<!-- Navbar -->
	<nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
		<div class="container-fluid">
			<!-- Brand -->
			<a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Quản lý nhân sự</a>
			<!-- Form -->
			<form class="navbar-search navbar-search-dark form-inline mr-3 d-none d-md-flex ml-lg-auto">
				<div class="form-group mb-0"></div>
			</form>
			<!-- User -->
			<ul class="navbar-nav align-items-center d-none d-md-flex">
				<li class="nav-item dropdown"><a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<div class="media align-items-center">
							<span class="avatar avatar-sm rounded-circle"> <img alt="Image placeholder" src="${pageContext.request.contextPath}/resources/assets/img/theme/user.jpg">
							</span>
							<div class="media-body ml-2 d-none d-lg-block">
								<span class="mb-0 text-sm  font-weight-bold">${sessionScope.users.fullname}</span>
							</div>
						</div>
				</a>
					<div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
						<div class=" dropdown-header noti-title">
							<h6 class="text-overflow m-0">Welcome!</h6>
						</div>
						<a href="./examples/profile.html" id="btnEn" class="dropdown-item"> <span>Tiếng Anh</span>
						</a> <a href="./examples/profile.html" id="btnVi" class="dropdown-item"> <span>Tiếng Việt</span>
						</a>
						<div class="dropdown-divider"></div>
						<a href="${pageContext.request.contextPath}/login/logout" class="dropdown-item"> <i class="ni ni-user-run"></i> <span>Đăng xuất</span>
						</a>
					</div></li>
			</ul>
		</div>
	</nav>
	<!-- End Navbar -->
	<!-- Header -->
	<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
		<div class="container-fluid">
			<div class="header-body">
				<!-- Card stats -->
				<div class="row">
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Tổng số nhân viên</h5>
										<span class="h2 font-weight-bold mb-0">150</span>
									</div>
									<div class="col-auto">
										<div class="icon icon-shape bg-danger text-white rounded-circle shadow">
											<i class="fas fa-chart-bar"></i>
										</div>
									</div>
								</div>
								<p class="mt-3 mb-0 text-muted text-sm">
									<span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span> <span class="text-nowrap">Since last month</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Tổng phòng ban</h5>
										<span class="h2 font-weight-bold mb-0">23</span>
									</div>
									<div class="col-auto">
										<div class="icon icon-shape bg-warning text-white rounded-circle shadow">
											<i class="fas fa-chart-pie"></i>
										</div>
									</div>
								</div>
								<p class="mt-3 mb-0 text-muted text-sm">
									<span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 3.48%</span> <span class="text-nowrap">Since last week</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Nhân viên xuất sắc</h5>
										<span class="h2 font-weight-bold mb-0">924</span>
									</div>
									<div class="col-auto">
										<div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
											<i class="fas fa-users"></i>
										</div>
									</div>
								</div>
								<p class="mt-3 mb-0 text-muted text-sm">
									<span class="text-warning mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span> <span class="text-nowrap">Since yesterday</span>
								</p>
							</div>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6">
						<div class="card card-stats mb-4 mb-xl-0">
							<div class="card-body">
								<div class="row">
									<div class="col">
										<h5 class="card-title text-uppercase text-muted mb-0">Phòng ban xuất sắc</h5>
										<span class="h2 font-weight-bold mb-0">49,65%</span>
									</div>
									<div class="col-auto">
										<div class="icon icon-shape bg-info text-white rounded-circle shadow">
											<i class="fas fa-percent"></i>
										</div>
									</div>
								</div>
								<p class="mt-3 mb-0 text-muted text-sm">
									<span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span> <span class="text-nowrap">Since last month</span>
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid mt--7">
		<div class="row">
			<div class="col-12">

				<!-- 						TOP STAFF  -->
					<form id="formStatistic" action="${pageContext.request.contextPath}/index">
						<div class="d-flex justify-content-between">
							<h2 class="text-white mb-4 col-5">TOP 10 nhân viên xuất sắc trong năm</h2>
								<div class="form-group col-3">
									<label class="text-white">Thống kê theo: </label> <br> 
									<select name="statisticMonth" class="custom-select w-100" id="selectDepart" class="form-control border-0 mt-0 ml-5">
										<option value="0" ${param.statisticMonth == 0 ? 'selected' : ''}>Cả năm</option>
										<option value="1" ${param.statisticMonth == 1 ? 'selected' : ''}>Tháng 1</option>
										<option value="2" ${param.statisticMonth == 2 ? 'selected' : ''}>Tháng 2</option>
										<option value="3" ${param.statisticMonth == 3 ? 'selected' : ''}>Tháng 3</option>
										<option value="4" ${param.statisticMonth == 4 ? 'selected' : ''}>Tháng 4</option>
										<option value="5" ${param.statisticMonth == 5 ? 'selected' : ''}>Tháng 5</option>
										<option value="6" ${param.statisticMonth == 6 ? 'selected' : ''}>Tháng 6</option>
										<option value="7" ${param.statisticMonth == 7 ? 'selected' : ''}>Tháng 7</option>
										<option value="8" ${param.statisticMonth == 8 ? 'selected' : ''}>Tháng 8</option>
										<option value="9" ${param.statisticMonth == 9 ? 'selected' : ''}>Tháng 9</option>
										<option value="10" ${param.statisticMonth == 10 ? 'selected' : ''}>Tháng 10</option>
										<option value="11" ${param.statisticMonth == 11 ? 'selected' : ''}>Tháng 11</option>
										<option value="12" ${param.statisticMonth == 12 ? 'selected' : ''}>Tháng 12</option>
									</select>
								</div>
						</div>
					</form>

				<div class="row">
					<c:if test="${listTopStaff != null}">
						<c:forEach var="staff" items="${listTopStaff}" varStatus="loop">
							<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3 mb-3">
								<div class="card shadow">
									<div class="card-header mb-3 bg-secondary">
										<b>TOP <b class="text-danger">#${loop.index + 1}</b></b>
									</div>
									<img class="card-img-top mx-auto rounded-cicle" src="${pageContext.request.contextPath}/resources/img/${staff[1] != null ? staff[1] : 'user-default.png'}" style="width: 150px; height: 150px;"
										alt="Card image cap">
									<div class="card-body py-3">
										<h3 class="card-title text-center" style="font-size: 15px;">${staff[2]}</h5>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item d-flex justify-content-between">Điểm thưởng: <span class="badge badge-success text-bold px-2">${staff[3]}</span>
										</li>
										<li class="list-group-item d-flex justify-content-between">Điểm phạt: <span class="badge badge-danger text-bold px-2">${staff[4]}</span>
										</li>
										<li class="list-group-item d-flex justify-content-between">Tổng điểm: <span class="badge badge-info text-bold px-2">${staff[5]}</span>
										</li>
									</ul>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>


				<div class="card">

					<div class="card-header bg-transparent">
						<h2 class="card-title text-muted mb-0"><s:message code="best.person.year"/></h2>
					</div>
					<div class="card-body table-responsive">
						<table class="table align-items-center dataTable no-footer">
							<thead>
								<tr>
									<th>TOP</th>
									<th>Mã phòng ban</th>
									<th>Tên phòng ban</th>
									<th>Tổng nhân viên</th>
									<th>Điểm thưởng</th>
									<th>Điểm phạt</th>
									<th>Tổng điểm</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="depart" items="${listTopDepart}" varStatus="loop">
									<tr>
										<td><b style="color: red;">#${loop.index + 1}</b></td>
										<td class="text-bold">${depart[0]}</td>
										<td class="text-bold">${depart[1]}</td>
										<td><span class="badge badge-dark text-bold px-3" style="font-size: 16px">${depart[2]}</span></td>
										<td><span class="badge badge-success text-bold px-3" style="font-size: 16px">${depart[3]}</span></td>
										<td><span class="badge badge-danger text-bold px-3" style="font-size: 16px">${depart[4]}</span></td>
										<td><span class="badge badge-info text-bold px-3" style="font-size: 16px">${depart[5]}</span></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>

			</div>


		</div>
		<!-- Footer -->
		<footer class="footer">
			<div class="row align-items-center justify-content-xl-between">
				<div class="col-xl-6">
					<div class="copyright text-center text-xl-left text-muted">
						© 2018 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">Creative Tim</a>
					</div>
				</div>
				<div class="col-xl-6">
					<ul class="nav nav-footer justify-content-center justify-content-xl-end">
						<li class="nav-item"><a href="https://www.creative-tim.com" class="nav-link" target="_blank">Creative Tim</a></li>
						<li class="nav-item"><a href="https://www.creative-tim.com/presentation" class="nav-link" target="_blank">About Us</a></li>
						<li class="nav-item"><a href="http://blog.creative-tim.com" class="nav-link" target="_blank">Blog</a></li>
						<li class="nav-item"><a href="https://github.com/creativetimofficial/argon-dashboard/blob/master/LICENSE.md" class="nav-link" target="_blank">MIT License</a></li>
					</ul>
				</div>
			</div>
		</footer>
	</div>
</div>

<script>
	$(document).ready(function() {
		//bat su kien khi select chon thang thay doi thi submit form
		$('#formStatistic select[name="statisticMonth"]').change(function () {
			$('#formStatistic').submit();
		});
		
		//bat su kien click nut doi ngon ngu
		$('#btnEn').click(function() {
			document.cookie = "lang=en; path=/";
			location.reload();
			return false;
		});
		
		//bat su kien click nut doi ngon ngu
		$('#btnVi').click(function() {
			document.cookie = "lang=vi; path=/";
			location.reload();
			return false;
		});
	});
	
</script>

