/**
 * 
 */
function ajaxFunction() {

	var xmlhttp;
	var productId = document.getElementById("productId").value;
	var quantity = document.getElementById("quantity").value;
	if (quantity == "") {
		document.getElementById("submit").disabled = true;
		return;
	}

	// document.getElementById("match").innerHTML = oldPass;
	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest(); // for IE7+, Firefox, Chrome, Opera,
		// Safari
	} else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP"); // for IE6, IE5
	}

	xmlhttp.open("POST", "checkforquantity.do", true);
	xmlhttp.setRequestHeader("productId", productId);
	xmlhttp.setRequestHeader("quantity", quantity);

	xmlhttp.onreadystatechange = function() {
		if (xmlhttp.readyState == 4) {
			if (xmlhttp.status == 200) {
				if (xmlhttp.responseText == "false") {
					document.getElementById("match").innerHTML = "Quantity not available";
					document.getElementById("submit").disabled = true;
				} else {
					document.getElementById("match").innerHTML = "Quantity available";
					document.getElementById("submit").disabled = false;
				}
			} else {
				alert('Something is wrong !!');
				document.getElementById("submit").disabled = true;
			}
		}
	}
	xmlhttp.send(null);
}