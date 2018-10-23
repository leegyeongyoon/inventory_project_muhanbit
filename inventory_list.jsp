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
	color: rightgray;
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
				<th style="text-align: center;">카테고리</th>
				<th style="text-align: center;">물건명</th>
				<th style="text-align: center;">재고량</th>
				<th style="text-align: center;">납품량</th>
				<th style="text-align: center;">입고일</th>
				<th style="text-align: center;">출고일</th>
				<th style="text-align: center;">납품회사</th>
			</tr>
		</thead>
		<tbody>
			<%
				//드라이버 로드
				Class.forName("com.mysql.jdbc.Driver");
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
						"root", "muhanbit");
				PreparedStatement pstmt = conn.prepareStatement(
						"SELECT p.category,i.product_name ,   SUM(i.inventory) ,i.input_date  AS input_date , i.output_date , deliver, company FROM product_tbl p INNER JOIN inventory_list_tbl i ON p.product_name =  i.product_name GROUP BY input_date,i.product_name, output_date ORDER BY seq DESC");
				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String category = rs.getString(1);
					String produc_name = rs.getString(2);
					String inventory = rs.getString(3);
					String input_date = rs.getString(4);
					String output_date = rs.getString(5);
					String deliver = rs.getString(6);
					String company = rs.getString(7);
			%>
			<tr>
				<td><%=category%></td>
				<td><%=produc_name%></td>
				<td><%=inventory%></td>
				<td><%=deliver%></td>
				<td><%=input_date%></td>
				<td><%=output_date%></td>
				<td><%=company%></td>
			</tr>
			<%
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