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
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html, body, h1, h2, h3, h4 {
	font-family: "Lato", sans-serif
}

.mySlides { b
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

table, th, tr, td {
	text-align: center;
}
</style>
</head>
<body style="height: 933px;">
	<div class="w3-center w3-padding-64" id="contact">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">검색 결과</span>
	</div>
	<table class="table" style="margin-bottom: 379px;">
		<thead class="thead-dark">
			<tr>
				<th>물건 이름</th>
				<th>시리얼넘버</th>
				<th>입고일</th>
				<th>기타사항</th>
			</tr>
		</thead>
		<%
			try {
				String searchlist = null;
				String searchdate = null;
				String product_name,serial_number,input_date,other_information;

				searchdate = request.getParameter("search");
				switch (request.getParameter("second_seach")) {
				case "1":
					searchlist = "product_name";
					break;
				case "2":
					searchlist = "serial_number";
					break;
				case "3":
					searchlist = "input_date";
					break;
				case "4":
					searchlist = "other_information";
					break;
				}
				Class.forName("com.mysql.jdbc.Driver");
			    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db","root","muhanbit");
				Statement stmt = con.createStatement();
				String sql = "SELECT product_name, serial_number, input_date, other_information  from inventory_tbl WHERE "
						+ searchlist + " like '%" + searchdate + "%'";
				ResultSet rs = stmt.executeQuery(sql);

				while (rs.next()) {
					product_name = rs.getString(1);
					serial_number = rs.getString(2);
					input_date = rs.getString(3);
					other_information = rs.getString(4);
		%>
		<tbody>
			<tr style="margin-bottom: 2em;">
				<td><%=product_name%></td>
				<td><%=serial_number%></td>
				<td><%=input_date%></td>
				<td><%=other_information%></td>
			</tr>
		</tbody>
		<%
			}
				stmt.close();
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
	</div>
</body>
</html>