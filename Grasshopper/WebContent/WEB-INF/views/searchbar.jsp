<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<c:import url="/WEB-INF/views/layout/header.jsp" />
<title>주변 bar검색하기</title>
<style>
.search-area {
	margin-top: 80px;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

</style>


<div class="search-area">
<form action="/">
<h1>주소로 bar 검색하기</h1>

 
  
 
<input type="text">

<button>검색</button>
</form>

</div>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
