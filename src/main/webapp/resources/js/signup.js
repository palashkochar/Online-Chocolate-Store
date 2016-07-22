function firstNameVal() {

	var firstName = document.forms["signupform"]["firstName"].value;
	if (firstName == null || firstName == "") {
		document.getElementById('errorFirstName').innerHTML = "First name is mandatory";
	} else {
		document.getElementById('errorFirstName').innerHTML = "";
	}
}

function lastNameVal() {
	var lastName = document.forms["signupform"]["lastName"].value;
	if (lastName == null || lastName == "") {
		document.getElementById('errorLastName').innerHTML = "Last name is mandatory";
	} else {
		document.getElementById('errorLastName').innerHTML = "";
	}
}

function addressVal() {
	var address = document.forms["signupform"]["address"].value;
	if (address == null || address == "") {
		document.getElementById('errorAddress').innerHTML = "Address is mandatory";
	} else {
		document.getElementById('errorAddress').innerHTML = "";
	}
}

function dobVal() {
	var dateOfBirth = document.forms["signupform"]["dob"].value;
	if (dateOfBirth == null || dateOfBirth == "") {
		document.getElementById('errordob').innerHTML = "Date Of Birth is mandatory";
	} else {
		document.getElementById('errordob').innerHTML = "";
	}
}

function emailVal() {
	var email = document.forms["signupform"]["email"].value;
	var emailpat = /^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/g;
	if (email == null || email == "") {
		document.getElementById('errorEmail').innerHTML = "Email is mandatory";
	} else if (!(email.match(emailpat))) {
		document.getElementById('errorEmail').innerHTML = "Email is invalid";
	} else {
		document.getElementById('errorEmail').innerHTML = "";
	}
}

function phoneNoVal() {
	var phoneNo = document.forms["signupform"]["phoneNo"].value;
	var regexPhone = /^\d{10}$/g;
	if (phoneNo == null || phoneNo == "") {
		document.getElementById('errorPhoneNo').innerHTML = "Phone Number is mandatory";
	} else if (isNaN(phoneNo) || phoneNo < 0 || !(phoneNo.match(regexPhone))) {
		document.getElementById('errorPhoneNo').innerHTML = "Enter valid digits of Phone Number";

	} else {
		document.getElementById('errorPhoneNo').innerHTML = "";
	}

}

function usernameVal() {
	var username = document.forms["signupform"]["username"].value;
	if (username == null || username == "") {
		document.getElementById('errorUsername').innerHTML = "Username is mandatory";
	} else {
		ajaxFunction();
		document.getElementById('errorUsername').innerHTML = "";
	}
}

function passwordVal() {
	var password = document.forms["signupform"]["password"].value;
	if (password == null || password == "") {
		document.getElementById('errorPassword').innerHTML = "Password is mandatory";
	} else {
		document.getElementById('errorPassword').innerHTML = "";
	}
}

function confirmPasswordVal() {
	var confirmpassword = document.forms["signupform"]["confirmPassword"].value;
	if (confirmpassword == null || confirmpassword == "") {
		document.getElementById('errorConfirmPassword').innerHTML = "Confirm Password is mandatory";
	} else {
		document.getElementById('errorConfirmPassword').innerHTML = "";
	}
}

function matchOrConfirm() {
	var password = document.forms["signupform"]["password"].value;
	var confirmpassword = document.forms["signupform"]["confirmPassword"].value;
	if (confirmpassword == null || confirmpassword == "") {
		document.getElementById('errorConfirmPassword').innerHTML = "Confirm Password is mandatory";
	} else if (password != confirmpassword) {
		document.getElementById('errorConfirmPassword').innerHTML = "Password and Confirm Password Didn't match!";
	} else {
		document.getElementById('errorConfirmPassword').innerHTML = "";
	}
}

function submitVal() {
	var firstName = document.forms["signupform"]["firstName"].value;
	var lastName = document.forms["signupform"]["lastName"].value;
	var address = document.forms["signupform"]["address"].value;
	var dateOfBirth = document.forms["signupform"]["dob"].value;
	var email = document.forms["signupform"]["email"].value;
	var phoneNo = document.forms["signupform"]["phoneNo"].value;
	var username = document.forms["signupform"]["username"].value;
	var password = document.forms["signupform"]["password"].value;
	var confirmpassword = document.forms["signupform"]["confirmPassword"].value;
	var regexPhone = /^\d{10}$/g;

	if (firstName == null || firstName == "" || lastName == null
			|| lastName == "" || address == null || address == ""
			|| dateOfBirth == null || dateOfBirth == "" || phoneNo == null
			|| phoneNo == "" || !(phoneNo.match(regexPhone))
			|| username == null || username == "" || password == null
			|| password == "" || confirmpassword == null
			|| confirmpassword == "" || password != confirmpassword) {
		document.getElementById('lastmsg').innerHTML = "One or more fields are empty!";
		return false;
	} else {
		return true;
	}
}

function repeat() {
	var price = document.forms["signupform"]["password"].value;
	var patt1 = /^\d+(\.\d{0,2})?$/g;
	if (price.trim() == null || price.trim() == "") {
		return "true";
	} else if (!price.match(patt1)) {
		return "didntmatch";
	} else {
		return "false";
	}
}

function validatePrice() {
	var returnVal = repeat();
	if (repeat() == "true") {
		document.getElementById('errorPassword').innerHTML = "Price is mandatory";
	} else if (repeat() == "didntmatch") {
		document.getElementById('errorPassword').innerHTML = "N/A";
	} else {
		document.getElementById('errorPassword').innerHTML = "";
	}
}

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
