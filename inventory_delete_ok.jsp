<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.* " import="java.util.*"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	try{
	
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		String[] input_date = request.getParameterValues("input_date");
		String[] distinct_input_date = new HashSet<String>(Arrays.asList(input_date)).toArray(new String[0]);
		int[] count = new int[distinct_input_date.length];
		String deliver[] = request.getParameterValues("deliver");
		String delete_data = "DELETE FROM inventory_tbl WHERE ";
		String product_name = request.getParameter("product_name");
		//드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
				"root", "muhanbit");
		PreparedStatement pstmt = conn.prepareStatement("UPDATE inventory_list_tbl SET inventory =inventory - ?  WHERE product_name = ? AND input_date = ?");
		for (int i = 0; i < distinct_input_date.length; i++) {
		
			for (int j = 0; j < input_date.length; j++) {
				if (distinct_input_date[i].equals(input_date[j])) {
					delete_data += "serial_number = ? ||";
					count[i] += 1;
				}
			
			}
			
			pstmt.setInt(1, count[i]);
			pstmt.setString(2, product_name);
			pstmt.setString(3, distinct_input_date[i]);
			pstmt.executeUpdate();
		}
		 pstmt = conn.prepareStatement(delete_data.substring(0, delete_data.length() - 2));
		
		 
		for (int i = 0; i < deliver.length; i++) {
			pstmt.setString(i+1, deliver[i]);
			
		}
	
		pstmt.executeUpdate();

		pstmt.executeUpdate("DELETE FROM inventory_list_tbl WHERE inventory <= 0 AND deliver <= 0 ");

		pstmt.close();
		conn.close();
		out.println("<script>alert('삭제가 완료되었습니다.'); location.href='index.jsp?section=inventory_state.jsp';</script>");}
	catch(Exception e ){
		e.printStackTrace();
	}
	%>


</body>
</html>