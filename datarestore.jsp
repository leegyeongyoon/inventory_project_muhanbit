<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import ="java.io.*" errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	

	
	Process exec = Runtime.getRuntime().exec(new String[]{"cmd.exe","/c","mysql -u root -pmuhanbit inventory_control_muhanbit_db --default-character-set utf8 < C:/dump.txt"});
	Thread.sleep(5000);
	out.println("<script> location.href='index.jsp';</script>");

	
%>
</body>
</html>
	