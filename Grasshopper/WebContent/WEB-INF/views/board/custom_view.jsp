<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
	
<link rel="stylesheet" type="text/css" href="/resources/css/offcusstyle.css">

<link rel="stylesheet" type="text/css" href="/resources/css/messagePopup.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<body>

	<div class="wrap">
		<div class="intro_bg2" style="width: 100%; height: 500px; background-position: top; background-positoin: center; background-repeat: no-repeat; background-image: url('/resources/img/cocktailbar.jpg');">
			<div class="header">
				<div class="header_logo">
					<a href="/main"> <img width=100px;
						src='/resources/img/header_logo2.png' />
					</a>
				</div>
				<ul class="nav">
					<li><a href="/official/main">칵테일 검색</a></li>
					<li><a href="/custom/main">칵테일 제작</a></li>
					<li><a href="/free/list">자유게시판</a></li>
					<li><a href="/shopping/main">쇼핑</a></li>
					<li><a href="/searchbar">어디가서 마실까</a></li>
					<li><a href="/qna/write">문의게시판</a></li>
				</ul>

				<div class="navbar_togleBtn">
					<button class="btn btn-success">MENU</button>
				</div>

				<c:if test="${empty login or not login }">
					<div class="login">
						<form>
							<button type="reset" onclick='location.href="/mypage/main";'
								class="btn btn-info">로그인</button>
						</form>
					</div>
					<div class="join">
						<button type="reset" class="btn btn-warning"
							onclick='location.href="/kh1/logout";'>회원가입</button>
					</div>
				</c:if>

				<c:if test="${login }">
					<div class="mypage">
						<button type="reset" onclick='location.href="/mypage/main";'
							class="btn btn-info">마이페이지</button>
					</div>
					<div class="logout">
						<form>
							<button type="reset" class="btn btn-warning"
								onclick='location.href="/kh1/logout";'>로그아웃</button>
						</form>
					</div>
				</c:if>

			</div>
		</div>
	</div>

<div class="container">
	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<h3>코멘트 입력 실패</h3>
			<br>
			<p>코멘트가 없거나 글자수가 200자 이상입니다.</p>
		</div>

	</div>

	<div class="content-container">
		<div class="title-container">
			<h1 class="entry-title">${viewCustom.custom_board_title }</h1>
			<div class="title-sub-container popupOpen1" style="display:inline-block;">작성자 : ${viewCustom.user_nickname }
				| 조회수 : ${viewCustom.custom_board_hit }</div>
			<!-- 신고 아이콘 -->
			<form class="report-form" action="/report/write" method="post" name="report_link">
			<input type="hidden" name="board_title" value="${viewCustom.custom_board_title }">
			<span id="report-icon" class="material-icons report-icon">
			report_problem</span>
			</form>
		</div>
	</div>

	<div class="pic-container">
		<!-- JS로 그림파일만 게시되되록 할 예정 -->
		<c:if test="${not empty customFile }">
			<img width="600px" src="/upload/${customFile.stored_file_name }" />
		</c:if>
	</div>

	<div>
		<div class="body-container">
			<h3 class="semi_title"></h3>
			<div>${viewCustom.custom_board_content }</div>
			<!-- 첨부파일 -->
			<div class="attachment">
				<a class="">첨부파일 : </a>
				<c:if test="${not empty customFile }">
					<a href="/upload/${customFile.stored_file_name }"
						download="${customFile.original_file_name }">
						${customFile.original_file_name }</a>
				</c:if>
			</div>
		</div>

		<div class="comment-container">
			<div id="comment-main-input" class="comment-input comment-hide">
				<form action="/custom/comment/write" method="post" name="cmtForm">
					<textarea name="content" id="textarea"
						placeholder="내용을 입력해주세요 (200자)"  maxlength="200"></textarea>
					<input type="hidden" name="board_no" value="${param.custom_no }">
					<button type="submit" name="" id="comment-write-button">댓글달기</button>
				</form>
			</div>
			<div class="comment-loaded">
				<c:forEach var="c" items="${comments }">
					<div class="comment-list comment-show"
						id="comment-show${ c.custom_reply_no }">
						<div id="" style="display: none;">${c.user_no }</div>
						<div class="popupOpen1" style="width: fit-content;">닉네임 : ${c.user_nickname }</div>
						<div style="width:80%">작성일시: ${c.custom_reply_date }</div><br>
						<div style="width:88%;font-size:20px;word-break: break-all;">${c.custom_reply_content }</div>
						<form id="comment-reply-form" class="report-reply-form comment-hide" action="/report/write" method="post" name="report_link">
							<input type="hidden" name="reply_content" value="${ c.custom_reply_no }번리플:${c.custom_reply_content }"> 
							<span id="report-reply-icon" class="material-icons report-reply-icon">
							report_problem</span>
						</form>
						<c:if test="${c.user_no == sessionScope.user_no }">
							<form name="delete-form" action="/custom/comment/delete" method="get">
								<input type="hidden" name="custom_reply_no"	value="${c.custom_reply_no }">
								<button class="delete-button" type="submit" onclick="if(!confirm('댓글을 삭제하시겠습니까?')) {return false;}" style="width:0;height:0;"><span class="delete-icon material-icons">delete</span></button>
							</form>
							<span class="modify-icon material-icons" onclick="updateCommentShow('${c.custom_reply_no}')">build</span>
						</c:if>
					</div>
					<div class="comment-input comment-hide"
						id="comment-input${ c.custom_reply_no }">
						<form action="/custom/comment/update" method="post"
							name="cmtUpdate">
							<textarea name="custom_reply_content" id="textarea2" maxlength="200">${c.custom_reply_content }</textarea>
							<input type="hidden" name="custom_reply_no"
								value="${c.custom_reply_no }">
							<button type="submit" class="comment-button" name=""
								id="comment-update-button">수정확인</button>
							<button type="button" class="comment-button" name=""
								id="comment-cancel-button"
								onclick="cancelCommentUpdate('${c.custom_reply_no}')">취소하기</button>
						</form>
					</div>
				</c:forEach>
			</div>
		</div>

		<div class="bottom-buttons text-center">
			<button id="btnUpdate" class="btn viewButton comment-hide">수정하기</button>
			<button id="btnList" class="btn viewButton">목록으로</button>
			<button id="btnDelete" class="btn viewButton comment-hide">삭제</button>
		</div>
	</div>
</div>

<div class="popupWrap1 hide1">
	<form action="/customboard/message" method="post">
		<input type="hidden" name="custom_no" value="${param.custom_no }" />
		<div class="popup1">
			<div class="title">
				<p>${viewCustom.user_nickname }</p>
				<span class="close1">❌</span>
			</div>
			<textarea name="message" id="message" cols="30" rows="10"></textarea>
			<div class="btnWrap1">
				<button>보내기</button>
			</div>
		</div>
	</form>
</div>
<style>
footer {
	position: sticky !important;
}
</style>
<script type="text/javascript">
	$('.popupOpen1').on('click', function() {
		$('.popupWrap1').removeClass('hide1');
	});
	$('.close1').on('click', function() {
		$(this).parents('.popupWrap1').addClass('hide1');
		$(this).parents('.popup1').children('textarea').val('');
	});

	$(".btnWrap1").click(function() {
		$(this).parents("form").submit();
// 		history.go(-1);
	});
	
//버튼 function
$(document).ready(function() {
						
	//게시글 목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/custom/list");
	});

	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href","/custom/update?custom_no=${viewCustom.custom_board_no }");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			$(location).attr("href","/custom/delete?custom_no=${viewCustom.custom_board_no }");
		}
	});
	
	//신고버튼 동작
	$(".report-icon").click(function(){
		if (confirm("게시글을 신고하시겠습니까?")) {
			$(".report-form").submit();
		}
	});
	$(".report-reply-icon").click(function(){
		if (confirm("댓글을 신고하시겠습니까?")) {
			$(".report-reply-form").submit();
		}
	});
});


//코멘트 200자 이상일 시 스크립트
// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn = document.getElementById("comment-write-button");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on the button, open the modal
btn.onclick = function() {
	if (document.getElementById("textarea").value.length >= 200 || document.getElementById("textarea").value.length < 1) {
		modal.style.display = "block";
		return false;
	}
}


// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
	if (event.target == modal) {
		modal.style.display = "none";
	}
}


function updateCommentShow(custom_reply_no) {
	var show = "comment-show" + custom_reply_no;
	var input = "comment-input" + custom_reply_no;

	document.getElementById(show).classList.add("comment-hide");
	document.getElementById(show).classList.remove("comment-show");
	document.getElementById(input).classList.add("comment-show");
	document.getElementById(input).classList.remove("comment-hide");
	return false;
}

function cancelCommentUpdate(custom_reply_no) {
	var show = "comment-show" + custom_reply_no;
	var input = "comment-input" + custom_reply_no;

	document.getElementById(show).classList.remove("comment-hide");
	document.getElementById(show).classList.add("comment-show");
	document.getElementById(input).classList.remove("comment-show");
	document.getElementById(input).classList.add("comment-hide");
	return false;
}

window.onload = function() {
	//로그인이 아닐 시 감추기
	if ("${login }" == "true"){
		document.getElementById("comment-main-input").classList.remove("comment-hide");
		document.getElementById("comment-reply-form").classList.remove("comment-hide");
		document.getElementById("btnUpdate").classList.remove("comment-hide");
		document.getElementById("btnDelete").classList.remove("comment-hide");
		
	}
}
</script>

<c:import url="/WEB-INF/views/layout/footer.jsp" />
