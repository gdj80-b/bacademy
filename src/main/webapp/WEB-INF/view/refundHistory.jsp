<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>환불이력조회</title>
</head>
<body>
	<div class="container">
		<h1>환불이력</h1>
		<table class="table table-bordered table-hover">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>날짜</th>
				<th>금액</th>
				<th>환불상태</th>
				<th>선택</th>
			</tr>
			<c:forEach var="vo" items="${refundHistory}">
				<tr>
					<td>${vo.id}</td>
					<td>${vo.name}</td>
					<td>${vo.requestDate}</td>
					<td>${vo.refundCash}</td>
					<td>${vo.state}</td>
					<td>
						<c:choose>
							<c:when test="${vo.state eq '대기'}">
								<form action="refundConfirm" method="post">
									<input type="hidden" name="refundNo" value="${vo.refundNo}">
									<input type="hidden" name="state" value="승인">
									<input type="hidden" name="id" value="${vo.id}">
									<input type="hidden" name="cash" value="${vo.refundCash}">
									<button type="submit" class="btn btn-primary btn-sm">승인</button>
								</form>
							</c:when>
							<c:otherwise>
								<button type="submit" onclick="" class="btn btn-secondary btn-sm" disabled>완료</button>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</table>
		<a href="cashHistory" class="btn btn-primary btn-sm">이전으로</a>
	</div>
</body>
</html>