<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="models.BeanUser" import="controllers.DAO" import="java.util.List" import="java.sql.ResultSet"

    %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet" media="screen">
<link href="CSS/estil.css" rel="stylesheet">
<title> Show database </title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>

</head>
<body>
<h1>The database</h1>
<table class="table table-striped">
	<tr>
	<th>Username</th>
 	<th>Name</th>
 	<th>Middle name</th>
 	<th>Last name</th>
 	<th>E-mail</th>
 	<th>Password</th>
 	<th>Birthdate</th>
 	<th>Profile Picture</th>
 	</tr>
 	<%
 	List<BeanUser> llista = (List<BeanUser>) request.getAttribute("llista");
 	for(BeanUser item : llista){
		 out.println("<tr>"+
				 	"<td>"+item.getUser()+"</td>"+
				 	"<td>"+item.getName()+"</td>"+
				 	"<td>"+item.getMiddleName()+"</td>"+
				 	"<td>"+item.getLastName()+"</td>"+
				 	"<td>"+item.getMail()+"</td>"+
				 	"<td>"+item.getPassword()+"</td>"+
				 	"<td>"+item.getBirthdate()+"</td>"+
				 	"<td> <img src= \" "+item.getProfilePicture()+ "\" alt=\"Profile Picture\" height=\"100\" width=\"100\"></td>"+
				 	"</tr>");
 	}

 	%>
 	</table>
 	</body>
 	
 	
</body>

</html>