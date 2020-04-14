var AlertHelper = {
	showSimpleSuccess : function(title, msg) {
		Swal.fire({
			type : 'success',
			title : title,
			html : msg,
			showConfirmButton : false,
			timer : 3000
		})
	},
	showSimpleError : function(title, msg) {
		Swal.fire({
			type : 'error',
			title : title,
			html : msg,
			showConfirmButton : false,
			timer : 4000
		})
	}
}
