<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="w3-panel">
    <h1><b>장비 관리 프로그램</b></h1>
    <p>Object Management Program</p>
  </div>
  <div class="w3-container">
    <div class="w3-display-container mySlides">
      <img src="<%=request.getContextPath()%>/img/obj1.jpg" style="width:100%; height:350px;">
    </div>
    <div class="w3-display-container mySlides">
      <img src="<%=request.getContextPath()%>/img/obj2.jpg" style="width:100%; height:350px;">
    </div>
    <div class="w3-display-container mySlides">
      <img src="<%=request.getContextPath()%>/img/obj3.jpg" style="width:100%; height:350px;">
    </div>

    <!-- Slideshow next/previous buttons -->
    <div class="w3-container w3-dark-grey w3-padding w3-xlarge">
      <div class="w3-left" onclick="plusDivs(-1)"><i class="fa fa-arrow-circle-left w3-hover-text-teal"></i></div>
      <div class="w3-right" onclick="plusDivs(1)"><i class="fa fa-arrow-circle-right w3-hover-text-teal"></i></div>
    
      <div class="w3-center">
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(1)"></span>
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(2)"></span>
        <span class="w3-tag demodots w3-border w3-transparent w3-hover-white" onclick="currentDiv(3)"></span>
      </div>
    </div>
  </div>
  
  <!-- Grid -->
  <div class="w3-row w3-container">
    <div class="w3-center w3-padding-64" style="margin-top: 70px;">
      <span class="w3-xlarge w3-bottombar w3-border-dark-grey w3-padding-16" style="margin-top: 20px;">사용 설명서</span>
    </div>
    <div class="w3-col l3 m6 w3-light-grey w3-container w3-padding-16">
      <h3>장비 관리</h3>
      <p>장비 관리는 장비 추가와 장비 삭제 두개의 카테고리로 되어있습니다. 장비 추가에서는 장비의 목록을 추가할 수 있으며 장비 삭제에서는 현재 장비의 목록들과 삭제를 가능하게 합니다.</p>
    </div>

	<div class="w3-col l3 m6 w3-grey w3-container w3-padding-16">
      <h3>재고 관리</h3>
      <p>재고 관리는 재고 추가와 재고 목록 두개의 카테고리로 되어있습니다. 재고 추가에서는 처음 들어오는 재고를 등록하는 화면이고, 재고 목록은 현재 들어 와 있는 재고를 보여줍니다.</p>
    </div>
    
    <div class="w3-col l3 m6 w3-dark-grey w3-container w3-padding-16">
      <h3>재고 내역</h3>
      <p>재고 내역에서는 재고 입고 내역을 표 형태로 어떤 재고가 언제 몇 개가 들어왔는지 내역으로 보여주어 재고를 관리하고 재고가 입고된 정보를 찾고자 할 때 빠르고 편리하게 찾을 수 있습니다.</p>
    </div>

    <div class="w3-col l3 m6 w3-black w3-container w3-padding-16">
      <h3>검색 기능</h3>
      <p>재고 내역 중 어느 특정한 내역을 찾기 위해서 스크롤을 내리실 필요 없이 재고 내역 검색을 통해 키워드에 맞게 입력을 하여 필요한 재고 내역을 쉽고 빠르게 찾을 수 있도록 도와줍니다.</p>
    </div>
  </div>
  <div class="w3-center w3-padding-64" id="contact">
  </div>
</div>
<script>
// Slideshow
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function currentDiv(n) {
  showDivs(slideIndex = n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("demodots");
  if (n > x.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
     x[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
     dots[i].className = dots[i].className.replace(" w3-white", "");
  }
  x[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " w3-white";
}
</script>
</body>
</html>