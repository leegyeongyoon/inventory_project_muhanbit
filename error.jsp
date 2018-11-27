<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%
	//200 - 브라우저 처리코드
	response.setStatus(200);
	String i = exception.getMessage().trim();
	
	
	if (i.substring(0, 9).equals("Duplicate")) {
		out.print("<script>alert('중복되는 값이 입력되었습니다. 데이터를 다시 입력해주세요'); history.back(-1);</script>");
	} 
	else if(i.substring(0, 16).equals("Unknown database")){
		out.print("<script>alert('데이터베이스가 없습니다. 데이터베이스까지 복구하는 백업을 받으시기바랍니다..'); history.back(-1);</script>");
	}
	else if(i.substring(0, 51).equals("Cannot delete or update a parent row: a foreign key")){
		out.print("<script>alert('데이터가 있는 장비는 삭제 하실 수 없습니다.'); history.back(-1);</script>");
	}
	
	else if(i.substring(0,41).equals("Data truncation: Data too long for column")){
		out.print("<script>alert('데이터가가 너무 깁니다.'); history.back(-1);</script>");
	}
	
	else if(i.substring(0,37).equals("Data truncation: Incorrect date value")){
		out.print("<script>alert('날짜가 너무 말도안됩니다!!!!!'); history.back(-1);</script>");
	}
	
	else if(i.substring(i.length()-13, i.length()).equals("doesn't exist")){
		out.print("<script>alert('테이블이 없습니다.'); history.back(-1);</script>");
	}
	else if(i.substring(55,70).equals("database exists")){
		out.print("<script>alert('데이터베이스가 이미 있으니 데이터만 복구해주세요'); history.back(-1);</script>");
	}
	else {
%>
<script>
		alert("<%=exception.getMessage()%> 에러로 인해 작업이 처리되지않았습니다.");
	history.back(-1);
</script>
<%
	}
%>
 


