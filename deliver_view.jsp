<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

a:hover {
	color: white;
}
</style>
</head>
<body style="height: 933px;">
	<div class="w3-center w3-padding-64" id="contact">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">재고
			내역</span>
	</div>
	<table class="table" style="margin-bottom: 379px; text-align: center;">
		<thead class="thead-dark">
			<tr>
				<th style="text-align: center;">번호</th>
				<th style="text-align: center;">물건명</th>
				<th style="text-align: center;">시리얼 번호</th>
				<th style="text-align: center;">출고일</th>
				<th style="text-align: center;">납품 회사</th>
				
			</tr>
		</thead>
		<tbody>
			<%
				//드라이버 로드
				Class.forName("com.mysql.jdbc.Driver");
				request.setCharacterEncoding("utf-8");
				String req_product_name = request.getParameter("product_name");
				String output_date = request.getParameter("output_date");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
						"root", "muhanbit");
				PreparedStatement pstmt = conn.prepareStatement("SELECT count(*) FROM deliver_serial_tbl WHERE product_name = ? AND output_date = ? ");
				pstmt.setString(1, req_product_name);
				pstmt.setString(2, output_date);
				ResultSet rs = pstmt.executeQuery();
				rs.next();
				int count = rs.getInt(1);
				 pstmt = conn.prepareStatement("SELECT product_name , serial_number,output_date,company FROM deliver_serial_tbl WHERE product_name = ? AND output_date = ? ");
				pstmt.setString(1, req_product_name);
				pstmt.setString(2, output_date);
				 rs = pstmt.executeQuery();
				int i  =0 ;
				
				while (rs.next()) {
					String product_name= rs.getString(1);
					String serial_number = rs.getString(2);
					String output_date_sel = rs.getString(3);
					String company= rs.getString(4);
					
			%>
			<tr>
				<td><%=count-i%></td>
				<td><%=product_name%></td>
				<td><%=serial_number%></td>
				<td><%=output_date%></td>
				<td><%=company%></td>
			
			</tr>
			<%	i++;
				}
				rs.close();
				pstmt.close();
				conn.close();
			%>
		</tbody>
	</table>
	</div>
</body>
</html>