<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>    
<link rel="stylesheet" type="text/css" href="/resources/css/cards.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
      rel="stylesheet">
      
<br><br><br><br><br>

<!-- 검색창 -->
<div class="search-bar">
	<form name="searchForm" action="/official/list" method="get">
	<select id="category" name="category" value="${category }">
   		<option value="all">전체</option>
   		<option value="name">이름</option>
   		<option value="detail">내용</option>
   		<option value="ingred">재료</option>
  	</select>
	<input type="text" name="search" value="${search }" autocomplete="off" 
	id="search" placeholder="검색어를 입력하세요">
	<input type="submit" id="btnSearch" value="찾기">
	</form>
</div>


<div class="main">

<!-- 카드보드형태 -->
<div class="cards" id="card">
	<c:forEach var="o" items="${list }">
	<div class="card">
	<div class="card_image">
		<img src="/resources/img/official_cocktail/official_cocktail_${o.official_cocktail_no }.jpg" />
	</div>
	<div class="card_title">
		<c:set var="cocktail_title" value="${fn:split(o.official_cocktail_name,',')}" />
		<a class="card_title_eng">${ cocktail_title[0]}</a><br>
		<a class="card_title_kor">${ cocktail_title[1]}</a>
	</div>
	<div class="card_desc">
		<p>${o.official_cocktail_detail }</p>
	</div>
	<div class="card_info">
		<div class="card_viewcount">
			<span class="material-icons">visibility</span><a style="margin-left:5px;">${o.official_cocktail_hit }</a>
		</div>
		<div>
			<a class="card_link" href="/official/view?official_no=${o.official_cocktail_no }">Read More...</a>
		</div>
	</div>
	</div>
	</c:forEach>
</div>
</div>
<div class="space" style="height:20px;display:inline-block;"></div>
<style>
footer {
	position: sticky !important;
}
</style>
<c:import url="/WEB-INF/views/layout/official_paging.jsp" />
<c:import url="/WEB-INF/views/layout/footer.jsp" />    