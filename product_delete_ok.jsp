<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.* " errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String sql = "";
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
				"root", "muhanbit");
		PreparedStatement pstmt = null;
		String choose_delect = request.getParameter("choose_delect");
		if (choose_delect.equals("2")) {
			String category = request.getParameter("category");
			String product_name = request.getParameter("product_name");
			sql = "DELETE FROM product_tbl WHERE product_name = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, product_name);

		} else {
			String category = request.getParameter("category");
			sql = "DELETE FROM product_tbl WHERE category = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);

		}
		pstmt.executeUpdate();
		pstmt.close();

		//드라이버 로드

		conn.close();
		out.println("<script>alert('삭제가 완료되었습니다.'); location.href='index.jsp?section=product_delete.jsp';</script>");
	%>


</body>
</html>