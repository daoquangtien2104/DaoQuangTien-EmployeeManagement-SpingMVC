<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%-- <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
	<div class="container-fluid">
		<!-- Brand -->
		<a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">MANAGER-STAFF</a>
		<!-- Form -->
		<form class="navbar-search navbar-search-dark mt-4 form-inline mr-3 d-none d-md-flex ml-lg-auto" action="${pageContext.request.contextPath}/depart/index">
			<div class="form-group mb-0">

				<input class="form-control border border-success" name="search" placeholder="Search" type="text" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Nhập id">

				<button type="submit" class="btn btn-success ml-3">Search</button>
			</div>
		</form>
		<!-- User -->

	</div>
</nav> --%>
<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>
<div class="container-fluid mt--8">
	<div class="row">
		<div class="col">
			<div class="card shadow">
				<div class="card-header bg-transparent">
					<h3 class="card-title text-uppercase text-muted mb-0">
						&nbsp;&nbsp;&nbsp;<s:message code="depart.title"/>
					</h3>
					<div></div>
				</div>
				<div class="card-body">
					<form action="${pageContext.request.contextPath}/depart/index" id="formDepart" accept-charset="character_set">
						<div class="row ">

							<div class="col-xl">
								<div class="form-group">

									<c:if test="${msgError != null }">
										<label class="alert alert-danger" style="width: 100%">${msgError}</label>
									</c:if>

									<%-- 									<c:if test="${msgsucces != null"> --%>
									<%-- 										<label class="alert alert-success" style="width: 100%">${msgsucces}</label> --%>
									<%-- 									</c:if> --%>


									<input class="form-control" name="id" placeholder="ID" value="${editValue.id }">

								</div>
								<div class="form-group">
									<input class="form-control" name="name" placeholder="Name" value="${editValue.name}">
								</div>
								<div class="form-group">
									<c:if test="${editValue == null}">
										<button type="submit" class="btn  btn-lg btn-block mb-4" style="background-color: #4dc7ac" name="btnInsert"><s:message code="tbl.depart.col.insert"/></button>
									</c:if>
									<c:if test="${editValue != null}">
										<div class=" row d-inline ml-1">
											<button type="submit" class="btn btn-primary mb-3" style="width: 32%" name="btnEdit">Sửa</button>
											<button type="submit" class="btn btn-primary mb-3 ml-1" style="width: 32%" name="btnDelete">Xóa</button>
											<button type="submit" class="btn btn-primary mb-3 ml-2" style="width: 32%" name="btnExit">Hủy</button>
										</div>
									</c:if>
								</div>
							</div>
						</div>
					</form>
					<div class="">
						<div>
							<table id="tblDepart" class="table align-items-center">
								<thead class="thead-light">
									<tr>
										<th scope="col"><s:message code="tbl.depart.col.id"/></th>
										<th scope="col"><s:message code="tbl.depart.col.name"/></th>
										<th scope="col"><s:message code="tbl.depart.col.action"/></th>
									</tr>
								</thead>
								<tbody class="list">
									<c:forEach var="de" items="${departList}">
										<tr>
											<td>${de.id }</td>
											<td>${de.name }</td>
											<td><a href="${pageContext.request.contextPath}/depart/edit?editId=${de.id}" class="btn btn-warning"><s:message code="tbl.depart.col.edit"/></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<script>
				$(document).ready(function() {
					$(document).ready(function() {
						$('#tblDepart').DataTable({
							"language" : {
								"lengthMenu" : "Hiển thị _MENU_",
								"zeroRecords" : "Không tìm thấy kết quả",
								"info" : "Trang _PAGE_ trên _PAGES_",
								"infoEmpty" : "Không có dữ liệu",
								"infoFiltered" : "(đã tìm kiếm trên _MAX_ nhân viên)",
								"search" : "Tìm kiếm",
								"paginate" : {
									"previous" : "<",
									"next" : ">"
								}

							}
						});
					});
				});
				</script>
				
<script>
//Bat loi form
$(document).ready(function() {
	//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
	$("#formDepart").validate({
		rules : {
			id : "required",
			name : {
				required : true,
				minlength : 6
			}
		},
		messages : {
			id : "Mã phòng ban đang để trống",
			name : {
				required : "Tên phòng ban đang để trống",
				minlength : "Tên phòng ban quá ngắn"
			}
		}
	});
	
	// Bat su kien khi form submit
	$("#formDepart").submit(function() {
		let isSuccess = $("#formDepart").valid();
		if (isSuccess == false) {
			AlertHelper.showSimpleError("Lỗi nhập liệu", "Vui lòng kiểm tra lại form nhập liệu aa");
		}
	});
});



</script>