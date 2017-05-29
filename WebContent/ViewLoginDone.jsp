<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
   
<!DOCTYPE html>
<html>
<head>
<link href="css/formRegister.css" rel="stylesheet">
<script type="text/javascript">
$(document).ready(function() {
	    $.ajaxSetup({ cache: false }); // Avoids Internet Explorer caching!
	    $('#navigation').load('MenuController');
});
</script>
</head>
<body>
<div class="loginDone">
Login for user ${user} done!
</div>
</body>
</html>