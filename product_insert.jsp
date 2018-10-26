<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
  <div class="w3-center w3-padding-32" id="contact" style="margin-top: 89px;">
    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">장비 등록</span>
  </div>
  <form class="w3-container" method="post" action="product_insert_ok.jsp" id="product_insertform">
    <div class="w3-section">
     <label>카테고리</label>
      <div class="form-group row">
      <div class="col-xs-5" style="padding-right: 10px;">
		<select name="category" id="category" class="form-control">
						<option value="nocategorychecked">선택 안함</option>

						<%
								//드라이버 로드
								String product_name = "";
								Class.forName("com.mysql.jdbc.Driver");
								Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db", "root", "muhanbit");
								Statement stmt = conn.createStatement();
								ResultSet rs = stmt.executeQuery("SELECT category  FROM product_tbl GROUP BY category ORDER BY category ASC");
								while (rs.next()) {
									String category = rs.getString(1);
						%>
						<option value="<%=category%>"><%=category%></option>
						<%
							}
								rs.close();
								stmt.close();
								conn.close();
						
						%>
				</select>
		</div>
		<div class="col-xs-5" style="padding-left: 0;">
			<input type="text" class="w3-input w3-border w3-hover-border-black" style="width:100%;" name="category" id="category2" maxlength="20">
		</div>
    </div>
    </div>
   <div class="w3-section">
     <label>물건명</label>
      <input type="text" class="w3-input w3-border w3-hover-border-black" style="width:100%;" name="product_name" id="product_name"  maxlength="20">
    </div>
    <input type="button" class="w3-button w3-block w3-black w3-col s12" style="margin-bottom: 3em;" value="등록" onclick="product_insert_validation_check()">
  </form>
  <script type="text/javascript" src="validate.js"></script>
  </div>
</body>
</html>