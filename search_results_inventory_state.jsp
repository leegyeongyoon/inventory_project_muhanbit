<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
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

.mySlides { b
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

table, th, tr, td {
	text-align: center;
}
</style>
</head>
<body style="height: 933px;">
	<div class="w3-center w3-padding-64" id="contact">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">현재 재고 검색 결과</span>
	</div>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>물건 이름</th>
				<th>시리얼넘버</th>
				<th>입고일</th>
				<th>기타사항</th>
			</tr>
		</thead>
		<%
				String searchlist = null;
				String searchdate = null;
				
				searchdate = request.getParameter("search");
				switch (request.getParameter("second_search")) {
				case "1":
					searchlist = "product_name";
					break;
				case "2":
					searchlist = "serial_number";
					break;
				case "3":
					searchlist = "input_date";
					break;
				case "4":
					searchlist = "other_information";
					break;
				}
		            int totalCount = 0;
		            //드라이버 로드
		            Class.forName("com.mysql.jdbc.Driver");
		            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
		                  "root", "muhanbit");
		            
		            String totalsql = "SELECT count(*) from inventory_tbl where "+searchlist + " like '%" + searchdate + "%'";
		            PreparedStatement totalstem = conn.prepareStatement(totalsql);
		            ResultSet totalrs = totalstem.executeQuery();
		            
		            while(totalrs.next()){
		               totalCount = totalrs.getInt(1);
		            }// 전체 행 가져오는 쿼리문
		            
		            int currentPage = 1; // 현재 페이지
		            if(request.getParameter("currentPage")!=null){
		               currentPage = Integer.parseInt(request.getParameter("currentPage"));
		            }// 만약 현재 페이지에 값이 들어가서 넘어온다면 현재 페이지를 그 페이지로 설정해준다.
		            
		            int countList = 10; // 한 페이지에 보여줄 글 수
		            String listSql = "SELECT product_name, serial_number, input_date, other_information from inventory_tbl WHERE "
	                        + searchlist + " like '%" + searchdate + "%' order by 3 desc, 2 LIMIT ?, ?";
		            PreparedStatement liststem = conn.prepareStatement(listSql);
		            liststem.setInt(1,(currentPage-1)*countList);
		            liststem.setInt(2, countList);
		            ResultSet listrs = liststem.executeQuery();

		            while (listrs.next()) {
		            	String product_name = listrs.getString(1);
		            	String serial_number = listrs.getString(2);
		            	String input_date = listrs.getString(3);
		            	String other_information = listrs.getString(4);
		         %>
		         <tr>
		            <td><%=product_name%></td>
					<td><%=serial_number%></td>
					<td><%=input_date%></td>
					<td><%=other_information%></td>
		         </tr>
		         </tbody>
		         <%
		            }
		         %>
		         </table>
		         <div class="w3-center">
		         <ul class="pagination">
		         <%
		         int countPage = 5;
		         int totalPage = totalCount/countList;
		         
		         if(totalCount % countList > 0){
		            totalPage++;
		         }

		         if(totalPage < currentPage){
		            currentPage = totalPage;
		         }

		         int startPage = ((currentPage - 1) /5) * 5 + 1;
		         int endPage = startPage + countPage - 1;

		         if(endPage > totalPage){
		            endPage = totalPage;
		         }

		         if(startPage>1){
		         %>
		            <li><a href="index.jsp?section=search_results_inventory_state.jsp&currentPage=1">처음</a></li>
		         <%
		         }
		         
		         if(startPage>1){
		         %>
		            <li><a href="index.jsp?section=search_results_inventory_state.jsp&currentPage=<%=startPage-countPage%>">이전</a></li>
		         <%
		         }
		         
		         for(int i = startPage; i <= endPage; i++){
		         %>
		         <li><a href="index.jsp?section=search_results_inventory_state.jsp&currentPage=<%=i%>"><%=i%></a></li>
		         <%
		         }
		         if(endPage!=totalPage){
		         %>
		         <li><a href="index.jsp?section=search_results_inventory_state.jsp&currentPage=<%=startPage+countPage%>">다음</a></li>
		         <%
		         }
		         if(endPage!=totalPage){
		         %>
		         <li><a href="index.jsp?section=search_results_inventory_state.jsp&currentPage=<%=totalPage%>">끝</a></li>
		         <%
		            }
		            listrs.close();
		            totalrs.close();
		            liststem.close();
		            totalstem.close();
		            conn.close();
		         %>
		      </ul>
		   </div>
		   </div>
		</body>
		</html>