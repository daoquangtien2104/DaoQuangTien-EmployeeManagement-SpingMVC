<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<div class="col-md-4">
	<div class="modal fade" id="modal-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
		<div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">

			<div class="modal-content">
				<div class="modal-body p-0">


					<div class="card bg-secondary shadow border-0" style="width: 700px">
						<div class="bg-transparent mt-2">
							<div class="text-center text-muted mt-0">
								<b id="titleModal" style="font-size: 30px"> Thêm nhân viên </b>
								<hr class="my-3">
							</div>

						</div>
						<div class="card-body px-lg py">
							<form id="formStaff" role="form" action="${pageContext.request.contextPath}/staff/index" enctype="multipart/form-data" accept-charset="UTF-8" method="post" style="margin-left: 10px;">

								<div class="form-group text-center">
									<label for='staffPhoto'> <img id="imgAvatar" src="${pageContext.request.contextPath}/resources/img/user-default.png" class="rounded-circle" width="150px" height="150px" />
									</label>
								</div>
								
								<div class="row">
									<div class="form-group col">
										<label>Mã nhân viên</label>
										<input type="text" name="id" class="form-control">
									</div>
									<div class="form-group col">
										<label>Tên nhân viên</label> 
										<input type="text" name="name" class="form-control">
									</div>
								</div>
								
								<div class="row">
									<div class="form-group col">
										<label>Nhập email</label> 
										<input type="text" name="email" class="form-control">
									</div>
									<div class="form-group col">
										<label>Lương nhân viên</label> 
										<input type="text" name="salary" class="form-control">
									</div>
								</div>
								
								<div class="row">
									<div class="form-group col">
										<label>Hình ảnh</label> 
										<input type="file" accept=".JPG,.PNG,.JPGE" id="staffPhoto" name="photo" class="form-control">
									</div>
									<div class="form-group col">
										<label>Ngày sinh</label> 
										<input type="date" name="birthday" class="form-control">
									</div>
								</div>
								
								<div class="row">
									<div class="form-group col">
										<label>Giới tính: </label> <br>
										<div class="form-check form-check-inline">
										  <input type="radio" value="true" name="gender" class="form-check-input"  id="genderMale" >
										  <label class="form-check-label" for="genderMale">Nam</label>
										</div>
										<div class="form-check form-check-inline">
										  <input type="radio" value="false" name="gender" class="form-check-input" type="radio" id="genderMale" value="false" name="gender" >
										  <label class="form-check-label" for="genderMale">Nữ</label>
										</div>
									</div>
									<div class="form-group col">
										<label>Số điện thoại</label> 
										<input type="text" name="phone" class="form-control">
									</div>
								</div>
								
								<div class="row">
									<div class="form-group col">
										<label>Ghi chú</label> 
										<input type="text" name="notes" class="form-control">
									</div>
									<div class="form-group col">
										<label>Phòng ban</label> <br>
										<select class="custom-select w-100" id="selectDepart"
										class="form-control border-0 mt-0 ml-5" style="width: 45%" name="departId">
											<option value="">Không có</option>
											<c:forEach var="de" items="${departList}">
												<option value="${de.id}">${de.name}</option>
											</c:forEach>
										</select>
									</div>
								</div>
								<div class="text-center">
									<button type="submit" name="btnInsert" class="btn btn-primary mt-2">Thêm</button>
									<button type="submit" name="btnDelete" class="btn btn-primary mt-2">Xóa</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
	<div class="container-fluid">
		<!-- Brand -->
		<a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">Icons</a>
		<!-- Form -->
		<form class="navbar-search navbar-search-dark form-inline mt-3 mr-3 d-none d-md-flex ml-lg-auto" action="${pageContext.request.contextPath}/staff/search">
			<div class="form-group mb-0">
				<div class="input-group input-group-alternative">
					<div class="input-group-prepend">
						<span class="input-group-text"><i class="fas fa-search"></i></span>
					</div>
					<input class="form-control" placeholder="Nhập tên nhân viên.." type="text" name="search">
				</div>
				<input type="submit" class="btn btn-success ml-4" value="Search" />
			</div>
		</form>
		<!-- User -->

	</div>
</nav> --%>
<%-- <img src="${pageContext.request.contextPath}/resources/img/aaaaaaaaaaaaaaaaaa.jpg"/> --%>
<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8 "></div>
<div class="container-fluid mt--9">

	<div class="row">
		<div class="col">
			<div class="card shadow">
				<div class=" row card-header bg-transparent form-inline">
					<div class="col-6">
					<h3 class="card-title text-uppercase text-muted mb-0" style="font-weight: unicode-bidi:;"><s:message code="staff.title"/></h3>
					</div>
					<div class="col-6">
					
									<button name="btnInsertStaff" data-photo-default="${pageContext.request.contextPath}/resources/img/user-default.png" 
									class="btn btn-success float-right w-50" data-insert="${staff.depart}"
													data-toggle="modal" data-target="#modal-form">Thêm
													</button>
				
					</div>
				</div>
				<div class="card-body">

					<%-- 					<form method="POST" action="${pageContext.request.contextPath}/staff/index" enctype="multipart/form-data" accept-charset="ISO-8859-1"> --%>
					<!-- 						<div class="row"> -->
					<!-- 							<div class="col-sm-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									<input type="input" class="form-control" id="exampleFormControlInput1" name="id" placeholder="ID" value="${editValue.id}"> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									<input type="text" name="name" placeholder="NAME" class="form-control" value="${editValue.name}" /> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 						<div class="row"> -->
					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									Nam : <input type="radio" class="mr-7" value="true" ${editValue.gender ? 'checked':'true' } name="gender"> Nữ : <input type="radio" value="false" --%>
					<%-- 										${editValue.gender ? 'false':'checked'} name="gender"> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->

					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									<input type="date" placeholder="Birthday" class="form-control" name="birthday" value="${editValue.birthday}" /> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 						</div> -->
					<!-- 						<div class="row"> -->
					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									<input type="file" class="form-control" id="exampleFormControlInput1" name="photo" placeholder="PHOTO" value="${editValue.photo }" /> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									<input type="email" placeholder="EMAIL" class="form-control" name="email" value="${editValue.email}" /> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 						</div> -->

					<!-- 						<div class="row"> -->
					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									<input type="input" class="form-control" id="exampleFormControlInput1" name="phone" placeholder="PHONE" value="${editValue.phone }" /> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									<input type="text" class="form-control" id="exampleFormControlInput1" name="salary" placeholder="SALARY" value="${editValue.salary }" /> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->

					<!-- 						</div> -->

					<!-- 						<div class="row p-inline"> -->
					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 									<input type="text" class="form-control" id="exampleFormControlInput1" name="notes" placeholder="NOTES" value="${editValue.notes}" /> --%>
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 							<div class="col-md-6"> -->
					<!-- 								<div class="form-group"> -->
					<%-- 																		<input type="select" class="form-control" id="exampleFormControlInput1" name="departId" placeholder="DEPARTID" value="${editValue.depart.id}"/> --%>
					<!-- 									<select class="form-control" name="departId"> -->
					<%-- 										<c:forEach var="de" items="${departList}"> --%>
					<%-- 											<option value="${de.id}" ${editValue.depart.id == de.id ? 'selected' : ''}>${de.name}</option> --%>
					<%-- 										</c:forEach> --%>
					<!-- 									</select> -->
					<!-- 								</div> -->
					<!-- 							</div> -->
					<!-- 						</div> -->

					<%-- 						<c:if test="${editValue != null}"> --%>
					<!-- 							<div class="row d-inline"> -->
					<!-- 								<button type="submit" name="btnUpdate" class="btn btn-primary w-50  mb-3">Sửa</button> -->
					<!-- 								<button type="submit" class="btn btn-primary w-50  mb-3" name="btnDelete">Xóa</button> -->
					<!-- 							</div> -->
					<%-- 						</c:if> --%>
					<%-- 						<c:if test="${editValue == null }"> --%>
					<!-- 							<button type="submit" class="btn btn-primary btn-lg btn-block mb-3" name="btnInsert">Thêm mới</button> -->
					<%-- 						</c:if> --%>

					<!-- 					</form> -->
					<div class="">
						<div>
							<table id="tblStaff" class="table align-items-center">
								<thead class="thead-light">
									<tr>
										<th scope="col"><s:message code="tbl.staff.col.id"/></th>
										<th scope="col"><s:message code="tbl.staff.col.name"/></th>
										<th scope="col"><s:message code="tbl.staff.col.gender"/></th>
										<th scope="col"><s:message code="tbl.staff.col.birthday"/></th>
										<th scope="col"><s:message code="tbl.staff.col.photo"/></th>
										<th scope="col"><s:message code="tbl.staff.col.salary"/></th>
										<th scope="col"><s:message code="tbl.staff.col.departid"/></th>
										<th scope="col"><s:message code="tbl.staff.col.action"/></th>
									</tr>
								</thead>
								<tbody class="list">
									<c:forEach var="s" items="${staffs}">
										<tr>
											<td><b class="text-danger">${s.id}</b></td>
											<td><b>${s.name}</b></td>
											<td>${s.gender?'Nam':'Nữ'}</td>
											<td><fmt:formatDate value="${s.birthday}" type="date" pattern="yyyy-MM-dd" /></td>
											<td><img src="${pageContext.request.contextPath}/resources/img/${s.photo}" width="64px" height="64px" /></td>
											<td><fmt:formatNumber type="number" groupingUsed="true" value="${s.salary}" />đ</td>
											<td><b ${s.depart == null ? 'class="text-danger"' : ''}>${s.depart != null ? s.depart.name : 'Không có'}</b></td>
											<td>
												
												<button name="btnEditStaff" class="btn btn-success" data-id="${s.id}" data-name="${s.name}" data-gender="${s.gender}" data-birthday="${s.birthday}"
													data-photo="${pageContext.request.contextPath}/resources/img/${s.photo}" data-salary="${s.salary}" data-phone="${s.phone}" data-departid="${s.depart.id}" data-email="${s.email}"
													data-notes="${s.notes}">Sửa</button>
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



<script>
	$(function() {
		$("#staffPhoto").change(function() {
			readURL(this);
		});
	});
	
	// Bat loi form
	$(document).ready(function() {
		//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
		$("#formStaff").validate({
			errorPlacement: function(error, element) {
		        if (element.attr('name') == "gender")
		       	{
		        	error.insertAfter(element.parent());	 
		       	}
		        else
		        	error.insertAfter(element);
		    },
			rules : {
				id : "required",
				name : {
					required : true,
					minlength : 10
				},
				gender: {
					required : true
				},
				email : {
					required : true,
					email : true
				},
				salary : {
					required : true,
					number : true,
					min : 0
				},
				birthday : {
					required : true,
				},
				phone : {
					required : true,
					digits : true,
					rangelength : [9, 13]
				}

			},
			messages : {
				id : "Mã nhân viên đang để trống",
				name : {
					required : "Họ tên đang để trống",
					minlength : "Tên nhập vào quá ngắn"
				},
				email : {
					required : "Email đang để trống",
					email : "Email nhập vào không hợp lệ"
				},
				gender: {
					required : "Giới tính chưa được chọn"
				},
				salary : {
					required : "Lương nhân viên đang để trống",
					number : "Lương nhập vào phải là số",
					min : "Lương nhập vào kphải lớn hơn 0"
				},
				birthday : {
					required : "Ngày sinh chưa được chọn",
				},
				phone : {
					required : "Chưa nhập số điện thoại",
					number : "Số điện thoại nhập vào phải là số",
					rangelength : "Độ dài số điện thoại không hợp lệ"
				}
			}
		});
		
		
		// Bat su kien khi form submit
		$("#formStaff").submit(function() {
			let isSuccess = $("#formStaff").valid();
			if (isSuccess == false) {
				AlertHelper.showSimpleError("Lỗi nhập liệu", "Vui lòng kiểm tra lại form nhập liệu");
			}
		});
	});

	
	$('[name="btnInsertStaff"]').click(
			function() {
				let photo = $(this).attr('data-photo-default');

				$('#imgAvatar').attr('src', photo);

				$('#formStaff [name="id"]').val('');
				$('#formStaff [name="name"]').val('');
				$('#formStaff [name="gender"]').attr('checked', false);
				$('#formStaff [name="photo"]').attr('src', '');
				$('#formStaff [name="email"]').val('');
				$('#formStaff [name="salary"]').val('');
				$('#formStaff [name="notes"]').val('');

				$('#formStaff [name="birthday"]').val('');
				$('#formStaff [name="phone"]').val('');

				$('#formStaff [name="btnUpdate"]').html('Thêm');
				$('#formStaff [name="btnUpdate"]').val('Thêm');
				$('#formStaff [name="btnUpdate"]').attr('name', 'btnInsert');

				$('#formStaff [name="btnDelete"]').html('Hủy');
				$('#formStaff [name="btnDelete"]').val('Hủy');
				$('#formStaff [name="btnDelete"]')
						.attr('data-dismiss', 'modal');
				$('#formStaff [name="btnDelete"]').attr('name', 'btnExit')
						.attr('type', 'button');
			});

	$('[name="btnEditStaff"]').click(
			function() {
				//Tạo biến chứa các giá trị trong nút Edit dc tạo bởi các data-... ở trên table
				let id = $(this).attr('data-id');
				let name = $(this).attr('data-name');
				let gender = $(this).attr('data-gender');
				let photo = $(this).attr('data-photo');
				let email = $(this).attr('data-email');
				let salary = $(this).attr('data-salary');
				let notes = $(this).attr('data-notes');
				let departid = $(this).attr('data-departid');
				let birthday = $(this).attr('data-birthday');
				let phone = $(this).attr('data-phone');

				$('#imgAvatar').attr('src', photo);

				//Gán giá trị của các let lên trên form
				$('#formStaff [name="id"]').val(id);
				$('#formStaff [name="name"]').val(name);
				$('#formStaff [name="gender"]').attr('checked', false);
				$('#formStaff [name="gender"][value="' + gender + '"]').attr(
						'checked', true);

				$('#formStaff [name="photo"]').attr('src', photo);
				$('#formStaff [name="email"]').val(email);
				$('#formStaff [name="salary"]').val(salary);
				$('#formStaff [name="notes"]').val(notes);
				$('#formStaff [name="departId"]').val((departid == "" ? "" : departid));
				$('#formStaff [name="birthday"]').val(birthday);
				$('#formStaff [name="phone"]').val(phone);

				$('#formStaff [name="btnInsert"]').html('Sửa');
				$('#formStaff [name="btnInsert"]').val('Sửa');
				$('#formStaff [name="btnInsert"]').attr('name', 'btnUpdate');

				$('#formStaff [name="btnExit"]').html('Xóa');
				$('#formStaff [name="btnExit"]').val('Xóa');
				$('#formStaff [name="btnExit"]').attr('name', 'btnDelete')
						.attr('type', 'submit').attr('data-dismiss', null);
				;

				//Hiện modal lên lại
				$('#modal-form').modal('show');
			});
	$(document).ready(function() {
		$(document).ready(function() {
			$('#tblStaff').DataTable({
				"language" : {
					"lengthMenu" : "Hiển thị _MENU_",
					"zeroRecords" : "Không tìm thấy kết quả",
					"info" : "Trang _PAGE_ trên _PAGES_",
					"infoEmpty" : "Không có dữ liệu",
					"infoFiltered" : "(đã tìm kiếm trên _MAX_ vật phẩm)",
					"search" : "Tìm kiếm",
					"paginate" : {
						"previous" : "<",
						"next" : ">"
					}

				}
			});
		});
	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#imgAvatar').attr('src', e.target.result);
			};

			reader.readAsDataURL(input.files[0]);
		}
	}
</script>




