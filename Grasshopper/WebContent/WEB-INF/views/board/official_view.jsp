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
				<form action="/official/comment" method="post" name="cmtForm">
					<textarea name="content" id="" placeholder="내용을 입력해주세요"></textarea>
					<input type="hidden" name="board_no" value="${param.official_no }">
					<input type="submit" name="" id="" value="댓글달기" />
				</form>
			</div>
			<div class="comment-loaded">
				<c:forEach var="c" items="${comments }">
					<div class="comment">
						<div class="comment">
							닉네임 : ${c.user_nickname } <br>
							댓글내용: ${c.official_reply_content }<br>
							작성일시: ${c.official_reply_date }<br>
						</div>
					</div>
				</c:forEach>
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