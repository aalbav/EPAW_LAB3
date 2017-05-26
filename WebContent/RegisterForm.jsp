<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="css/estil.css" rel="stylesheet">
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
<form class="form-signin" action="FormController" method="post" id="registerForm">
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


<div class="container-input">
	<label for="user" class="sr-only">Username*</label>
	<input type="text" name="user" id="user" value="<%=user.getUser() %>" minlength="5" placeholder="Username*" class="form-control" required autofocus">
<%   
	if (user.getError()[0] == 1) {
      %> 
      <div class="error">
           The username already exists!
      </div>
      <% 
     }
	user.setError(0,0);
%>

</div>
<div class="container-input">
	<label for="mail" class="sr-only">E-mail</label>
	<input type="email" name="mail" id="mail" value="<%=user.getMail() %>" placeholder="E-mail*" class="form-control" required email autofocus>
<%   
	if (user.getError()[1] == 1) {
      %> 
      <div class="error">
           The email already exists!
      </div>
      <% 
     }
	user.setError(1,0);
%>

</div>
<div class="container-input">
	<label for="password" class="sr-only">Password*</label>
	<input type="password" name="password" value="<%=user.getPassword()%>" id="password" placeholder="Password*" class="form-control" required autofocus>
</div>

<div class="container-input">
	<label for="confirmationPassword" class="sr-only">Password confirmation*</label>
	<input type="password" name="confirmationPassword" value="<%=user.getConfirmationPassword()%>" id="confirmationPassword" placeholder="Password confirmation*" class="form-control" required autofocus>
</div>

<div  class="container-input">
	<label for="profilePicture" class="sr-only">Profile Picture</label>
	<input type="text" name="profilePicture" value="<%=user.getProfilePicture()%>" id="profilePicture" placeholder="Profile Picture (URL)" class="form-control" onblur="checkImage()" autofocus>
</div>

<div id = "demo"></div>

<div class="container-input">

        <label class="control-label">Terms of use</label>
            <div style="border: 1px solid #e5e5e5; height: 200px; overflow: auto; padding: 10px;">
                <p>Lorem ipsum dolor sit amet, veniam numquam has te. No suas nonumes recusabo mea, est ut graeci definitiones. His ne melius vituperata scriptorem, cum paulo copiosae conclusionemque at. Facer inermis ius in, ad brute nominati referrentur vis. Dicat erant sit ex. Phaedrum imperdiet scribentur vix no, ad latine similique forensibus vel.</p>
                <p>Dolore populo vivendum vis eu, mei quaestio liberavisse ex. Electram necessitatibus ut vel, quo at probatus oportere, molestie conclusionemque pri cu. Brute augue tincidunt vim id, ne munere fierent rationibus mei. Ut pro volutpat praesent qualisque, an iisque scripta intellegebat eam.</p>
                <p>Mea ea nonumy labores lobortis, duo quaestio antiopam inimicus et. Ea natum solet iisque quo, prodesset mnesarchum ne vim. Sonet detraxit temporibus no has. Omnium blandit in vim, mea at omnium oblique.</p>
                <p>Eum ea quidam oportere imperdiet, facer oportere vituperatoribus eu vix, mea ei iisque legendos hendrerit. Blandit comprehensam eu his, ad eros veniam ridens eum. Id odio lobortis elaboraret pro. Vix te fabulas partiendo.</p>
                <p>Natum oportere et qui, vis graeco tincidunt instructior an, autem elitr noster per et. Mea eu mundi qualisque. Quo nemore nusquam vituperata et, mea ut abhorreant deseruisse, cu nostrud postulant dissentias qui. Postea tincidunt vel eu.</p>
                <p>Ad eos alia inermis nominavi, eum nibh docendi definitionem no. Ius eu stet mucius nonumes, no mea facilis philosophia necessitatibus. Te eam vidit iisque legendos, vero meliore deserunt ius ea. An qui inimicus inciderint.</p>
            </div>
  	Accept <input type="radio">

</div>

<button class="btn btn-lg btn-primary btn-block" type="submit" >Sign up</button>
</fieldset>
</form>
</div>
</div>
</body>

</html>