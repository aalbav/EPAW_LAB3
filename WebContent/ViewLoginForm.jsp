<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/formRegister.css" rel="stylesheet">
<link href="css/formLogin.css" rel="stylesheet">
<title> Login Form </title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>

<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker.min.css" />
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/css/datepicker3.min.css" />

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.3.0/js/bootstrap-datepicker.min.js"></script>



<script>
$(document).ready(function(){
    $("#loginForm").validate({
    	submitHandler: function(form) {
    		$('#content').load('LoginController',$("#loginForm").serialize());
    	}
    });
});
</script>

</head>
<body>

<div class="wrapper">
    <div class="form-container">
<form id="loginForm" action="LoginController" method="POST">
<h2 class="form-signin-heading">Login</h2>

<div class="loginForm">
<div class="container-input">
	<label for="user" class="sr-only">User id*</label>
	<input id="user" name="user" type="text" placeholder="User id*" class="form-control" minlength="5" value="${login.user}" required autofocus>
</div>

<div class="container-input">
	<label for="password" class="sr-only">Password*</label>
	<input type="password" name="password" value="${login.password}" id="password" placeholder="Password*" class="form-control" required autofocus>
<c:if test="${login.error[0] == 1}">
   <div class="error"> Nonexistent this username and password in our DB! </div> 
</c:if>
</div>

<button class="btn btn-lg btn-primary btn-block" type="submit" >Login</button>

</div>
</form>
</div>
</div>
</body>