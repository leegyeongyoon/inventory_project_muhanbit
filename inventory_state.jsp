<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
html,body,h1,h2,h3,h4 {font-family:"Lato", sans-serif}
.mySlides {display:none}
.w3-tag, .fa {cursor:pointer}
.w3-tag {height:15px;width:15px;padding:0;margin-top:6px}
table, tr, th, td {text-align: center;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
   $(document).ready(function(){
       $("#toggle_but").click(function(){
           $("#toggle").toggle();
           $("#toggle1").toggle();
       });
   });   
   
   $(document).ready(function(){
       $("#checkall").click(function(){
          if($("input[name=deliver]").prop("checked")){
             $("input[name=deliver]").prop("checked",false);
           }else{
               $("input[name=deliver]").prop("checked",true);
              }
          });
       })

</script>
</head>
<body>
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
   <script type="text/javascript" src="validate.js"></script>
  <div class="w3-center w3-padding-32" id="contact" style="margin-top: 55px;">
    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">현재 재고 목록</span>
  </div>
  <form class="w3-container" method="get" name="product_state_form" id="product_state_form">
    <div class="w3-section">
    <div class="form-group row">
      <div class="col-xs-6" style="padding-left: 15px;">
      <label>카테고리</label>
      <select name="category" onclick="javascript:findproname(this);" class="form-control">
            <option value=" "></option>
            <%
                  String str[];
                  //드라이버 로드
                  String product_name = "";
                  Class.forName("com.mysql.jdbc.Driver");
                  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db", "root", "muhanbit");
                  PreparedStatement pstmt = conn.prepareStatement("SELECT category  FROM product_tbl GROUP BY category");
                  ResultSet rs = pstmt.executeQuery();
                  while (rs.next()) {
                     String category = rs.getString(1);
            %>
            <option value="<%=category%>"><%=category%></option>
            <%
               }
                  rs.close();
                  pstmt.close();
                  conn.close();
            %>
         </select>
      </div>
      <div class="col-xs-6" style="padding-left: 0;">
      <label>물품명</label>
         <select name="product_name" id="product_name" onclick="javascript:findinventory_state(this);" class="form-control"></select>
      </div>
    </div>
    </div>
    <div class="w3-section">
        <div class="w3-center">
           <button type="button" class="btn btn-default col-md-12" id="checkall">전체 선택/해제</button>
        </div>
    <table class="table" style="margin: 50px 0px;" id="product_state_table">
      <thead class='thead-dark'>
      <tr>
        <th style="text-align: center;">선택 </th>
      <th style="text-align: center;">카테고리</th>
      <th style="text-align: center;">물건명</th>
      <th style="text-align: center;">시리얼번호</th>
      <th style="text-align: center;">MacAddress</th>
      <th style="text-align: center;">입고일</th>
      <th style="text-align: center;">기타사항</th>
      </tr>
    </thead>
    </table>
    </div>
     <input type="button" class="w3-button w3-block w3-black w3-col s12" style="margin-bottom: 3em;" value="납품/삭제" id="toggle_but">
    <div class="w3-section" id="toggle" style="display: none;">
      <label>납품 날짜</label>
      <input class="w3-input w3-border w3-hover-border-black" style="width:100%; margin-bottom: 1em;" type="date" name="output_date" id="output_date">
      <label>납품 회사</label>
         <input class="w3-input w3-border w3-hover-border-black" style="width:100%; margin-bottom: 1em;" type="text" name="company" id="company">
     </div>
  </form>
   <div class="w3-section" id="toggle1" style="display: none;">
    <input type="button" class="w3-button w3-block w3-black w3-col s4" style="margin-bottom: 3em;" value="납품하기" onclick="deliver()">
    <input type="button" class="w3-button w3-block w3-black w3-col s4" style="margin-bottom: 3em;" value="삭제하기" onclick="delete_validation_check()">
    <input type="button" class="w3-button w3-block w3-black w3-col s4" style="margin-bottom: 3em;" value="메인으로" onclick="location.href = 'index.jsp'">
 </div>
  <script type="text/javascript" src="validate.js"></script>
  </div>
</body>
</html>