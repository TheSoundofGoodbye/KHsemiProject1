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

	<div>
		<div class="title_container">
			<h1 class="entry-title">${viewOfficial.official_cocktail_name }</h1>
			<p class="et_pb_title_meta_container">
				<a href="https://iba-world.com/category/iba-cocktails/"
					rel="category tag">IBA Cocktail</a>
			</p>
		</div>
	</div>
	<div>
		<div class="body_container">
			<h3 class="semi_title">
				INGREDIENTS
			</h3>
			<c:forEach var="split"
				items="${fn:split(viewOfficial.official_cocktail_ingred,',') }">
					${split } <br>
			</c:forEach>
			<h3 class="semi_title">
				METHOD
			</h3>
			<p>${viewOfficial.official_cocktail_detail }</p>
		</div>
		<div class="text-center">
			<button id="btnList" class="btn">목록</button>
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