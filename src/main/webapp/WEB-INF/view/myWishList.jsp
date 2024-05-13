<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<title>내 관심강의</title>
</head>
<body>

<div class="container">
	<h1>내 관심강의</h1>
	<table class="table table-bordered table-hover">
		<tr>
			<th>강의명</th>
			<th>가격</th>			
			<th>강의실</th>			
			<th>강의시간</th>			
			<th>요일</th>			
			<th>기간</th>			
		</tr>
		<c:forEach var="vo" items="${myWishList}">
			<tr>
				<td>${vo.lectureName}</td>
				<td>${vo.lecturePrice}원</td>
				<td>${vo.roomNum}</td>
				<td>${vo.lectureTime}</td>
				<td>${vo.lectureDay}</td>
				<td>${vo.startDate} ~ ${vo.endDate}</td>
			</tr>
		</c:forEach>
	</table>
</div>
</body>
</html>

<% System.out.println("디버깅"); %>