<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	td {
		padding: 5px 5px;
	}
</style>
</head>
<body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.js" integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE=" crossorigin="anonymous"></script>
  <div class="w3-center w3-padding-32" id="contact">
    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">재고 등록</span>
  </div>
  <form class="w3-container" method="get" action="inventory_insert_ok.jsp" id="inventory_insertform">
    <div class="w3-section">
     <label>카테고리</label>
      <div class="form-group">
      <select name="category" onclick="javascript:findproname(this);" class="form-control">
				<option value="1"></option>
						<%
								//드라이버 로드
								String product_name = "";
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db", "root", "muhanbit");
								PreparedStatement pstmt = conn.prepareStatement("SELECT category  FROM product_tbl GROUP BY category ORDER BY category ASC");
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
    </div>
    <div class="w3-section">
     <label>물품명</label>
      <div class="form-group">
		<select name="product_name" id="product_name" class="form-control">
		</select>
	</div>
    </div>
    <div class="w3-section">
     <label>재고량</label>
     <input type="number" min="1" max="999" name="inventory"id="inventory" onchange="inventory_list()" class="w3-input w3-border w3-hover-border-black" style="width:100%;">
    </div>
    <div class="w3-section">
      <label>입고일</label>
      <input class="w3-input w3-border w3-hover-border-black" style="width:100%;" type="date" name="input_date" id="input_date" >
    </div>
   <div class="w3-section">
     <label>기타사항</label>
      <input type="text" class="w3-input w3-border w3-hover-border-black" style="width:100%;" name="other_information" id="other_information" maxlength="50">
    </div>
  <div class="w3-center w3-padding-10 w3-maring-10" id="contact">
    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">시리얼 번호 입력</span>
  </div>
  <table class="table" style="text-align: center;margin-top: 2em; margin-bottom: 2em;">
		<thead class="thead-dark">
			<tr>
				<th style="text-align: center;">시리얼 번호</th>
				<th style="text-align: center;">Mac주소</th>	
				<th style="text-align: center;">시리얼 번호</th>
				<th style="text-align: center;">Mac주소</th>	
				<th style="text-align: center;">시리얼 번호</th>
				<th style="text-align: center;">Mac주소</th>	
			</tr>
		</thead>
		<tbody id="serial_number">
		
		</tbody>
		</table>
  <input type="button" class="w3-button w3-block w3-black w3-col s12" style="margin-bottom: 3em;" value="등록" onclick="validation_check()">
  </form>
  <script type="text/javascript" src="validate.js"></script>
  </div>
</body>
</html>