<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.io.File"%>
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
<body>

         <%	try{
        	
        
        	Process  exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\inventorystate.csv"});
        			 exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\inventorylist.csv"});
		        	 exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\deliverlist.csv"});
				System.out.println("dd");
            	Thread.sleep(1000);
				 Class.forName("com.mysql.jdbc.Driver");
	             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
	                   "root", "muhanbit");
	             
	             String inventorystatesql = "SELECT * INTO OUTFILE 'C:/Temp/inventorystate.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM inventory_tbl";
	             String inventorylistsql = "SELECT * INTO OUTFILE 'C:/Temp/inventorylist.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM inventory_list_tbl";
	             String deliversql = "SELECT * INTO OUTFILE 'C:/Temp/deliverlist.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM deliver_serial_tbl";
	             out.println();
	             PreparedStatement pstmt = conn.prepareStatement(inventorystatesql);
	             pstmt.executeQuery();      
	             pstmt = conn.prepareStatement(inventorylistsql);
	             pstmt.executeQuery();
	             pstmt = conn.prepareStatement(deliversql);
	             pstmt.executeQuery();
	                         
	             
	             
	             pstmt.close();
	             conn.close();


		         
	             
	          	// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	          	//String file1 = "C:/dump.txt"; // 파일 input에 지정한 이름을 가져옴
	          	// 그에 해당하는 실재 파일 이름을 가져옴
	          	String originalName1 = "inventorystate.csv";
	          	String fileName1 = "inventorystate.csv";
	          	
	          	String originalName2 = "inventorylist.csv";
	          	String fileName2 = "inventorylist.csv";
	          	
	          	String originalName3 = "deliverlist.csv";
	          	String fileName3 = "deliverlist.csv";
	          	// 파일 타입 정보를 가져옴

	          	File file1 = new File("C:/Temp/inventorystate.csv");
	          	File file2 = new File("C:/Temp/inventorylist.csv");
	          	File file3 = new File("C:/Temp/deliverlist.csv");
	              
        %>
         
   
   
   파일 다운로드 :
	<a id="down1" href="#"><%=originalName1%></a>
	<a id="down2" href="#"><%=originalName2%></a>
	<a id="down3" href="#"><%=originalName3%></a>
	
	
	* 엑셀 파일 생성중 한글이 깨질 때 *
	<img alt="" src="C:\\Temp\\charset.png">
	<img alt="" src="C:\\Temp\\charset2.png">
	<img alt="" src="C:\Temp\charset3.png">
	<script type="text/javascript">
        // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
        // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
        document.getElementById("down1").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName1%>");
					// 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
					window.location.href = "excelfileDownload.jsp?file_name=" + fName;
				});
        
        document.getElementById("down2").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName2%>");
					// 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
					window.location.href = "excelfileDownload.jsp?file_name=" + fName;
				});
        
        document.getElementById("down3").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName3%>");
					// 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
					window.location.href = "excelfileDownload.jsp?file_name=" + fName;
				});
	</script>
  <%
	}
        	
           
         
         catch(Exception e){
        	
        	
        	 e.printStackTrace();
        	 
         }
         
  %>
    
</body>
</html>


             
         
         






