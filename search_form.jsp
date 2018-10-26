<%@page import="java.sql.*"%>
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
<title>Book You Love</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
<script>
	function search_go() {
		var action_selete;
		if (frm_obj_search.first_seach.value == "1") {
			action_selete = "search_results_inventory_state"
		}else if(frm_obj_search.first_seach.value == "2") {
			action_selete = "search_results_inventory_list"
		}else{
			alert("찾을 정보를 선택해 주세요");
			frm_obj_search.first_seach.focus
			return false;
		}
		if (frm_obj_search.search.value == "") {
			alert("검색할 내용을 입력해 주세요");
			frm_obj_search.search.focus();
			return false;
		}
		frm_obj_search.action = "index.jsp?section="+action_selete+".jsp";
		frm_obj_search.action = "index.jsp?section="+action_selete+".jsp&currentPage=1";
		frm_obj_search.submit();
	}
</script>
</head>
<body>
	<div class="w3-center w3-padding-64" id="contact">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">재고 내역 검색</span>
	</div>
	<form class="w3-container" method="post" name="frm_obj_search"
		style="margin-bottom: 156px;">
		<div class="w3-section">
				<label>찾을 정보</label>
				<div class="form-group">
					<select class="form-control" name="first_seach" onchange="search_first_selete()" id="first_selete">
						<option value="0"></option>
						<option value="1">현재 재고 목록</option>
						<option value="2">재고 내역</option>
					</select>
				</div>
		</div>
		<div class="w3-section">
				<label>검색 키워드</label>
				<div class="form-group">
				<select class="form-control" name="second_search" id="second_selete" onchange="search_data_selete()">
				</select>
		</div>
		</div>
		<div class="w3-section">
			<label>찾을 정보</label>
		<div id="search_data_input">
		
		</div>
		</div>
		<input type="button" class="w3-button w3-block w3-black w3-col s6"
			style="margin-bottom: 3em;" value="검색" onclick="search_go()">
		<input type="button" class="w3-button w3-block w3-black w3-col s6"
			style="margin-bottom: 3em;" value="메인 페이지"
			onclick="location.href = 'index.jsp'">
	</form>
	</div>
	<script type="text/javascript" src="validate.js"></script>
</body>
</html>