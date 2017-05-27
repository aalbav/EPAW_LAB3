<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/formRegister.css" rel="stylesheet">
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
			
			password : {
				required : true
			}  
		},
		messages : {
			name : "Please enter your name",
			password : {
				required : "Please provide a password",
				minlength : "Your password must be at least 5 characters long"
			}
		}
  }
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
<h2 class="form-signin-heading">Login</h2>
<fieldset>
<div class="container-input">
	<label for="name" class="sr-only">Name*</label>
	<input id="name" name="name" type="text" placeholder="Name*" class="form-control" value="<%=user.getName()%>" required autofocus>
</div>

<div class="container-input">
	<label for="password" class="sr-only">Password*</label>
	<input type="password" name="password" value="<%=user.getPassword()%>" id="password" placeholder="Password*" class="form-control" required autofocus>
</div>

<button class="btn btn-lg btn-primary btn-block" type="submit" >Sign up</button>
</fieldset>
</form>
</div>
</div>
</body>

</html>