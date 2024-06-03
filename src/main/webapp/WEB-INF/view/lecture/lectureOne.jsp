<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>강의 상세</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		/* 사이드바 */
		.sidenav {
			background-color: #f1f1f1;
			position: fixed;
			width: 188px;
			height: 100%;
			margin-left: -20px;
			margin-top: -20px
		}
		/* 본문 */
		.page {
			margin-top: 50px;
			margin-left: 250px;
		}
		
		td, th{
			text-align: center;
		}
	</style>
</head>
<body>
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="${contextPath}/">Bacademy</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li class="active"><a href="${contextPath}/">Home</a></li>
					<li><a href="boardMain.do">게시판</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="${contextPath}/memLoginForm.do"><span
							class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
					<li><a href="${contextPath}/memJoin.do"><span
							class="glyphicon glyphicon-user"></span> 회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container-fluid">
		<!-- 사이드바 -->
		<nav class="col-sm-3 sidenav">
			<a href="#"
				class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
				id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
				<img src="https://github.com/mdo.png" alt="" width="32" height="32"
				class="rounded-circle me-2"> <strong>mdo</strong>
			</a>
			<ul class="nav nav-pills nav-stacked">
				<li><a href="${contextPath}/noticeList">공지사항</a></li>
				<li><a href="${contextPath}/boardList">게시판</a></li>
				<li><a href="#">강의목록</a></li>
				<li><a href="#">직원목록</a></li>
			</ul>
		</nav>
		<!-- 사이드바 끝 -->
	
		<!-- 본문 -->
		<div class="container">
			<div class="panel panel-default">
				<div class="panel-heading">강의상세</div>
					<!-- <div class="col-sm-9 page">  -->
					<div class="panel-body">
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
							<a href="/addWishList?id='student'&lectureNo=${vo.lectureNo}" class="btn btn-primary btn-sm">찜하기</a>
							<a href="/modifyLectureForm?lectureNo=${vo.lectureNo}" class="btn btn-primary btn-sm">강의수정</a>
							<a href="/deleteLecture?lectureNo=${vo.lectureNo}" class="btn btn-primary btn-sm">강의삭제</a>
							<a href="/lectureList" class="btn btn-primary btn-sm">목록으로</a>
						</c:forEach>
					</div>
				</div>
			</div>
	</div>
</body>
</html>