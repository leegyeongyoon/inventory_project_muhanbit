<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" errorPage="error.jsp"%>
<%
	String category = request.getParameter("category");
	String data = "";

	

		//드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db", "root", "muhanbit");
		PreparedStatement pstmt = conn.prepareStatement("SELECT product_name FROM product_tbl WHERE category = ?");
		pstmt.setString(1, category);
		ResultSet rs = pstmt.executeQuery();
		data += "<option></option>";
		while (rs.next()) {
			String product_name = rs.getString(1);

			data += "<option name='product_name'  >" + product_name + "</option>";

		}
		rs.close();
		pstmt.close();
		conn.close();

		out.println(data);

	
%>



