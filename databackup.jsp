<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.io.File"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일체크 JSP 페이지</title>
</head>
<body>
	
	<%
	// post방식에 대한 한글 인코딩 방식 지정 get방식은 서버의 server.xml에서 Connector태그에 URIEncoding="UTF-8" 추가

	String cmdline = "mysqldump -u root -pmuhanbit inventory_control_muhanbit_db >dump.txt";
	Process exec = Runtime.getRuntime().exec(new String[]{"cmd.exe", "/c",
			"mysqldump -u root -pmuhanbit inventory_control_muhanbit_db --default-character-set utf8 > C:/dump.txt"});

	// form 태그에서 <input type="file" name="여기에 지정한 이름" />을 가져온다.
	String file1 = "C:/dump.txt"; // 파일 input에 지정한 이름을 가져옴
	// 그에 해당하는 실재 파일 이름을 가져옴
	String originalName1 = "dump.txt";
	String fileName1 = "dump.txt";
	// 파일 타입 정보를 가져옴

	File file = new File("C:/dump.txt");
%>
	<div class="w3-section" style="height: 320px;">
	<div class="w3-center">
	<div class="w3-center w3-padding-64" id="contact">
		<span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16">백업 파일 확인</span>
	</div>
	<span style="font-size: 15pt; font-weight: bold;">파일 다운로드 : </span>
	<a id="downA" href="#" style="font-size: 15pt;"><%=originalName1%></a>
	<script type="text/javascript">
        // 영문파일은 그냥 다운로드 클릭시 정상작동하지만 한글파일명을 쿼리문으로 날릴경우 인코딩 문제가 발생할 수 있다. 한글이 깨져 정상작동하지 않을 수 있음
        // 따라서, 쿼리문자열에 한글을 보낼 때는 항상 인코딩을 해서 보내주도록 하자.
        document.getElementById("downA").addEventListener("click", function(event) {
            event.preventDefault(); // a 태그의 기본 동작을 막음
            event.stopPropagation(); // 이벤트의 전파를 막음
            // fileName1을 utf-8로 인코딩한다.
            var fName = encodeURIComponent("<%=fileName1%>");
					// 인코딩된 파일이름을 쿼리문자열에 포함시켜 다운로드 페이지로 이동
					window.location.href = "backupfileDownload.jsp?file_name=" + fName;
				});
	</script>
	</div>
	</div>
	</div>
</body>
</html>


