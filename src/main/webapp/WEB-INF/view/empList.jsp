<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>직원조회</title>
</head>
<body>
	<div class="container">
		<c:forEach></c:forEach>
		<div class="card text-center mb-3" style="width: 18rem;">
			<div class="card-header">
				<h5 class="card-title">강사</h5>
			</div>
			<img src="..." class="card-img-top" alt="...">
			<div class="card-body">
				<ul class="list-group list-group-flush">
					<li class="list-group-item">이름</li>
					<li class="list-group-item">이메일</li>
				</ul>
			</div>
			<div class="card-footer">
				<a href="#" class="card-link">상세보기</a>
			</div>
		</div>
	</div>
</body>
</html>