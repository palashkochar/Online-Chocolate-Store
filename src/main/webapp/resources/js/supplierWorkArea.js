
function uploadFunction() {
    var x = document.getElementById("filebutton").value;
    
    if(x=="")
    	{
    	alert("Invalid upload. Please try again");
    	return;
    	}
/*     document.getElementById("putImage").innerHTML = x;
    document.getElementById("putSample").innerHTML = y;
 */    
    $('#imgname').val(x);
    document.getElementById("singlebutton").disabled=false;
}

function validateChocolateName() {

	var paintingName = document.forms["addChocolate"]["chocolateName"].value;

	if (paintingName.trim() == null || paintingName.trim() == "") {
		document.getElementById('chocolateNameError').innerHTML = "Chocolate name is mandatory";
	} else {
		document.getElementById('chocolateNameError').innerHTML = "";
	}
}

function validatePrice() {
	var price = document.forms["addChocolate"]["price"].value;
	var patt1 = /^\d+(\.\d{0,2})?$/g;
	if (price.trim() == null || price.trim() == "") {
		document.getElementById('priceError').innerHTML = "Price is mandatory";
	} else if (!price.match(patt1)) {
		document.getElementById('priceError').innerHTML = "Invalid Price";
	} else {
		document.getElementById('priceError').innerHTML = "";
	}
}

function validateQuantity() {
	var quantity = document.forms["addChocolate"]["quantity"].value;
	var patt1 = /^\d+$/g;
	if (quantity.trim() == null || quantity.trim() == "") {
		document.getElementById('quantityError').innerHTML = "Quantity is mandatory";
	} else if (!quantity.match(patt1)) {
		document.getElementById('quantityError').innerHTML = "Invalid Quantity";
	} else {
		document.getElementById('quantityError').innerHTML = "";
	}
}

function validate() {

	var paintingName = document.forms["addChocolate"]["chocolateName"].value;
	var price = document.forms["addChocolate"]["price"].value;
	var quantity = document.forms["addChocolate"]["quantity"].value;
	var pattPrice = /^\d+(\.\d{0,2})?$/g;
	var pattQty = /^\d+$/g;

	if (paintingName.trim() == null || paintingName.trim() == ""
			|| price.trim() == null || price.trim() == ""
			|| !price.match(pattPrice) || quantity.trim() == null
			|| quantity.trim() == "" || !quantity.match(pattQty)) {
		document.getElementById('errormsg').innerHTML = "One or more fields are mandatory.";
		return false;
	} else {
		document.getElementById('errormsg').innerHTML = "";
		return true;
	}
}

$(document).ready(function() {
	$("#singlebutton").click(function() {
		$("#errormsg").addClass("msgs");
		blink();
	});
});


function blink(){
	$('#info').fadeOut(800).fadeIn(400);
	
}