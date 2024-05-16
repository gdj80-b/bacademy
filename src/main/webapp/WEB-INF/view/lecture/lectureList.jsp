<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강의 목록</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		td, th{
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>강의 목록</h1>
		<table class="table table-bordered table-hover">
			<tr>
				<th>강의명</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>강의시간</th>
				<th>강의실</th>
				<th>강의일</th>
				<th>강의료</th>
				<th>수정일</th>
				<th>등록일</th>
			</tr>
			<c:forEach var="vo" items="${lectureList}">
				<tr>
					<td><a href="/lectureOne?lectureNo=${vo.lectureNo}">${vo.lectureName}</a></td>
					<td>${vo.startDate}</td>
					<td>${vo.endDate}</td>
					<td>${vo.lectureTime}</td>
					<td>${vo.roomNum}</td>
					<td>${vo.lectureDay}</td>
					<td><fmt:formatNumber value="${vo.lecturePrice}" pattern="#,##0"/>원</td>
					<td>${vo.updateDate}</td>
					<td>${vo.createDate}</td>
				</tr>
			</c:forEach>
		</table>
		
		<nav aria-label="Page navigation example">
		  <ul class="pagination justify-content-center">
		  	<c:if test="${paging.currentPage > 1 && paging.currentPage < paging.lastPage}">
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=1">&laquo;</a></li>
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.currentPage - 1}">&lsaquo;</a></li>
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.currentPage + 1}">&rsaquo;</a></li>
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.lastPage}">&raquo;</a></li>
		  	</c:if>
		  	
		  	<c:if test="${paging.lastPage == 1}">
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
		  	</c:if>
		  	
		  	<c:if test="${paging.currentPage == 1}">
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.currentPage + 1}">&rsaquo;</a></li>
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.lastPage}">&raquo;</a></li>
		  	</c:if>
		  	
		  	<c:if test="${paging.currentPage == paging.lastPage}">
		  		<li class="page-item"><a class="page-link" href="/lectureList?currentPage=1">&laquo;</a></li>
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.currentPage - 1}">&lsaquo;</a></li>
			    <li class="page-item"><a class="page-link" href="/lectureList?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
		  	</c:if>
		  </ul>
		</nav>
	</div>
</body>
</html>