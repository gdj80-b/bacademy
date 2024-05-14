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
	<c:forEach var="vo" items="${lectureOneList}">
		<table>
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
		<a href="/addWishList?lectureNo=${vo.lectureNo}">찜하기</a>
		<a href="/modifyLectureForm?lectureNo=${vo.lectureNo}">강의수정</a>
		<a href="/deleteLecture?lectureNo=${vo.lectureNo}">강의삭제</a>
		<a href="/lectureList">목록으로</a>
	</c:forEach>
</body>
</html>