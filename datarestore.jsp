<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	try{

	String cmdline = "mysqldump -u root -pmuhanbit inventory_control_muhanbit_db >dump.txt";
	Process exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","mysql -u root -pmuhanbit inventory_control_muhanbit_db --default-character-set utf8 < C:/dump.txt"});
	
}
	catch(Exception e){
		
		e.printStackTrace();
	}
%>
</body>
</html>
	