<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.* " import="java.util.*"
	errorPage="error.jsp"%>
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
		String[] input_date = request.getParameterValues("input_date");
		String[] distinct_input_date = new HashSet<String>(Arrays.asList(input_date)).toArray(new String[0]);
		String deliver[] = request.getParameterValues("deliver");
		int[] count = new int[distinct_input_date.length];
		String insert_data = "INSERT INTO deliver_serial_tbl(product_name , serial_number,output_date,company) VALUES ";
		String delete_data = "delete from inventory_tbl where ";
		String output_date = request.getParameter("output_date");
		String company = request.getParameter("company");
		String product_name = request.getParameter("product_name");
		String product_name_chiwan = product_name.replaceAll("'", "&#39;");
		String output_date_2 =  "<a href='index.jsp?section=deliver_view.jsp&product_name="+product_name_chiwan+"&output_date="+output_date+"'>"+output_date+"</a>"  ;
		//드라이버 로드
		Class.forName("com.mysql.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
				"root", "muhanbit");
		PreparedStatement pstmt = null;
		int k=0;
		for (int i = 0; i < distinct_input_date.length; i++) {
			for (int j = 0; j < input_date.length; j++) {

				if (distinct_input_date[i].equals(input_date[j])) {
					delete_data += "serial_number =? ||";
					count[i] += 1;
				}
			}
			pstmt=conn.prepareStatement("UPDATE inventory_list_tbl SET deliver =deliver + ?, output_date =concat(output_date,?,'(',?,')<br>') , company = concat(company,?,'<br>') WHERE product_name = ? AND input_date = ?");
			pstmt.setInt(1, count[i]);
			pstmt.setString(2,output_date_2);
			pstmt.setInt(3,count[i]);
			pstmt.setString(4,company);
			pstmt.setString(5,product_name);
			pstmt.setString(6,distinct_input_date[i]);

			pstmt.executeUpdate();

		}
		System.out.println("0");
		pstmt=conn.prepareStatement(delete_data.substring(0, delete_data.length() - 2));
		for(int i=0; i<deliver.length;i++){
			pstmt.setString(i+1, deliver[i]);
			insert_data += "(?,?,?,?),";
		}
		pstmt.executeUpdate();
			System.out.println(insert_data);
		pstmt=conn.prepareStatement(insert_data.substring(0, insert_data.length() - 1));
		for(int i=0 ; i<deliver.length ; i++){
			pstmt.setString(i + 1 + k, product_name);
			pstmt.setString(i + 2 + k, deliver[i]);
			pstmt.setString(i + 3 + k, output_date);
			pstmt.setString(i + 4 + k, company);
		
			k += 3;
			
		}
		k = 0;
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		out.println("<script>alert('납품이  완료되었습니다.'); location.href='index.jsp';</script>");
	%>


</body>
</html>