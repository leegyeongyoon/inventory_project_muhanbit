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
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">재고 내역 검색 결과</span>
	</div>
	<table class="table">
		<thead class="thead-dark">
			<tr>
				<th>물건 이름</th>
                <th>입고량</th>
                <th>납품량</th>
                <th>입고일</th>
                <th>납품일</th>
                <th>납품회사</th>
			</tr>
		</thead>
		<%
				String searchlist = null;
				String searchdate = null;
				String searchselete = null;
				
				searchdate = request.getParameter("search");
				searchselete = request.getParameter("second_search");
				
				switch (searchselete){
				case "1":
                    searchlist = "product_name";
                    break;
                case "2":
                    searchlist = "inventory";
                    break;
                case "3":
                    searchlist = "deliver";
                    break;
                case "4":
                    searchlist = "input_date";
                    break;
                case "5":
                    searchlist = "output_date";
                    break;
                case "6":
                    searchlist = "company";
                    break;
				}
				
		            int totalCount = 0;
		            //드라이버 로드
		            Class.forName("com.mysql.jdbc.Driver");
		            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
		                  "root", "muhanbit");
		            
		            String totalsql = "SELECT count(*) from inventory_list_tbl where "+searchlist + " like '%" + searchdate + "%'";
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
		            String listSql = "SELECT product_name, inventory, deliver, input_date, output_date, company from inventory_list_tbl WHERE "
	                        + searchlist + " like '%" + searchdate + "%' order by 4 desc, 5 LIMIT ?, ?";
		            PreparedStatement liststem = conn.prepareStatement(listSql);
		            liststem.setInt(1,(currentPage-1)*countList);
		            liststem.setInt(2, countList);
		            ResultSet listrs = liststem.executeQuery();
		            
				

		            while (listrs.next()) {
		            	String product_name = listrs.getString(1);
		            	String inventory = listrs.getString(2);
		            	String deliver = listrs.getString(3);
		            	String input_date = listrs.getString(4);
		            	String output_date = listrs.getString(5);
		            	String company = listrs.getString(6);
		         %>
		         <tr>
		            <td><%=product_name%></td>
	                <td><%=inventory%></td>
	                <td><%=deliver%></td>
	                <td><%=input_date%></td>
	                <td><%=output_date%></td>
	                <td><%=company%></td>
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
		            <li><a href="index.jsp?section=search_results_inventory_list.jsp&currentPage=1&search=<%=searchdate%>&second_search=<%=searchselete%>">처음</a></li>
		         <%
		         }
		         
		         if(startPage>1){
		         %>
		            <li><a href="index.jsp?section=search_results_inventory_list.jsp&currentPage=<%=startPage-countPage%>&search=<%=searchdate%>&second_search=<%=searchselete%>">이전</a></li>
		         <%
		         }
		         
		         for(int i = startPage; i <= endPage; i++){
		         %>
		         <li><a href="index.jsp?section=search_results_inventory_list.jsp&currentPage=<%=i%>&search=<%=searchdate%>&second_search=<%=searchselete%>"><%=i%></a></li>
		         <%
		         }
		         if(endPage!=totalPage){
		         %>
		         <li><a href="index.jsp?section=search_results_inventory_list.jsp&currentPage=<%=startPage+countPage%>&search=<%=searchdate%>&second_search=<%=searchselete%>">다음</a></li>
		         <%
		         }
		         if(endPage!=totalPage){
		         %>
		         <li><a href="index.jsp?section=search_results_inventory_list.jsp&currentPage=<%=totalPage%>&search=<%=searchdate%>&second_search=<%=searchselete%>">끝</a></li>
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