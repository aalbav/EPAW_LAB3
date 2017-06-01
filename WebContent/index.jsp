<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Lab 3 template </title>
<link rel="stylesheet" type="text/css" href="css/prova.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"> </script>
</head>
<body>

	<!-- Begin Header -->
	<div id="header">


		
			<!-- Begin Navigation -->
		<div id="navigation">
	
		<jsp:include page="ViewMenuNotLogged.jsp" />
	   
		</div>
		<!-- End Navigation -->		 
   
	</div>
	<!-- End Header -->
	
	<!-- Begin Faux Columns -->
	<div id="faux">
	
	      <!-- Begin Left Column -->
	<div id="leftcolumn">
	
	</div>
	<!-- End Left Column -->
	
	<!-- Begin Content Column -->
	<div id="content">
	
		<%
			String user; 
			if (request.getSession().getAttribute("user") == null ) {
				user = "ViewRegisterForm.jsp";
			}
			else{
				user = "ViewLoginDone.jsp";
			}
		%>
		
		<jsp:include page= "<%= user %>" />
	   			  
	</div>
	<!-- End Content Column -->
	
	<!-- Begin Right Column -->
	<div id="rightcolumn">
	
	</div>
	<!-- End Right Column -->
	
	</div>	   
	<!-- End Faux Columns --> 
	
	<!-- Begin Footer -->
	<div id="footer">
	
	
	
	</div>
	<!-- End Footer -->
		 
</body>
</html>