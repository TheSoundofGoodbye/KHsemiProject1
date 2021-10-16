<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="/WEB-INF/views/layout/header.jsp" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>  

<style>
.popupOpen1 {
	cursor: pointer;
}

.popupWrap1 {
	z-index: 99999;
	width: 100%;
	height: 100%;
	position: absolute;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.6);
}

.popupWrap1 .popup1 {
	position: absolute;
	left: 50%;
	top: 50%;
	margin-left: -200px;
	margin-top: -200px;
	width: 400px;
	height: 400px;
	background-color: #fff;
	border-radius: 10px;
	padding: 0 10px;
}

.popupWrap1 div textarea {
	width: 100%;
	padding: 0;
}

.popupWrap1 div .title {
	display: flex;
	align-items: center;
	justify-content: space-between;
}

.popupWrap1 div .title p {
	line-height: 50px;
	margin: 0;
}

.hide1 {
	display: none;
}

.btnWrap1 {
	text-align: right;
}

.btnWrap1 button {
	border-radius: 5px;
	background-color: rgb(104, 122, 204);
	color: #fff;
	border: none;
	padding: 10px;
}
</style>


			<div class="container">

				<h1>문의 상세 보기</h1>
				<hr>

				<table class="table table-bordered">
					<tr>
						<td class="info">닉네임</td>
						<td colspan="3" class="popupOpen1">${user_info.user_nickname }</td>
					</tr>


					<tr>
						<td class="info">글번호</td>
						<td colspan="3">${viewBoard.qna_board_no }</td>
					</tr>

					<tr>
						<td class="info">제목</td>
						<td colspan="3">${viewBoard.qna_board_title }</td>
					</tr>

					<!-- <tr> -->
					<%-- <td class="info">이메일</td><td>${viewBoard.userid }</td> --%>
					<%-- <td class="info">닉네임</td><td>${nick }</td> --%>
					<!-- </tr> -->


					<tr>
						<td class="info" colspan="4">본문</td>
					</tr>

					<tr>
						<td colspan="4" style="height:350px" >${viewBoard.qna_board_content }</td>
					</tr>

					<tr>
						<td class="info">작성일</td>
						<td>${viewBoard.qna_board_date }</td>
					</tr>

				</table>

				<!-- 첨부파일 -->
				<div>
					<c:if test="${not empty boardFile }">
						<a href="/upload/${boardFile.stored_file_name }"
							download="${boardFile.original_file_name }">${boardFile.original_file_name }</a>
					</c:if>
				</div>

				<div class="text-center">
					<button id="btnList" class="btn btn-primary">목록</button>
					<button id="btnUpdate" class="btn btn-info">수정</button>
					<button id="btnDelete" class="btn btn-danger">삭제</button>
				</div>


				<div>
					<div class="popupWrap1 hide1">
						<form action="/message/test" method="post">
						<input type="hidden" name="boardno" value="${viewBoard.qna_board_no }" />
							<div class="popup1">
								<div class="title">
									<p>${user_info.user_nickname }</p>
									<span class="close1">❌</span>
								</div>
								<textarea name="message" id="message" cols="30" rows="10"></textarea>
								<div class="btnWrap1">
									<button>보내기</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
<script type="text/javascript">
	$(document).ready(function() {
	//목록버튼 동작
	$("#btnList").click(function() {
		$(location).attr("href", "/qna/list");
	});

	//수정버튼 동작
	$("#btnUpdate").click(function() {
		$(location).attr("href","/qna/update?boardno=${viewBoard.qna_board_no }");
	});

	//삭제버튼 동작
	$("#btnDelete").click(function() {
		if (confirm("게시글을 삭제하시겠습니까?")) {
			$(location).attr("href","/qna/delete?boardno=${viewBoard.qna_board_no }");
			}
		});
	});
</script>
<script>
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
</script>


<c:import url="/WEB-INF/views/layout/footer.jsp" />