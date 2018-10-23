<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MuhanBit</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	<link rel="
tylesheet"href="https://fonts.googleapis.com/css?family=Lato">
	<link rel="stylesheet"href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<style>
	html, body, h1, h2, h3, h4 {
		font-family: "Lato", sans-serif
	}
	
	.mySlides {
		display: none
	}
	
	.w3-tag, .fa {
		cursor: pointer
	}
	
	.w3-tag {
		height: 15px;
		width: 15px;
		padding: 0;
		margin-top: 6px
	}
	</style>
</head>
<body style="height: 0;">
	<nav>
		<jsp:include page="main_nav.jsp" />
	</nav>
	<div class="w3-content"
		style="max-width: 1100px; margin-top: 40px; margin-bottom: 80px">
		<header>
			<jsp:include page="main_header.jsp" /> 
		</header>
		<section> 
		<%
		 	String prm = request.getParameter("section");
		 	if (prm == null || prm.equals(""))
		 		prm = "main_section.jsp";
 		%> 
 			<jsp:include page="<%=prm%>" /> 
 		</section>
		<jsp:include page="main_footer.jsp" />
	</div>
</body>
</html>