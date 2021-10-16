<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:import url="/WEB-INF/views/layout/header.jsp" />



<h1>내가 보낸 쪽지함</h1>
<hr>

<table class="table table-striped">
	<tr>
		<th>받은 사람</th>
		<th>내용</th>
		<th>읽음표시</th>
		<th>날짜</th>
	</tr>
	<c:forEach items="${message }" var="message">
		<c:forEach items="${user_info }" var="user_info">
			<c:if test="${user_info.user_no eq message.msg_rec }">
				<tr>
					<td>${user_info.user_nickname }</td>
					<td>${message.msg_content }</td>
					<td>${message.msg_check }</td>
					<td>${message.send_date }</td>
				</tr>
			</c:if>
		</c:forEach>
	</c:forEach>
</table>


<c:import url="/WEB-INF/views/layout/footer.jsp" />
