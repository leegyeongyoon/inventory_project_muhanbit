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

a {
   color: blue;
}
</style>
</head>
<body>
      <div class="w3-section" style="height: 100%;">
                <div class="w3-center">
                <div class="w3-center w3-padding-32" id="contact" style="margin-bottom: 3em; margin-top: 60px;">
                    <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">데이터 엑셀 파일로 생성</span>
                </div>
         <% try{
            
        
            Process  exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\inventorystate.csv"});
                     exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\inventorylist.csv"});
                     exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\deliverlist.csv"});
               
                Thread.sleep(1000);
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
                       "root", "muhanbit");
                 
                 String inventorystatesql = "SELECT * INTO OUTFILE 'C:/Temp/inventorystate.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM inventory_tbl order by input_date DESC";
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
                String originalName[] ={"inventorystate.csv" , "inventorylist.csv" , "deliverlist.csv"};
                String fileName[] ={"inventorystate.csv" , "inventorylist.csv" , "deliverlist.csv"};  
                // 파일 타입 정보를 가져옴

                //File file1 = new File("C:/Temp/inventorystate.csv");
                //File file2 = new File("C:/Temp/inventorylist.csv");
                //File file3 = new File("C:/Temp/deliverlist.csv");
                  
        %>
        <table class="table" style="margin-bottom: 80px;">
            <thead>
              <tr>
                <th style="text-align: center;">엑셀 데이터 유형</th>
                <th style="text-align: center;">파일 다운로드</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>현재 재고 목록 데이터</td>
                <td><a id="down1" href="#"><%=originalName[0]%></a></td>
              </tr>
              <tr>
                <td>재고 내역 데이터</td>
                <td><a id="down2" href="#"><%=originalName[1]%></a></td>
              </tr>
              <tr>
                <td>재고 납품 데이터</td>
                <td><a id="down3" href="#"><%=originalName[2]%></a></td>
              </tr>
            </tbody>
          </table> 
        
        <button type="button" class="btn btn-danger col-sm-12" data-toggle="collapse" data-target="#demo" style="margin-bottom: 2em;">엑셀 파일 생성중 한글이 깨질 때 버튼을 눌러 주세요</button>
          <div id="demo" class="collapse">
          <div class="thumbnail" style="margin-top: 80px;">
              <img src="<%=request.getContextPath()%>/img/charset.png" style="width:90%; height:400px;">
              <div class="caption">
                <p style="font-size: 14pt;font-weight: bold;">다운받은 엑셀파일 경로에 들어가 있는 엑셀 파일 중 한글이 깨지는</p>
                <p style="font-size: 14pt;font-weight: bold;">엑셀 파일을 오른쪽 클릭 후 [연결 프로그램 - 메모장]으로 파일을 열어 주십시오.</p>
              </div>
          </div>
          <div class="thumbnail" style="margin-top:10px;">
             <img src="<%=request.getContextPath()%>/img/charset2.png" style="width:90%; height:400px;">
              <div class="caption">
                <p style="font-size: 14pt;font-weight: bold;">메모장에서 [파일 - 다른 이름으로 저장]을 눌러 줍니다.</p>
              </div>
          </div>
          <div class="thumbnail" style="margin-top:10px;">
            <img src="<%=request.getContextPath()%>/img/charset3.png" style="width:90%; height:400px;">
              <div class="caption">
                <p style="font-size: 14pt;font-weight: bold;">제일 아래 부분에 인코딩을 ANSI로 바꿔 주신 후 저장을 해 줍니다.</p>
                <p style="font-size: 14pt;font-weight: bold;">저장 하신 후 파일을 다시 열어 주시면 한글이 깨지지 않는 파일을 보실 수 있으십니다.</p>
              </div>
          </div>
          </div>
    <script type="text/javascript">
        // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
        // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
        document.getElementById("down1").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName[0]%>");
                    // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
                    window.location.href = "excelfileDownload.jsp?file_name=" + fName;
                });
        
        document.getElementById("down2").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName[1]%>");
                    // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
                    window.location.href = "excelfileDownload.jsp?file_name=" + fName;
                });
        
        document.getElementById("down3").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName[2]%>");
                    // 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
                    window.location.href = "excelfileDownload.jsp?file_name=" + fName;
                });
    </script>
    </div>
    </div>
    </div>
	<% 
         
    }    
         catch(Exception e){
             e.printStackTrace(); 
         }   
  %>  
</body>
</html>


             
         
         






