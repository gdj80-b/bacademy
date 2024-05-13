<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>김형호</title>
	<style>
		td{
			text-align: center;
		}
	</style>
</head>
<body>
	<h1>강의 목록</h1>
	<table border=1>
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
				<td>${vo.lecturePrice}</td>
				<td>${vo.updateDate}</td>
				<td>${vo.createDate}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>