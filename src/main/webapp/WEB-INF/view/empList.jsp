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
		<c:forEach var="vo" items="${empInfo}">
			<c:choose>
				<c:when test="${vo.grade == 2}">
					<div class="card text-center mb-3" style="width: 18rem;">
						<div class="card-header">
							<h5 class="card-title">강사</h5>
						</div>
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">${vo.name}</li>
								<li class="list-group-item">${vo.email}</li>
							</ul>
						</div>
						<div class="card-footer">
							<a href="#" class="card-link">상세보기</a>
						</div>
					</div>
				</c:when>
				<c:when test="${vo.grade == 3}">
					<div class="card text-center mb-3" style="width: 18rem;">
						<div class="card-header">
							<h5 class="card-title">관리자</h5>
						</div>
						<img src="..." class="card-img-top" alt="...">
						<div class="card-body">
							<ul class="list-group list-group-flush">
								<li class="list-group-item">${vo.name}</li>
								<li class="list-group-item">${vo.email}</li>
							</ul>
						</div>
						<div class="card-footer">
							<a href="#" class="card-link">상세보기</a>
						</div>
					</div>
				</c:when>
			</c:choose>
		</c:forEach>
	</div>
</body>
</html>