<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>오늘 뭐 마시지</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/mainstyle.css">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
.carousel-inner>.carousel-item>img {
	width: 569px;
	height: 426.75px;
}
</style>


</head>
<body>
	<div class="wrap">
		<div class="intro_bg">
			<div class="header">
				<ul class="nav">
					<li>
						<div class="header_logo">
							<a href="/main"> <img width=100px;
								src='/resources/img/header_logo2.png' />
							</a>
						</div>
					</li>
					<li><a href="/official/main">칵테일 검색</a></li>
					<li><a href="/custom/main">칵테일 제작</a></li>
					<li><a href="/main">커뮤니티 게시판</a></li>
					<li><a href="/main">자유게시판</a></li>
					<li><a href="/main">쇼핑</a></li>
					<li><a href="/main">문의게시판</a></li>
					<c:if test="${not login }">
						<li>
							<div class="login">
								<form>
									<button class="btn btn-info">로그인</button>
								</form>
							</div>
							<div class="join">
								<button class="btn btn-warning">회원가입</button>
							</div>
						</li>
					</c:if>
				</ul>


				<c:if test="${login }">
					<div class="mypage">
						<button>마이페이지</button>
					</div>
					<div class="logout">
						<form>
							<button>로그아웃</button>
						</form>
					</div>
				</c:if>

			</div>
			<div class="video-area">
				<video class="video"  height="780px"
					src="/resources/video/cheers02.mp4" autoplay muted loop></video>
				<div class="search_area">
					<form name="searchForm" action="/official/list" method="get">
						<input type="text" name="search" value="${search }" autocomplete="off" 
							id="search" placeholder="search" />
							<input type="hidden" name="category" value="all">
						<input type="submit" id="btnSearch" value="찾기">
					</form>
				</div>
			</div>
			<!-- 			<div class="intro_text"> -->
			<!-- 			<h1>칵테일;</h1><br> -->
			<!-- 			<h4 class="contents1">칵테일 이름은 오래된 친구, 옛친구라는 의미이다.</h4> -->
			<!-- 			<h4 class="contents1">아메리칸 칵테일이기 때문에 라이 위스키를 사용하는 것이 좋다.</h4> -->
			<!-- 			<h4 class="contents1">라이 위스키가 없으면 캐나디안 위스키로 대용한다.</h4> -->
			<!-- 			<h4 class="contents1">식전에 마시는 아페리티프 칵테일로서 적합하다.</h4> -->
			<!-- 			</div> -->
		</div>
	</div>

	<!-- 		<ul class="amount"> -->
	<!-- 			<li> -->
	<!-- 				<div> -->
	<!-- 					<div class="contents1">분류</div> -->
	<!-- 					<div class="result">칵테일(Cocktail)</div> -->
	<!-- 				</div> -->
	<!-- 			</li> -->
	<!-- 			<li> -->
	<!-- 				<div> -->
	<!-- 					<div class="contents1">베이스</div> -->
	<!-- 					<div class="result">Whisky</div> -->
	<!-- 				</div> -->
	<!-- 			</li> -->
	<!-- 			<li> -->
	<!-- 				<div> -->
	<!-- 					<div class="contents1">맛</div> -->
	<!-- 					<div class="result">약간 단맛</div> -->
	<!-- 				</div> -->
	<!-- 			</li> -->
	<!-- 			<li> -->
	<!-- 				<div> -->
	<!-- 					<div class="contents1">알코올도수</div> -->
	<!-- 					<div class="result">27</div> -->
	<!-- 				</div> -->
	<!-- 			</li>			 -->
	<!-- 		</ul> -->

	<div class="main_text0">
		<h1>ABOUT US.</h1>
		<div class="contents"></div>

		<ul class="icons">
			<li>
				<div class="icon_img">
					<a href="/official/list"><img width="200px" src="/resources/img/002.png" /></a>
				</div>
				<div class="contents_bold">칵테일 검색</div>
				<div class="contents3">공식 칵테일 검색 페이지로 이동합니다</div>
				<div class="more" onclick="window.location.hash='/official/list'">MORE</div>
			</li>
			<li>
				<div class="icon_img">
					<a href="/custom/list"><img width="200px" src="/resources/img/004.png" /></a>
				</div>
				<div class="contents_bold">칵테일 제작</div>
				<div class="contents3">여러분의 칵테일 레시피를 공유해보세요</div>
				<div class="more" onclick="window.location.hash='/custom/list'">MORE</div>
			</li>
			<li>
				<div class="icon_img">
					<img width="200px" src="/resources/img/003.png" />
				</div>
				<div class="contents_bold">쇼핑</div>
				<div class="contents3">칵테일에 대한 모든 것을 쇼핑하실 수 있습니다</div>
				<div class="more" onclick="window.location.hash='#'">MORE</div>
			</li>
		</ul>
	</div>

	<div class="main_text1">
		<h1>BEST 칵테일 레시피</h1>
		<div class="contents1">이번주, 좋아요가 많은 칵테일 레시피.</div>
		<div class="service">
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
				integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
				crossorigin="anonymous"></script>
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
				integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
				crossorigin="anonymous"></script>
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
				integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
				crossorigin="anonymous"></script>
			<script> $('.carousel').carousel({interval: 2000 }) </script>
			<div class="photo_slide" style="width: 569px; height: 426.75px">
				<div id="demo" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<!-- 슬라이드 쇼 -->
						<div class="carousel-item active">
							<!--가로-->
							<img class="d-block w-100" src="/resources/img/junebug.jpg"
								alt="First slide">
							<div class="carousel-caption d-none d-md-block">
								<h5 style="color: #f0f4f5">준벅(June Bug)</h5>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="/resources/img/junebug.jpg"
								alt="Second slide">
							<div class="carousel-caption d-none d-md-block">
								<h5 style="color: #f0f4f5">준벅(June Bug)</h5>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="/resources/img/junebug.jpg"
								alt="Third slide">
							<div class="carousel-caption d-none d-md-block">
								<h5 style="color: #f0f4f5">준벅(June Bug)</h5>
							</div>
						</div>
						<!-- / 슬라이드 쇼 끝 -->
						<!-- 왼쪽 오른쪽 화살표 버튼 -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<!-- <span>Previous</span> -->
						</a> <a class="carousel-control-next" href="#demo" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<!-- <span>Next</span> -->
						</a>
						<!-- / 화살표 버튼 끝 -->
						<!-- 인디케이터 -->
						<ul class="carousel-indicators">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<!--0번부터시작-->
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>
						<!-- 인디케이터 끝 -->
					</div>
				</div>
			</div>
			<!-- 				<div class="contents3"> -->
			<!-- 					<h2>준벅 (June Bug)</h2> -->
			<!-- 					'6월의 벌레'라는 의미로, 초록의 싱그러운 색깔이 그야말로 여름벌레를 연상시킨다. -->
			<!-- 					<br>멜론, 바나나, 코코넛, 파인애플, 레몬 5가지 맛이 나는 도수가 낮은 달콤한 칵테일 -->
			<!-- 				</div> -->
		</div>
		<div class="main_text1">
			<h1>famous 칵테일 레시피</h1>
			<div class="contents1">이번주, 좋아요가 많은 일반인 레시피.</div>
			<div class="service">
				<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
					integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
					crossorigin="anonymous"></script>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
					integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
					crossorigin="anonymous"></script>
				<script
					src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
					integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
					crossorigin="anonymous"></script>
				<script> $('.carousel').carousel({ interval: 2000 }) </script>
				<div class="photo_slide" style="width: 569px; height: 426.75px">
					<div id="demo2" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner">
							<!-- 슬라이드 쇼 -->
							<div class="carousel-item active">
								<!--가로-->
								<img class="d-block w-100" src="/resources/img/junebug.jpg"
									alt="First slide">
								<div class="carousel-caption d-none d-md-block">
									<h5 style="color: #f0f4f5">준벅(June Bug)</h5>
								</div>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="/resources/img/junebug.jpg"
									alt="Second slide">
								<div class="carousel-caption d-none d-md-block">
									<h5 style="color: #f0f4f5">준벅(June Bug)</h5>
								</div>
							</div>
							<div class="carousel-item">
								<img class="d-block w-100" src="/resources/img/junebug.jpg"
									alt="Third slide">
								<div class="carousel-caption d-none d-md-block">
									<h5 style="color: #f0f4f5">준벅(June Bug)</h5>
								</div>
							</div>
							<!-- / 슬라이드 쇼 끝 -->
							<!-- 왼쪽 오른쪽 화살표 버튼 -->
							<a class="carousel-control-prev" href="#demo2" data-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<!-- <span>Previous</span> -->
							</a> <a class="carousel-control-next" href="#demo2" data-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<!-- <span>Next</span> -->
							</a>
							<!-- / 화살표 버튼 끝 -->
							<!-- 인디케이터 -->
							<ul class="carousel-indicators">
								<li data-target="#demo2" data-slide-to="0" class="active"></li>
								<!--0번부터시작-->
								<li data-target="#demo2" data-slide-to="1"></li>
								<li data-target="#demo2" data-slide-to="2"></li>
							</ul>
							<!-- 인디케이터 끝 -->
						</div>
					</div>
				</div>
			</div>
			<!-- 				<div class="contents3"> -->
			<!-- 					<h2>준벅 (June Bug)</h2> -->
			<!-- 					'6월의 벌레'라는 의미로, 초록의 싱그러운 색깔이 그야말로 여름벌레를 연상시킨다. -->
			<!-- 					<br>멜론, 바나나, 코코넛, 파인애플, 레몬 5가지 맛이 나는 도수가 낮은 달콤한 칵테일 -->
			<!-- 				</div> -->
		</div>

		<div class="main_text2">
			<ul>
				<li>
					<div>
						<h1>CONTACT</h1>
					</div>
					<div>1 : 1 문의 게시판</div>
					<div class="more2">더 알아보기</div>
				</li>
				<li><img src="/resources/img/cocktail_bg02.jpg"></li>
			</ul>
		</div>
	</div>


	<!-- 공지사항 -->
	<div class="popup">
		<h2>
			정기 구독 서비스 출시. <br>자세한 사항은 공지사항을 확인하세요.
		</h2>
		<br> <input type="checkbox" id="popup"> <label
			for="popup">하루 안보기</label>
		<button class="close">닫기</button>
	</div>

	<!-- 팝업 스크립트 불러오기 -->
	<script type="text/javascript" src="/resources/script/popup_cookie.js"></script>

</body>

<footer>
	<div class="footer_logo">
		<img width=100px; src='/resources/img/header_logo2.png' />
	</div>
	<div class="footer_content">
		COMPANY. 오늘 뭐 마시지 <br> TEAM. 강건, 김준홍, 박정서, 이다영, 조여진, 홍의표<br>
		COPYRIGHT 2021. 오늘 뭐 마시지. ALL RIGHTS RESERVED.
	</div>
</footer>

</html>
