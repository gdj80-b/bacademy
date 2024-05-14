<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강의 상세</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
	<style>
		td, th{
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="container">
		<h1>강의 상세</h1>
		<c:forEach var="vo" items="${lectureOneList}">
			<table class="table table-bordered table-hover">
				<tr>
					<th>과목</th>
					<td>${vo.category}</td>
				</tr>
				<tr>
					<th>강의명</th>
					<td>${vo.lectureName}</td>
				</tr>
				<tr>
					<th>강사</th>
					<td>${vo.name}</td>
				</tr>
				<tr>
					<th>강의기간</th>
					<td>${vo.startDate} ~ ${vo.endDate}</td>
				</tr>
				<tr>
					<th>강의요일</th>
					<td>${vo.lectureDay}</td>
				</tr>
				<tr>
					<th>강의시간</th>
					<td>${vo.lectureTime}</td>
				</tr>
				<tr>
					<th>강의실</th>
					<td>${vo.roomNum}</td>
				</tr>
				<tr>
					<th>강의료</th>
					<td>${vo.lecturePrice}</td>
				</tr>
			</table>
			<br>
			<a href="/addWishList?lectureNo=${vo.lectureNo}" class="btn btn-primary btn-sm">찜하기</a>
			<a href="/modifyLectureForm?lectureNo=${vo.lectureNo}" class="btn btn-primary btn-sm">강의수정</a>
			<a href="/deleteLecture?lectureNo=${vo.lectureNo}" class="btn btn-primary btn-sm">강의삭제</a>
			<a href="/lectureList" class="btn btn-primary btn-sm">목록으로</a>
		</c:forEach>
	</div>
</body>
</html>