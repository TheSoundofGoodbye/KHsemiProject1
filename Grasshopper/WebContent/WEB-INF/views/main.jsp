<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

$(document).ready(function(){

	$("#btnSearch").click(function() {
		
		//버튼에 submit()기능 부여
		$("form").submit();
		
	})
	
})
</script>

</head>
<body>
<!-- 검색창 부분 -->
<div>
	<form action="/official/list" method="get">
	<label>검색어 : 
		<input type="text" name="searchKeyword" /> 
	</label>
	</form>
</div>
<div>	
	<button type="button" id="btnSearch" class="">검색</button>
</div>

<div class="main-content">
	<div class="grid-container">
		<div class="grid">
				<div class="imgBox-container">
					<a href="/official/recipe/1/martini" class=""> <img
						src="imgofmartini" class="imgBox" alt="Shaken, not stirred">
					</a>
				</div>
			</div>
	</div>
</div>






</body>
</html>