<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%-- <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
	<div class="container-fluid">
		<!-- Brand -->
		<a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="../index.html">MANAGER-STAFF</a>
		<!-- Form -->
		<form class="navbar-search navbar-search-dark form-inline mt-3 mr-3 d-none d-md-flex ml-lg-auto" action="${pageContext.request.contextPath}/staff/search">
			<!-- 			<div class="form-group mb-4"> -->
			<!-- 				<div class="input-group input-group-alternative"> -->
			<!-- 					<div class="input-group-prepend"> -->
			<!-- 						<span class="input-group-text"><i class="fas fa-search"></i></span> -->
			<!-- 					</div> -->
			<!-- 					<input class="form-control" placeholder="Phòng ban,Nhân viên,..." type="text" name="search"> -->
			<!-- 				</div> -->
			<!-- 				<input type="submit" class="btn btn-success ml-4" value="Search" /> -->
			<!-- 			</div> -->
		</form>
		<!-- User -->

	</div>
</nav> --%>
<%-- <img src="${pageContext.request.contextPath}/resources/img/aaaaaaaaaaaaaaaaaa.jpg"/> --%>
<div class="header bg-gradient-primary pb-8 pt-5 pt-md-8 "></div>
<div class="container-fluid mt--9 pb-5">

	<div class="row">
		<div class="col">
			<div class="card shadow">
				<div class="card-header bg-transparent d-flex justify-content-between">
					<h3 class="card-title text-uppercase text-muted mb-0" style="font-weight: unicode-bidi:;"><s:message code="record.title"/></h3>
					<div><button name="btnInsertRecord" class="btn btn-success float-right w-100" data-insert="${staff.id}" data-toggle="modal" data-target="#modal-form">
							<i class="fas fa-plus mr-1"></i>Thêm mới</button></div>
				</div>
				<div class="card-body">

					<form>
						<div class="row"></div>
					</form>
					<div class="">
						<div>
							<table class="table align-items-center" id="tblrecordDepart">
								<thead class="thead-light">
									<tr>
										<th scope="col"><s:message code="tbl.record.col.id"/></th>
										<th scope="col"><s:message code="tbl.record.col.name"/></th>
										<th scope="col"><s:message code="tbl.record.col.punish"/></th>
										<th scope="col"><s:message code="tbl.record.col.reward"/></th>
										<th scope="col"><s:message code="tbl.record.col.total"/></th>
										<th scope="col"><s:message code="tbl.record.col.action"/></th>
									</tr>
								</thead>
								<tbody class="list">
									<c:forEach var="r" items="${recordStaff}">
										<tr>
											<td><b class="text-danger">${r[0]}</b></td>
											<td><b>${r[1]}</b></td>
											<td>${r[2]}</td>
											<td>${r[3]}</td>
											<td>${r[3]-r[2]}</td>
											<td><a href="chitiet?departId=${r[0]}" class="btn btn-info"><s:message code="tbl.record.col.detail"/></a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</div>
				<c:if test="${detailStaffs != null}" var="de">
					<div class="alert alert-primary mt-4" role="alert">
					<div class="row">
						<div class="col-8">
							<div style="font-size: 25px">Thống kê nhân viên của phòng <b>${lblDepartDetail.name}</b></div></div>
							
						</div>
					</div>
					<div class="table mt-3">
						<div>
							<table class="table align-items-center" id="staffRecord">
								<thead class="thead-light">
									<tr>
										<th scope="col">ID</th>
										<th scope="col">Name</th>
										<th scope="col">Gender</th>
										<th scope="col">Photo</th>
										<th scope="col">Email</th>
										<th scope="col">DepartID</th>
										<th scope="col" class="text-center">Thao tác</th>
									</tr>
								</thead>
								<tbody class="list">
									<c:forEach var="staff" items="${detailStaffs}">
										<tr>
											<td><b class="text-danger">${staff.id}</b></td>
											<td><b>${staff.name}</b></td>
											<td>${staff.gender?'Nam':'Nữ'}</td>
											<td>${staff.email}</td>
											<td>${staff.phone}</td>
											<td>${staff.depart.id}</td>
											<td><a class="btn btn-info" href="detailStaff?staffId=${staff.id}&departId=${staff.depart.id}">Chi tiết</a>
											</td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
					</div>
				</c:if>
				<c:if test="${listRecord != null}" var="de">
					<div class="alert alert-primary mt-3" role="alert">
						<div style="font-size: 25px">
							Thống kê thưởng phạt <b>${lblStaffDetail.name}</b>
						</div>
						
					</div>
					<div class="table mt-3">
						<div>
							<table class="table align-items-center" id="tblRecord">
								<thead class="thead-light">
									<tr>
										<th scope="col">ID</th>
										<th scope="col">Thưởng/Phạt</th>
										<th scope="col">Đánh giá</th>
										<th scope="col">Ngày đánh giá</th>
										<th scope="col">Mã nhân viên</th>
										<th scope="col">Thao tác</th>
									</tr>
								</thead>
								<tbody class="list">
									<c:forEach var="re" items="${listRecord}">
										<tr>
											<td><b class="text-danger">${re.id}</b></td>
											<td class="${re.type?'record-good':'record-bad'}">${re.type?'Thưởng':'Phạt'}</td>
											<td>${re.reason}</td>
											<td>${re.date}</td>
											<td>${re.staff.name}</td>
											<td>
												<button name="btnEdit" class="btn btn-danger" 
												data-id="${re.id}" data-staffId="${re.staff.id}" 
												data-type="${re.type}" data-reason="${re.reason}">
												Thay đổi</button>
											</td>

										</tr>
									</c:forEach>

								</tbody>
							</table>
							<c:if test="${mailSucces != null}">
								<div class="alert alert-primary" role="alert">${mailSucces}</div>
							</c:if>
							
						</div>
					</div>
				</c:if>
			</div>
			<div class="col-md-4">
				<div class="modal fade" id="modal-form" tabindex="-1" role="dialog" aria-labelledby="modal-form" aria-hidden="true">
					<div class="modal-dialog modal- modal-dialog-centered modal-sm" role="document">

						<div class="modal-content">
							<div class="modal-body p-0">


								<div class="card bg-secondary shadow border-0" style="width: 450px">
									<div class="bg-transparent mb-3">
										<div class="text-center text-muted mt-3">
											<b id="titleModal" style="font-size: 30px"> Thêm đánh giá </b>
										</div>
									</div>
									<div class="card-body px-lg py">
										<form id="formRecord" role="form" action="${pageContext.request.contextPath}/record/index" method="post">
											<input type="hidden" name="id" />
											<div cssclass="form-group mb-3">
												<select id="selectStaff" class="browser-default custom-select" name="staffId">
													<c:forEach items="${listStaff}" var="t">
														<option value="${t.id}">${t.name}</option>
													</c:forEach>
												</select>
											</div>

											<div class="form-group mt-4">
												<div class="input-group-prepend" style="display: table-row-group;">
													Thưởng <input class="mr-5 ml-2" id="" value="true" name="type" type="radio"  /> 
													Kỉ luật <input id="" class="ml-2" value="false" name="type" type="radio" />
												</div>
											</div>
											<div class="form-group">


												<input class="form-control mt-4" id="selectReason" name="reason" placeholder="Đánh giá" type="text">

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
		</div>
	</div>
</div>

<script>
//Bat loi form
$(document).ready(function() {
	//Khi bàn phím được nhấn và thả ra thì sẽ chạy phương thức này
	$("#formRecord").validate({
		errorPlacement: function(error, element) {
	        if (element.attr('name') == "type")
	       	{
	        	error.insertAfter(element.parent());	 
	       	}
	        else
	        	error.insertAfter(element);
	    },
		rules : {
			type : "required",
			reason : {
				required : true,
				minlength : 10
			},
		},
		messages : {
			type : "Chưa chọn loại ghi nhận",
			reason : {
				required : "Lý do ghi nhận chưa được nhập",
				minlength : "Lý do ghi nhận quá ngắn"
			},
		}
	});
	
	
	// Bat su kien khi form submit
	$("#formRecord").submit(function() {
		let isSuccess = $("#formRecord").valid();
		if (isSuccess == false) {
			AlertHelper.showSimpleError("Lỗi nhập liệu", "Vui lòng kiểm tra lại form nhập liệu");
		}
	});
});

	$('[name="btnInsertRecord"]').click(
			function() {
				let staffId = $(this).attr('data-insert');
				$('#selectStaff').val(staffId);

				//set title lại thành thêm đánh giá
				$('#titleModal').html('Thêm mới đánh giá');

				//set giá trị lên form từ các biến tạo ở trên
				$('#formRecord [name="id"]').val('');
				$('#formRecord [name="type"]').attr('checked', true);
				$('#formRecord [name="reason"]').val('');

				$('#formRecord [name="btnUpdate"]').html('Thêm');
				$('#formRecord [name="btnUpdate"]').val('Thêm');
				$('#formRecord [name="btnUpdate"]').attr('name', 'btnInsert');

				$('#formRecord [name="btnDelete"]').html('Hủy');
				$('#formRecord [name="btnDelete"]').val('Hủy');
				$('#formRecord [name="btnDelete"]').attr('data-dismiss',
						'modal');
				$('#formRecord [name="btnDelete"]').attr('name', 'btnExit')
						.attr('type', 'button');
			});

	$('[name="btnEdit"]').click(
			function() {
				// gán giá trị cho các biến của đối tượng trong form
				let id = $(this).attr('data-id');
				let staffId = $(this).attr('data-staffId');
				let type = $(this).attr('data-type');
				let reason = $(this).attr('data-reason');
				
				console.log(type);

				$('#titleModal').html('Cập nhật đánh giá');
				//set giá trị lên form từ các biến tạo ở trên
				$('#formRecord [name="id"]').val(id);
				$('#formRecord [name="staffId"]').val(staffId);

				$('#formRecord [name="type"]').attr('checked',false);
				$('#formRecord [name="type"][value="'+type+'"]').attr('checked',true);

				$('#formRecord [name="reason"]').val(reason);

				//thay đổi tên nút và nội dung của nút submit thành cập nhật
				$('#formRecord [name="btnInsert"]').html('Cập nhật');
				$('#formRecord [name="btnInsert"]').val('Cập nhật');
				$('#formRecord [name="btnInsert"]').attr('name', 'btnUpdate');

				$('#formRecord [name="btnExit"]').html('Xóa');
				$('#formRecord [name="btnExit"]').val('Xóa');
				$('#formRecord [name="btnExit"]').attr('data-dismiss', null);
				$('#formRecord [name="btnExit"]').attr('type', 'submit').attr('name', 'btnDelete');

				//hiện modal lên lại 
				$('#modal-form').modal('show');
			});
	
	
	$(document).ready(function() {
		$(document).ready(function() {
			$('#tblrecordDepart').DataTable({
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
	
	$(document).ready(function() {
		$(document).ready(function() {
			$('#staffRecord').DataTable({
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
	
	$(document).ready(function() {
		$(document).ready(function() {
			$('#tblRecord').DataTable({
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



