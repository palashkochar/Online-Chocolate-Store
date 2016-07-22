$(document).ready(function() {
	$("#makePayment").validate({
		onfocusout : false,
		errorElement : "div",
		errorPlacement : function(error, element) {
			error.appendTo("div#errors");
		},
		// Specify the validation rules
		rules : {
			name : "required",
			cardNumber : {
				required : true,
				minlength : 4,
				maxlength : 4,
				number:true
			},
			cvv : {
				required : true,
				minlength : 3,
				maxlength : 3,
				number:true
			}
		},
		// Specify the validation error messages
		messages : {
			name : "Please enter Name on card",
			cardNumber : "Please enter a valid Card Number",
			cvv : "Please enter a valid cvv"
		},
		submitHandler : function(form) {
			form.submit();
		}
	});
});
function moveFunction(that) {
	switch (that.id) {
	case 'cardNumber1':
		nextone = document.getElementById("cardNumber2");
		break;
	case 'cardNumber2':
		nextone = document.getElementById("cardNumber3");
		break;
	case 'cardNumber3':
		nextone = document.getElementById("cardNumber4");
		break;
	case 'cardNumber4':
		nextone = document.getElementById("cardNumber1");
		break;
	}
	
	if(that.value.length > 3)
	{
	nextone.focus();
	}
}