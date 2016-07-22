/**
 * 
 */
function ajaxFunction() {
	var xmlhttp;
	var username = document.getElementById("username").value;
	// document.getElementById("match").innerHTML = oldPass;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
		// for IE7+, Firefox, Chrome, Opera,
		// Safari
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		// for IE6, IE5
	}

	xmlhttp.open("POST", "checkforusername.do", true);
	xmlhttp.setRequestHeader("username", username);

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			/* document.getElementById("signup").disabled = true; */
			if (xmlhttp.status == 200) {
				if (xmlhttp.responseText == "false") {
					document.getElementById("match").innerHTML = "User name available";
					document.getElementById("signup").disabled = false;
				} else {
					document.getElementById("signup").disabled = true;
					document.getElementById("match").innerHTML = "Username already exists.";
				}
				// document.getElementById("match").innerHTML =
				// xmlhttp.responseText;
				// alert(xmlhttp.responseText);
			} else {
				alert('Something is wrong !!');
			}
		}
	}
	xmlhttp.send(null);
}

$(document).ready(function() {
	$("#addComp").click(function() {
		$("#addCompany").slideToggle("medium");
	});

	$("#addCat").click(function() {
		$("#addCategory").slideToggle("medium");
	});

	$("#regCompany").validate({

		onfocusout : false,
		errorElement : "div",
		errorPlacement : function(error, element) {

			error.appendTo("div#errors1");

		},
		// Specify the validation rules
		rules : {
			companyName : "required",
			username : "required",
			password : "required"

		},

		// Specify the validation error messages
		messages : {
			companyName : "Please enter Company name",
			username : "Please enter username",
			password : "Please enter password"

		},

		submitHandler : function(form) {
			form.submit();
		}
	});

	$("#regCategory").validate({

		onfocusout : false,
		errorElement : "div",
		errorPlacement : function(error, element) {

			error.appendTo("div#errors2");
		},
		// Specify the validation rules
		rules : {
			categoryName : "required",

		},

		// Specify the validation error messages
		messages : {
			categoryName : "Please enter Category name",
		},

		submitHandler : function(form) {
			form.submit();
		}
	});

});
