<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link
	href='http://fonts.googleapis.com/css?family=Cuprum:700italic,400,400italic,700&subset=latin,latin-ext,cyrillic'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="resources/js/productdisplay.js"></script>
<link rel="stylesheet" href="resources/css/productdisplay.css" />
<!-- <link
	href='http://fonts.googleapis.com/css?family=Josefin+Slab:400,600,700,400italic,600italic,700italic&effect=shadow-multiple|crackle'
	rel='stylesheet' type='text/css'> -->

<title>Change Password</title>
<script type="text/javascript">
	function changePwd() {

		var xmlhttpObj;
		var oldPwd = document.getElementById("oldpwd").value;

		if (window.XMLHttpRequest) {
			xmlhttpObj = new XMLHttpRequest(); //for IE, Firefox, Chrome, Opera, Safari
		} else {
			xmlhttpObj = new ActiveXObject("Microsoft.XMLHTTP"); //for IE6, IE5
		}

		xmlhttpObj.open("POST", "checkPassword.do", true);
		xmlhttpObj.setRequestHeader("oldPassword", oldPwd);

		xmlhttpObj.onreadystatechange = function() {
			if (xmlhttpObj.readyState == 4) {
				if (xmlhttpObj.status == 200) {
					if (xmlhttpObj.responseText == "true") {
						document.getElementById("match").innerHTML = "correct password";
						document.getElementById("newpwd").disabled = false;
						document.getElementById("renewpwd").disabled = false;
						document.getElementById("change").disabled = false;
					} else {
						document.getElementById("match").innerHTML = "Incorrect password";
						document.getElementById("newpwd").disabled = true;
						document.getElementById("renewpwd").disabled = true;
						document.getElementById("change").disabled = true;
					}
				} else {
					alert("XMLHTTP status is not 200");
				}
			}
		}
		xmlhttpObj.send(null);
	}

	function checkPassword() {
		var newPassword = document.forms["changepass"]["newpwd"].value;
		var confirmPassword = document.forms["changepass"]["renewpwd"].value;
		alert('call');
		if (confirmPassword == null || confirmPassword == ""
				|| newPassword != confirmpassword) {
			document.getElementById('passmatch').innerHTML = "Password and Confirm Password Didn't match!";
			return false;
		} else {
			document.getElementById('passmatch').innerHTML = "";
			return true;
		}
	}
</script>
</head>
<body>
	<!-- Fixed navbar -->
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid headcolor">
		<div class="row">
			<div class="navbar-header size col-md-2 col-lg-offset-1">
				<a href="gohome.do"><img src="resources/images/companylogo.jpg"
					width=100% height=100% /></a>
			</div>
			<div class="col-md-5 col-md-offset-1">
				<div class="row marginsearch"></div>
			</div>
			<!-- <div class="row text-right"> -->
			<div class="col-md-3">
				<div class="row">
					<form method="POST" action="logout.go" class="" role="form">
						<div class="col-lg-5 marginLogout">
							<div class="form-group">
								<div class="input-group input-group-lg pull-right">
									<input type="submit" name="logout" value="Logout"
										class="btn btn-sm btn-warning" />
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="row margintopmd">
					<form action="viewcart.do" method="post">
						<div class="col-lg-5">
							<div class="form-group">
								<div class="input-group input-group-lg pull-right">
									<input type="submit" class="btn btn-sm btn-warning"
										value="View Cart" />
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<div class="container-fluid margincontainer">
		<h3 class="row col-lg-offset-2">Make Payment</h3>
		<div class="row backwall">
			<div class="col-lg-4 col-lg-offset-4  margintop">
				<form action="changePassword.do" method="post" name="changepass">
					<div class="form-group">
						<label class="row control-label" for="name">Enter old
							password</label>
						<div class="">
							<input id="oldpwd" name="oldpwd" class="form-control input-md"
								type="text" onkeyup="changePwd()">
						</div>
						<div id="match"></div>
					</div>
					<div class="form-group">
						<label class="row control-label" for="name">Enter NEW
							password</label>
						<div class="">
							<input id="newpwd" name="newpwd" class="form-control input-md"
								type="text" disabled>
						</div>
						<div id="textIfMatch"></div>
					</div>
					<div class="form-group">
						<label class="row control-label" for="name">Confirm New
							Password</label>
						<div class="">
							<input id="renewpwd" name="renewpwd"
								class="form-control input-md" type="text" disabled>
						</div>
						<div id="passmatch"></div>
					</div>
					<div class="form-group">
						<div class="">
							<input type="submit" class="btn btn-primary" id="change"
								name="change" value="Change Password" disabled
								onclick="checkPassword()" />
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>