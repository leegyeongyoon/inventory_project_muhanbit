<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="w3-top">
  <div class="w3-row w3-large w3-light-grey">

    <div class="w3-col s3" align="left">
    <div class="dropdown" align="center">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="background-color: #f1f1f1; border-color: #f1f1f1; color: black; font-size: 15pt; ">장비 관리</button>
    <ul class="dropdown-menu" style="text-align: center; width: 100%;">
      <li><a href="index.jsp?section=product_insert.jsp">장비 추가</a></li>
      <li><a href="index.jsp?section=product_delete.jsp">장비 삭제</a></li>
    </ul>
  </div>
    </div>
    <div class="w3-col s3" >
    <div class="dropdown " align="center">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="background-color: #f1f1f1; border-color: #f1f1f1; color: black; font-size: 15pt; ">재고 관리</button>
    <ul class="dropdown-menu w3-col s3" style="text-align: center; width: 100%;">
      <li><a href="index.jsp?section=inventory_insert.jsp">재고 추가</a></li>
      <li><a href="index.jsp?section=inventory_state.jsp">재고 목록</a></li>
    </ul>
 	 </div>
    </div>
    <div class="w3-col s3">
      <a href="index.jsp?section=inventory_list.jsp" class="w3-button w3-block">재고 내역</a>
    </div>
    ㄴㄴㄴㄴㄴ
     <div class="w3-col s3">
    <div class="dropdown " align="center">
    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown" style="background-color: #f1f1f1; border-color: #f1f1f1; color: black; font-size: 15pt; ">백업 관리</button>
    <ul class="dropdown-menu w3-col s3" style="text-align: center; width: 100%;" >
      <li><a href="index.jsp?section=databackup.jsp" class="w3-button w3-block">백업파일 생성</a></li>
      <li><a href="index.jsp?section=restore.jsp" class="w3-button w3-block">데이터 복구</a></li>
      <li><a href="index.jsp?section=restore.jsp" class="w3-button w3-block">데이터 엑셀 파일로 생성</a></li>
  
    </ul>
 	 </div>
    </div>
    
   
    
    
  </div>
</div>


</body>
</html>