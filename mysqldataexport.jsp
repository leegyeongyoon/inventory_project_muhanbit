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
   color: lightgray;
}
</style>
</head>
<body>

         <%	try{
        	
        
        	Process exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\inventorylist.csv"});
        	exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\inventorystate.csv"});
        	exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","del /q C:\\Temp\\deliver_list.csv"});

        	System.out.println(exec);
            
        	}
        	
           
         
         catch(Exception e){
        	 e.printStackTrace();
         }
        finally{
        	 Class.forName("com.mysql.jdbc.Driver");
             Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_control_muhanbit_db",
                   "root", "muhanbit");
             
             String inventorystatesql = "SELECT * INTO OUTFILE 'C:/Temp/inventorystate.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM inventory_list_tbl";
             String inventorylistsql = "SELECT * INTO OUTFILE 'C:/Temp/inventorylist.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM inventory_tbl";
             String deliversql = "SELECT * INTO OUTFILE 'C:/Temp/deliver_list.csv' FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '\"' LINES TERMINATED BY '\n' FROM deliver_serial_tbl";
             
             PreparedStatement pstmt = conn.prepareStatement(inventorystatesql);
             pstmt.executeQuery();      
             pstmt = conn.prepareStatement(inventorylistsql);
             pstmt.executeQuery();
             pstmt = conn.prepareStatement(deliversql);
             pstmt.executeQuery();
                         
             
             
             pstmt.close();
             conn.close();
         }
         
         %>
      </ul>
   </div>
   </div>
</body>
</html>








