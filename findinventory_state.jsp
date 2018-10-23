<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"  errorPage="error.jsp"%>
<%
	String product_name = request.getParameter("product_name");
	String data = "		<thead class='thead-dark'><tr><th>선택</th> <th>카테고리</th> <th>물건명</th> <th>시리얼번호</th> <th>입고일</th> <th>기타사항</th></tr></thead>";


		//드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager
				.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db", "root", "muhanbit");
		PreparedStatement pstmt = conn.prepareStatement("SELECT p.category,i.product_name , i.serial_number , i.input_date , i.other_information FROM product_tbl p INNER JOIN inventory_tbl i ON p.product_name = i.product_name WHERE i.product_name = ? ORDER BY input_date DESC");
		pstmt.setString(1, product_name);
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			String category = rs.getString(1);
			String produc_name = rs.getString(2);
			String serial_number = rs.getString(3);
			String input_date = rs.getString(4);
			String other_information = rs.getString(5);

			data += "<tbody><tr> <td><input type='checkbox'  name='deliver' id='deliver'  value='" + 
				    serial_number+ "'> </td>  <td>" + 
					category + "</td> <td>" + 
				    produc_name + "</td> <td>" + 
					serial_number+ "</td> <td>" + 
				    input_date + "</td> <td>" + 
					other_information+ "</td> <input type='hidden' id='" + 
					serial_number + "' name='input_date' value='"+ 
					input_date + "'> <input type='hidden' name='product_name' value='" + produc_name+ "'></tr></tbody>";

		}

		rs.close();
		pstmt.close();
		conn.close();

		out.println(data);

	
%>