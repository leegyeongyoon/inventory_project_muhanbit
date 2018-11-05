<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" errorPage="error.jsp"%>
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
   color: lightgray;
}
</style>
</head>
<body style="height: 100%;">
   <div class="w3-center w3-padding-64" id="contact">
      <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">재고
         내역</span>
   </div>
   <table class="table" style="margin-bottom: 2em; text-align: center;">
      <thead class="thead-dark">
         <tr>
				<th style="text-align: center;">카테고리</th>
				<th style="text-align: center;">물건명</th>
				<th style="text-align: center;">재고량</th>
				<th style="text-align: center;">납품량</th>
				<th style="text-align: center;">입고일</th>
				<th style="text-align: center;">납품일</th>
				<th style="text-align: center;">납품회사</th>
				<th style="text-align: center;">시리얼 보기</th>
			</tr>
      </thead>
      <tbody>
         <%
            int totalCount = 0;
            //드라이버 로드
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
                  "root", "muhanbit");
            
            String totalsql = "SELECT count(*) , product_name , input_date from inventory_list_tbl group by product_name , input_date";
            PreparedStatement totalstem = conn.prepareStatement(totalsql);
            ResultSet totalrs = totalstem.executeQuery();
            
            while(totalrs.next()){
               totalCount = totalrs.getRow();
            }// 전체 행 가져오는 쿼리문
            
            int currentPage = 1; // 현재 페이지
            if(request.getParameter("currentPage")!=null){
               currentPage = Integer.parseInt(request.getParameter("currentPage"));
            }// 만약 현재 페이지에 값이 들어가서 넘어온다면 현재 페이지를 그 페이지로 설정해준다.
            
            int countList = 10; // 한 페이지에 보여줄 글 수
            
            String listSql = "SELECT p.category,i.product_name ,   SUM(i.inventory) ,i.input_date  AS input_date , i.output_date , deliver,company FROM product_tbl p INNER JOIN inventory_list_tbl i ON p.product_name =  i.product_name GROUP BY input_date,i.product_name, output_date ORDER BY seq DESC LIMIT ?, ?";
            PreparedStatement liststem = conn.prepareStatement(listSql);
            liststem.setInt(1,(currentPage-1)*countList);
            liststem.setInt(2, countList);
            ResultSet listrs = liststem.executeQuery();

            while (listrs.next()) {
               String category = listrs.getString(1);
               String produc_name = listrs.getString(2);
               String inventory = listrs.getString(3);
               String input_date = listrs.getString(4);
               String output_date = listrs.getString(5);
               String deliver = listrs.getString(6);
               String company = listrs.getString(7);
               
               String product_name_chiwan = produc_name.replaceAll("'", "&#39;");
         %>
         <tr>
            <td><%=category%></td>
            <td><%=produc_name%></td>
            <td><%=inventory%></td>
            <td><%=deliver%></td>
            <td><%=input_date%></td>
            <td><%=output_date%></td>
            <td><%=company%></td>
            <td><a  style="color: blue ; text-decoration: underline;" href='index.jsp?section=deliver_view.jsp&product_name=<%=product_name_chiwan%>&input_date=<%=input_date%>&currentPage=1'>납품 시리얼 보기</a></td>
         </tr>
         </tbody>
         <%
            }
         %>
         </table>
         <div class="w3-center">
         <ul class="pagination" style="margin-bottom: 8em;">
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
            <li><a href="index.jsp?section=inventory_list.jsp&currentPage=1">처음</a></li>
         <%
         }
         
         if(startPage>1){
         %>
            <li><a href="index.jsp?section=inventory_list.jsp&currentPage=<%=startPage-countPage%>">이전</a></li>
         <%
         }
         
         for(int i = startPage; i <= endPage; i++){
         %>
         <li><a href="index.jsp?section=inventory_list.jsp&currentPage=<%=i%>"><%=i%></a></li>
         <%
         }
         if(endPage!=totalPage){
         %>
         <li><a href="index.jsp?section=inventory_list.jsp&currentPage=<%=startPage+countPage%>">다음</a></li>
         <%
         }
         if(endPage!=totalPage){
         %>
         <li><a href="index.jsp?section=inventory_list.jsp&currentPage=<%=totalPage%>">끝</a></li>
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