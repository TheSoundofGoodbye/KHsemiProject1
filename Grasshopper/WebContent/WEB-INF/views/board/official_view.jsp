<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="/resources/css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
      
</head>
<body>




	<div class="container">
	<div class="content-container">
		<div class="title-container">
			<h1 class="entry-title">${viewOfficial.official_cocktail_name }</h1>
			<p class="title-sub-container">
				추천수 : ${viewOfficial.official_cocktail_vote }
				
			</p>
		</div>
	</div>
	
	<div class="pic-container">
		<img src="/resources/img/${viewOfficial.official_cocktail_name }.jpg" />
	</div>
	
	<div>
		<div class="body-container">
			<h3 class="semi_title">
				새부사항
			</h3>
			<p>${viewOfficial.official_cocktail_detail }</p>
			<h3 class="semi_title">
				재료
			</h3>
			<c:forEach var="split"
				items="${fn:split(viewOfficial.official_cocktail_ingred,',') }">
					${split } <br>
			</c:forEach>
		</div>
		
		<div class="comment-container">
			<div class="comment-input">
				<textarea name="comment" id="" placeholder="내용을 입력해주세요"></textarea>
				<input type="submit" name="" id="" value="댓글달기" />
			</div>
			<div class="comment-loaded">
			</div>
		</div>
		
		<div class="text-center">
			<button id="btnList" class="btn">목록으로</button>
		</div>
	</div>
	</div>

<script>
document.getElementById("btnList").addEventListener("click", goList);

function goList() {
	location.href = "/official/list";
}
</script>

</body>
</html>