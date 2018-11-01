<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

.mySlides {
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

a:hover {
	color: white;
}
</style>
</head>
<body style="height: 933px;">
	<div class="w3-center w3-padding-64" id="contact">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">납품 시리얼</span>
	</div>
	<table class="table" style="text-align: center;">
		<thead class="thead-dark">
			<tr>
				<th style="text-align: center;">번호</th>
				<th style="text-align: center;">물건명</th>
				<th style="text-align: center;">시리얼 번호</th>
				<th style="text-align: center;">MacAddress</th>
				<th style="text-align: center;">입고일</th>
				<th style="text-align: center;">납품일</th>
				<th style="text-align: center;">납품 회사</th>
				
			</tr>
		</thead>
		<tbody>
			<%
				//드라이버 로드
				Class.forName("com.mysql.jdbc.Driver");
				request.setCharacterEncoding("utf-8");
				String req_product_name = request.getParameter("product_name");
				String input_date = request.getParameter("input_date");
				
				int totalCount = 0;
				
				Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
						"root", "muhanbit");
				String totalsql = "SELECT count(*) FROM deliver_serial_tbl WHERE product_name = ? AND input_date = ? ";
                PreparedStatement totalstem = conn.prepareStatement(totalsql);
                totalstem.setString(1, req_product_name);
                totalstem.setString(2, input_date);
                ResultSet totalrs = totalstem.executeQuery();
                
                while(totalrs.next()){
                    totalCount = totalrs.getInt(1);
                 }// 전체 행 가져오는 쿼리문
                
                int currentPage = 1; // 현재 페이지
                if(request.getParameter("currentPage")!=null){
                   currentPage = Integer.parseInt(request.getParameter("currentPage"));
                }// 만약 현재 페이지에 값이 들어가서 넘어온다면 현재 페이지를 그 페이지로 설정해준다.
                
                int countList = 10; // 한 페이지에 보여줄 글 수
				
                String listSql = "SELECT product_name , serial_number,mac_address,input_date,output_date,company FROM deliver_serial_tbl WHERE product_name = ? AND input_date = ? order by company , serial_number LIMIT ?, ?";
                PreparedStatement liststem = conn.prepareStatement(listSql);
                liststem.setString(1, req_product_name);
                liststem.setString(2, input_date);
                liststem.setInt(3, (currentPage-1)*countList);
                liststem.setInt(4, countList);
                ResultSet listrs = liststem.executeQuery();
                int k =0;
                int current = currentPage;
                int score = totalCount;
                System.out.println(score);
                if(current >=2){
                	score = score-((current-1)*10);
                }
                 
                while (listrs.next()) {
					String product_name= listrs.getString(1);
					String serial_number = listrs.getString(2);
					String mac_address = listrs.getString(3);
					String input_date_sel = listrs.getString(4);
					String output_date_sel = listrs.getString(5);
					String company= listrs.getString(6);
				
					
			%>
			<tr>
				<td><%=score-k%></td>
				<td><%=product_name%></td>
				<td><%=serial_number%></td>
				<td><%=mac_address%></td>
				<td><%=input_date_sel%></td>
				<td><%=output_date_sel%></td>
				<td><%=company%></td>
			
			</tr>
                 </tbody>
                 <%
                k++;   
                
                }
                 %>
                 </table>
				 <div class="w3-center">
                 <ul class="pagination" style="margin-bottom: 9em;">
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
                    <li><a href="index.jsp?section=deliver_view.jsp&currentPage=1&product_name=<%=req_product_name%>&input_date=<%=input_date%>">처음</a></li>
                 <%
                 }
                 
                 if(startPage>1){
                 %>
                    <li><a href="index.jsp?section=deliver_view.jsp&currentPage=<%=startPage-countPage%>&product_name=<%=req_product_name%>&input_date=<%=input_date%>">이전</a></li>
                 <%
                 }
                 
                 for(int i = startPage; i <= endPage; i++){
                 %>
                 <li><a href="index.jsp?section=deliver_view.jsp&currentPage=<%=i%>&product_name=<%=req_product_name%>&input_date=<%=input_date%>"><%=i%></a></li>
                 <%
                 }
                 if(endPage!=totalPage){
                 %>
                 <li><a href="index.jsp?section=deliver_view.jsp&currentPage=<%=startPage+countPage%>&product_name=<%=req_product_name%>&input_date=<%=input_date%>">다음</a></li>
                 <%
                 }
                 if(endPage!=totalPage){
                 %>
                 <li><a href="index.jsp?section=deliver_view.jsp&currentPage=<%=totalPage%>&product_name=<%=req_product_name%>&input_date=<%=input_date%>">끝</a></li>
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