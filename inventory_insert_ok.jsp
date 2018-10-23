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
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
				"root", "muhanbit");
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		PreparedStatement pstmt = null;
		String insert_data = "INSERT INTO inventory_tbl VALUES ";
		String category = request.getParameter("category");
		String product_name = request.getParameter("product_name");
		String input_date = request.getParameter("input_date");
		String other_information = request.getParameter("other_information");
		int inventory = Integer.parseInt(request.getParameter("inventory"));
		int j = 0;
		
		
		
		
		for (int i = 0; i < inventory; i++) {
			insert_data += "(?,?,?,?),";
		}
		System.out.println(insert_data);
		pstmt = conn.prepareStatement(insert_data.substring(0, insert_data.length() - 1));
		for (int i = 0; i < inventory; i++) {
			String serial_number = request.getParameter("inventory[" + i + "]");
			pstmt.setString(i + 1 + j, product_name);
			pstmt.setString(i + 2 + j, serial_number);
			pstmt.setString(i + 3 + j, input_date);
			pstmt.setString(i + 4 + j, other_information);
			j += 3;
			
		}
		j = 0;

		

		//드라이버 로드

		pstmt.executeUpdate();
		
		pstmt = conn.prepareStatement("SELECT * FROM inventory_list_tbl WHERE product_name = ? AND input_date = ?");
		int count = 0;
		pstmt.setString(1, product_name);
		pstmt.setString(2, input_date);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			count ++;
		}
		
		if(count ==1){
			pstmt = conn.prepareStatement("UPDATE inventory_list_tbl set  inventory = inventory+? WHERE product_name = ? AND input_date = ?");
			pstmt.setInt(1, inventory);
			pstmt.setString(2, product_name);
			pstmt.setString(3, input_date);
			pstmt.executeUpdate();
		}
		else if(count ==0){
			pstmt = conn.prepareStatement("INSERT INTO inventory_list_tbl(product_name , inventory , input_date) VALUES(?,?,?)");
			pstmt.setString(1, product_name);
			pstmt.setInt(2, inventory);
			pstmt.setString(3, input_date);
			pstmt.executeUpdate();
				
		}
		pstmt.close();
		conn.close();
		out.println("<script>alert('재고 등록이 완료되었습니다.'); location.href='index.jsp';</script>");
	%>


</body>
</html>