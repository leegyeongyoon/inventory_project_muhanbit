<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="w3-section" style="height: 320px;">
	<div class="w3-center">
	<div class="w3-center w3-padding-32" id="contact" style="margin-bottom: 2em;">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">데이터 복구</span>
	</div>
	<div class="alert alert-warning" style="margin-bottom: 2em;">
	  <strong>정말 복구 하시겠습니까?</strong> 데이터 베이스 안에 데이터가 남아있을 그 데이터가 삭제 됨으로 유의 하시기 바랍니다.
	</div>
	<span style="font-size: 14pt;">dump.txt 파일을 c드라이브 안에 넣어두고서 실행해주시기 바랍니다.</span><br/>
	<span style="font-size: 14pt;">dump(1).txt 등으로 되어 있는 경우 dump.txt로 이름을 바꾼 후 C드라이브 안에 넣어주시기 바랍니다.</span><br/>
	<button type="button" class="btn btn-default col-sm-6" style="margin-top: 2em;" onclick="location.href='datarestore.jsp'">복구하기</button>
	<button type="button" class="btn btn-default col-sm-6" style="margin-top: 2em;" onclick="location.href='index.jsp'">취소</button>
	</div>
	</div>
	</div>
</body>
</html>