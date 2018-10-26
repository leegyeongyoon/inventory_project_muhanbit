<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
								//드라이버 로드
								String product_name = "";
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db", "root", "muhanbit");
								PreparedStatement pstmt = conn.prepareStatement("CREATE DATABASE inventory_control_muhanbit_db");
								pstmt.executeUpdate();
								pstmt.close();
								conn.close();	
								response.sendRedirect("datarestore.jsp");
						%>
</body>
</html>