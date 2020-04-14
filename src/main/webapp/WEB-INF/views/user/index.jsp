<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!-- <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main"> -->
<!-- 	<div class="container-fluid"> -->
<!-- 		<!-- Brand --> 
<!-- 		<a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">MANAGER-STAFF</a> -->
<!-- 		<!-- Form --> 
<%-- 		<form class="navbar-search navbar-search-dark mt-4 form-inline mr-3 d-none d-md-flex ml-lg-auto" action="${pageContext.request.contextPath}/user/search"> --%>
<!-- 			<div class="form-group mb-0"> -->
<!-- 				<div class="input-group input-group-alternative"> -->
<!-- 					<div class="input-group-prepend"> -->
<!-- 						<span class="input-group-text"><i class="fas fa-search"></i></span> -->
<!-- 					</div> -->
<!-- 					<input class="form-control" placeholder="Nhập username...." name="search" type="text" data-toggle="tooltip" data-placement="bottom" title="" data-original-title="Nhập tài khoản cần tìm"> -->
<!-- 				</div> -->
<!-- 				<input type="submit" class="btn btn-success ml-3" name="" value="Search" /> -->
<!-- 			</div> -->
<!-- 		</form> -->
<!-- 		<!-- User --> 

<!-- 	</div> -->

<!-- </nav> -->
<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8"></div>
<div class="container-fluid mt--7">
	<div class="row">
		<div class="col">
			<div class="card shadow">
				<div class=" row card-header bg-transparent mb-0">
				<div class="col-6">
					<h3 class="card-title text-uppercase text-muted mb-0" style="font-weight: bold;"><s:message code="user.title"/></h3>
				</div>
				<div class="col-6">
					<button name="btnInsertUser"   class="btn btn-primary float-right w-50" data-insert="${staff.id}" data-toggle="modal" data-target="#modal-form">Thêm</button>
					</div>
					<div></div>
				</div>
				<div class="card-body">

					<div class="">
						<div>
							<table id="tblUser" class="table align-items-center">
								<thead class="thead-light">
									<tr>
										<th scope="col"><s:message code="tbl.user.col.username"/></th>
										<th scope="col"><s:message code="tbl.user.col.password"/></th>
										<th scope="col"><s:message code="tbl.user.col.fullname"/></th>
										<th scope="col"><s:message code="tbl.user.col.action"/></th>
										
									</tr>
								</thead>
								<tbody class="list">
									<c:forEach var="u" items="${users}">
										<tr>
											<td>${u.username}</td>
											<input type="hidden" value="${u.password}" />
											<td>###########</td>
											<td>${u.fullname}</td>
											<td>
										<button name="btnEditUser" class="btn btn-warning" 
										data-user="${u.username}" 
										data-pass="${u.password}" 
										data-name="${u.fullname}">
										<s:message code="tbl.user.col.edit"/></button>
										
														<%-- 	<c:if test="${param.editId != u.username}"> --%>
<%-- 													<a class="btn btn-primary" href="edit?editId=${u.username}">Edit</a> --%>
<%-- 												</c:if> <c:if test="${searchValue != null}"> --%>
<%-- 													<c:if test="${param.editId == u.username}"> --%>

<!-- 														<a onclick="geek()" class="btn btn-danger">Sửa</a> -->
<%-- 														<a class="btn btn-warning" href="delete?deleteId=${u.username}">Xóa</a> --%>
<%-- 													</c:if> --%>
<%-- 												</c:if>--%>
											</td> 
										</tr>		
									</c:forEach>
									
								</tbody>
							</table>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>
</div>


<div class="col-md-4">
	<div class="modal fade" id="modal-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
		<div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">

			<div class="modal-content">
				<div class="modal-body p-0">


					<div class="card bg-secondary shadow border-0 px-5" style="width: 550px">
						<div class="bg-transparent mb-3">
							<div class="text-center text-muted mt-3">
								<b id="titleModal" style="font-size: 30px"> Thêm tài khoản </b>

							</div>

						</div>
						<div class="card-body px-lg py-0">
							<form id="formUser" role="form" action="${pageContext.request.contextPath}/user/index" method="post" accept-charset="ISO-8859-1">
							
								<div class="form-group d-inline">
									<input class="form-control mt-4" id="findUser" name="username" placeholder="Tài khoản" type="text">
								</div>
								
								<div class="form-group">
									<input class="form-control mt-4" id="findPass" name="password" placeholder="Mật khẩu" type="password">
								</div>
								
								<div class="form-group">
									<input class="form-control mt-4" id="findName" name="fullname" placeholder="Họ tên" type="text">
								</div>

								<div class="text-center">
									<button type="submit" name="btnInsert" class="btn btn-primary mt-4 mb-4 w-40" style="width: 150px">Thêm</button>
									<button type="button" data-dismiss="modal"	 name="btnExit" class="btn btn-primary mt-4 mb-4" style="width: 150px">Hủy</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>

	$(document).ready(function() {
		$(document).ready(function() {
			$('#tblUser').DataTable({
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


$('[name="btnInsertUser"]').click(function() {
	
	//set giá trị lên form từ các biến tạo ở trên
	$('#formUser [name="username"]').val('').attr('readonly', false);
	$('#formUser [name="password"]').val('');
	$('#formUser [name="fullname"]').val('');
	
	$('#titleModal').html('Thêm tài khoản');
	
	$('#formUser [name="btnUpdate"]').html('Thêm');
	$('#formUser [name="btnUpdate"]').val('Thêm');
	$('#formUser [name="btnUpdate"]').attr('name','btnInsert');
	
	$('#formUser [name="btnDelete"]').html('Hủy');
	$('#formUser [name="btnDelete"]').val('Hủy');
	$('#formUser [name="btnDelete"]').attr('data-dismiss', 'modal');
	$('#formUser [name="btnDelete"]').attr('name', 'btnExit').attr('type', 'button');
});

$('[name="btnEditUser"]').click(function() {
	
	let username = $(this).attr('data-user');
	let password = $(this).attr('data-pass');
	let fullname = $(this).attr('data-name');
	
	//set giá trị lên form từ các biến tạo ở trên
	$('#formUser [name="username"]').val(username).attr('readonly', true);
	$('#formUser [name="password"]').val(password);
	$('#formUser [name="fullname"]').val(fullname);
	
	$('#titleModal').html('Cập nhật tài khoản');

	
	//thay đổi tên nút và nội dung của nút submit thành cập nhật
	$('#formUser [name="btnInsert"]').html('Cập nhật');
	$('#formUser [name="btnInsert"]').val('Cập nhật');
	$('#formUser [name="btnInsert"]').attr('name', 'btnUpdate');
	
	$('#formUser [name="btnExit"]').html('Xóa');
	$('#formUser [name="btnExit"]').val('Xóa');
	$('#formUser [name="btnExit"]').attr('name','btnDelete').attr('data-dismiss', null).attr('type', 'submit');
	
	
	//hiện modal lên lại 
	$('#modal-form').modal('show');
});


</script>

<script>
	//Bat loi form
	$(document).ready(function() {
		$("#formUser").validate({
			rules : {
				username : {
					required: true,
					minlength : 6
				},
				password : {
					required : true,
					minlength : 6
				},
				fullname : {
					required : true,
					minlength : 6
				}
			},
			messages : {
				username : {
					required : "Tài khoản đang để trống",
					minlength : "Tên tài nhập vào quá ngắn"
				},
				password : {
					required : "Mật khẩu đang bỏ trống",
					minlength : "Mật khẩu nhập vào quá ngắn"
				},
				fullname : {
					required : "Họ tên đang để trống",
					minlength : "Họ tên nhập vào quá ngắn"
				}
			}
		});
		
		// Bat su kien khi form submit
		$("#formUser").submit(function() {
			let isSuccess = $("#formUser").valid();
			if (isSuccess == false) {
				AlertHelper.showSimpleError("Lỗi nhập liệu", "Vui lòng kiểm tra lại form nhập liệu");
			}
		});
	});
	</script>