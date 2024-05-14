<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>수납이력조회</title>
</head>
<body>
	<div class="container">
		<h1>수납이력</h1>
		<table class="table table-bordered table-hover">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>날짜</th>
				<th>사유</th>
				<th>금액</th>
				<th>잔액</th>
			</tr>
			<c:forEach var="vo" items="${cashHistory}">
				<tr>
					<td>${vo.id}</td>
					<td>${vo.name}</td>
					<td>${vo.createDate}</td>
					<td>${vo.reason}</td>
					<td>${vo.cash}</td>
					<td>${vo.balance}</td>
				</tr>
			</c:forEach>
		</table>
		<div>
			<a href="refundHistory" class="btn btn-primary btn-sm">환불이력</a>
		</div>
	</div>
</body>
</html>