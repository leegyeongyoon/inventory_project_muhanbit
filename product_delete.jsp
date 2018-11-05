<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body>
  <div class="w3-center w3-padding-32" id="contact" style="margin-top: 36px;">
    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">장비 삭제</span>
  </div>
  <form class="w3-container" method="post" action="product_delete_ok.jsp" id="product_deleteform">
    <div class="w3-section">
     <label>삭제 목록 선택</label><br/>
    	<input type="radio" value="2" name="choose_delect" onclick="choose_delete()" checked="checked">물품 삭제
     	<input type="radio" value="1" name="choose_delect" onclick="choose_delete()" style="margin-left: 20px;">카테고리 삭제
    </div>
     <div class="w3-section">
     <label>카테고리</label>
      <div class="form-group">
		<select name="category" id="category" onclick="javascript:findproname(this);" class="form-control">
					<option value="nocategorychecked">선택 안함</option>
					<%
				    //드라이버 로드
				    String product_name ="";
				    Class.forName("com.mysql.jdbc.Driver");
				    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db","root","muhanbit");
				    PreparedStatement pstmt  = conn.prepareStatement("SELECT category  FROM product_tbl GROUP BY category ORDER BY category ASC");
				    ResultSet rs =  pstmt.executeQuery();
				    while(rs.next()){
				    	String category = rs.getString(1);
				%>
									<option value="<%=category%>"><%=category %></option>			
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
     <label>물건명</label>
      <div class="form-group">
			<select name="product_name" id="product_name" class="form-control"></select>
		</div>
    </div>
    <input type="submit" class="w3-button w3-block w3-black w3-col s12" style="margin-bottom: 3em;" value="삭제">
  </form>
  <script type="text/javascript" src="validate.js"></script>
  </div>
</body>
</html>