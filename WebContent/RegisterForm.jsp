<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="CSS/estil.css" rel="stylesheet">
<title> Template Register Form (Validation JQuery) </title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>


<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>


<script>
$(document).ready(function(){
     $("#registerForm").validate({
		rules : {
			name : "required",
			mail : {
				required : true,
				email : true
			},
			user : {
				required : true,
				onfocusout: true
			},
			password : {
				required : true,
				minlength : 5
			},
			confirmationPassword : {
				minlength : 5,
				equalTo : "#password"
			}, 
			profilePicture : {
				maxlength : 100,
				onfocusout : function checkImage() {
				System.out.println("imateges")
				  var xhttp = new XMLHttpRequest();
				  xhttp.onreadystatechange = function() {
				    if (this.readyState == 4 && this.status == 200) {
				     document.getElementById("demo").innerHTML = "<img src=\'" + document.getElementById("profilePicture").value + "\'>";
				    }
				  };
				  xhttp.open("GET", document.getElementById("profilePicture").value, true);
				  xhttp.send();
				}
			}
		},
		onfocusout : function userName() {
			System.out.println("jsp!!");
			var xhttp;
			var str = document.getElementById("user").value;
			xhttp = new XMLHttpRequest();
			xhttp.onreadystatechange = function() {
			  if (this.readyState == 4 && this.status == 200) {
			    document.getElementById("user").style.color = "orange";
			    System.out.println(this.getAllResponseHeaders());
			  }
			};
			xhttp.open("POST", "FormController?q="+str, true);
			xhttp.send();   
		},
		messages : {
			name : "Please enter your name",
			user: "Please enter your username",
			mail : "Please enter a valid email address",
			password : {
				required : "Please provide a password",
				minlength : "Your password must be at least 5 characters long"
			},
			confirmationPassword : {
				required : "Please repeat your password",
				minlength : "Your password must be at least 5 characters long"
			},
			profilePicture : {
				maxlength : "Your profile puctures must be at most 100 characters long"
			}
		}
	});
     
     $('#datePicker')
     .datepicker({
         autoclose: true,
         format: 'dd/mm/yyyy',
         todayBtn: "linked",
         language: "es",
         todayHighlight: true
     })
  });

</script>

</head>
<body>

<% 
BeanUser user = null;
if (request.getAttribute("user")!=null) {
	user = (BeanUser)request.getAttribute("user");
}
else {
	user = new BeanUser();
}
%>
<div class="wrapper">
    <div class="form-container">
<form class="form-signin" action="/Lab_2/FormController" method="post" id="registerForm">
<h2 class="form-signin-heading">Registration</h2>
<fieldset>
<div class="container-input">
	<label for="name" class="sr-only">Name*</label>
	<input id="name" name="name" type="text" placeholder="Name*" class="form-control" value="<%=user.getName()%>" required autofocus>
</div>

<div class="container-input">
	<label for="middleName" class="sr-only">Middle name</label>
	<input id="middleName" type="text" name="middleName" value="<%=user.getMiddleName()%>" id="middleName" placeholder="Middle name" class="form-control" autofocus>
	
</div>
<div class="container-input">
	<label for="lastName" class="sr-only">Last name</label>
	<input id="lastName" type="text" name="lastName" value="<%=user.getLastName()%>" id="lastName" placeholder="Last name*" class="form-control" required autofocus>
</div>

<div class="container-input">
	<div class="input-group input-append date" id="datePicker">
		<input type="text" class="form-control" id="birthdate" name="birthdate" placeholder="Date" value="<%=user.getBirthdate()%>" required autofocus/>
		<span class="input-group-addon add-on"><span class="glyphicon glyphicon-calendar"></span></span>
	</div>
</div>
