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
		String category =request.getParameter("category");
		String product_name = request.getParameter("product_name");
    //드라이버 로드
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db","root","muhanbit");
    PreparedStatement pstmt  = conn.prepareStatement("INSERT INTO product_tbl VALUES(?,?)");
    pstmt.setString(1, category);
    pstmt.setString(2, product_name);
   pstmt.executeUpdate();   
   pstmt.close();
    conn.close();
    out.println("<script>alert('장비 등록이 완료되었습니다.'); location.href='index.jsp';</script>");
  
	
%>


</body>
</html>