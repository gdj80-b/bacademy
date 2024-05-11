<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
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
					<td>${vo.request_date}</td>
					<td>${vo.refund_cash}</td>
					<td>${vo.state}</td>
					<td></td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<button onclick="" class="btn btn-primary btn-sm">승인</button>
		</div>
	</div>
</body>
</html>