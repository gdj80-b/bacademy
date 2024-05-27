<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>직원조회</title>
	<style>
		body {
			padding-top: 56px;
		}
		
		.main-padding {
			padding-left: 0;
			padding-right: 0;
		}
		
		.col {
			display: flex;
			align-items: center;
			justify-content: center;
		}
		
		.card {
			width: 200px;
		}
		
		.profile-img-wrapper {
			height: 150px;
			display: flex;
			justify-content: center;
			align-items: center;
			overflow: hidden;
		}
		
		.profile-img {
			max-width: 120px;
			max-height: 120px;
			object-fit: cover;
			border-radius: 50%;
		}
	</style>
</head>
<body>
	<jsp:include page="include/header.jsp"/>
	<div class="container-fluid p-0 d-flex">
		<jsp:include page="include/sideBar.jsp"/>
		<div class="d-flex flex-column justify-content-first p-4">
			<nav aria-label="Page navigation">
			 	<ul class="pagination pagination-sm justify-content-center">
			 		<c:choose>
			 			<c:when test="${paging.currentPage == 1}">
			 				<li class="page-item disabled"><a class="page-link" href="/empList?currentPage=1">&laquo;</a></li>
	  						<li class="page-item disabled"><a class="page-link" href="/empList?currentPage=${paging.currentPage - 1}">&lsaquo;</a></li>	
			 			</c:when>
			 			<c:otherwise>
			 				<li class="page-item"><a class="page-link" href="/empList?currentPage=1">&laquo;</a></li>
	  						<li class="page-item"><a class="page-link" href="/empList?currentPage=${paging.currentPage - 1}">&lsaquo;</a></li>
			 			</c:otherwise>
			 		</c:choose>
			 		<c:forEach var="i" begin="1" end="${paging.totalPage}">
		 				<li class="page-item"><a class="page-link" href="/empList?currentPage=${i}">${i}</a></li>
			 		</c:forEach>
			    	<c:choose>
			 			<c:when test="${paging.currentPage == paging.lastPage}">
			 				<li class="page-item disabled"><a class="page-link" href="/empList?currentPage=${paging.currentPage + 1}">&rsaquo;</a></li>
			    			<li class="page-item disabled"><a class="page-link" href="/empList?currentPage=${paging.lastPage}">&raquo;</a></li>
			 			</c:when>
			 			<c:otherwise>
			 				<li class="page-item"><a class="page-link" href="/empList?currentPage=${paging.currentPage + 1}">&rsaquo;</a></li>
			    			<li class="page-item"><a class="page-link" href="/empList?currentPage=${paging.lastPage}">&raquo;</a></li>	
			 			</c:otherwise>
			 		</c:choose>
			 	</ul>
			</nav>
			<div class="row row-cols-1 row-cols-md-5 g-2">
				<c:forEach var="vo" items="${empInfo}">
					<c:choose>
						<c:when test="${vo.grade == 2}">
							<div class="col">
								<div class="card text-center mb-3">
									<div class="card-header">
										<h5 class="card-title">강사</h5>
									</div>
									<div class="profile-img-wrapper">
										<img src="https://storage.googleapis.com/bacademy/${vo.profileImg}" class="profile-img" alt="profile-img">
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">${vo.name}</li>
										<li class="list-group-item">${vo.email}</li>
									</ul>
									<div class="card-footer">
										<a href="empOne?id=${vo.id}" class="card-link">상세보기</a>
									</div>
								</div>
							</div>
						</c:when>
						<c:when test="${vo.grade == 3}">
							<div class="col">
								<div class="card text-center mb-3">
									<div class="card-header">
										<h5 class="card-title">관리자</h5>
									</div>
									<div class="profile-img-wrapper">
										<img src="https://storage.googleapis.com/bacademy/${vo.profileImg}" class="profile-img" alt="profile-img">
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item">${vo.name}</li>
										<li class="list-group-item">${vo.email}</li>
									</ul>
									<div class="card-footer">
										<a href="empOne?id=${vo.id}" class="card-link">상세보기</a>
									</div>
								</div>
							</div>
						</c:when>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>
