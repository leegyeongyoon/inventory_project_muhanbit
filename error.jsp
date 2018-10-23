<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isErrorPage="true"%>
<%
	//200 - 브라우저 처리코드
	response.setStatus(200);
	String i = exception.getMessage().trim();
	if (i.substring(0, 9).equals("Duplicate")) {
		out.print("<script>alert('중복되는 값이 입력되었습니다. 데이터를 다시 입력해주세요'); history.back(-1);</script>");
	} 
	else if(i.substring(0, 51).equals("Cannot delete or update a parent row: a foreign key")){
		out.print("<script>alert('데이터가 있는 장비는 삭제 하실 수 없습니다.'); history.back(-1);</script>");
	}
	else if(i.equals("Data truncation: Data too long for column 'serial_number' at row 1")){
		out.print("<script>alert('시리얼번호가 너무 깁니다.'); history.back(-1);</script>");
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





