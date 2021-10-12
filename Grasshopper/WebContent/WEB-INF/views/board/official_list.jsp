<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/cards.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
      
</head>
<body>

<div class="main">

<!-- 카드보드형태 -->
<div class="cards">
	<c:forEach var="o" items="${list }">
	<div class="card">
	<div class="card_image">
		<img src="/resources/img/${o.official_cocktail_name }.jpg" />
	</div>
	<div class="card_title">
		<h3>${o.official_cocktail_name }</h3>
	</div>
	<div class="card_desc">
		<p>${o.official_cocktail_detail }</p>
	</div>
	<div class="card_info">
		<div>
			<i class="material-icons">thumb_up</i> ${o.official_cocktail_vote }
		</div>
		<div>
			<a class="card_link" href="/official/view?official_no=${o.official_cocktail_no }">Read More...</a>
		</div>
	</div>
	</div>
	</c:forEach>
</div>


</div>


</body>

<%-- 맨위로 버튼 --%>
<button id="topButton" onclick="toTheTop()">맨 위로</button>

<!-- 최상단으로 버튼 스크립트 -->
<script type="text/javascript">
var topButton = document.getElementById("topButton");
//스크롤 시 scrollFunction 동작
window.onscroll = function() {
	scrollFunction()	
};
//버튼이 나타나게 함
function scrollFunction(){
	console.log("You are scrolling!") //테스트용
	//스크롤을 통해 20줄 이상 내려가면 
	if(document.body.scrollTop > 20 || document.documentElement.scrollTop > 20 ){
		topButton.style.display = "block";	
	} else {
		topButton.style.display = "none";
	}
}
//화면 최상단으로 보내는 기능
function toTheTop(){
	window.scrollTo(0,0);
}
</script>

</html>