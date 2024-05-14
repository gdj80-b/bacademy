<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Notice</title>

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
				<!-- <c:if test="${empty mvo}">
                <ul class="nav navbar-nav navbar-right">
                      <li><a href="${contextPath}/memLoginForm.do"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
                      <li><a href="${contextPath}/memJoin.do"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>            
                </ul>
            </c:if>
            <c:if test="${!empty mvo}">
                <ul class="nav navbar-nav navbar-right">
                      <li><a href="${contextPath}/memUpdateForm.do"><span class="glyphicon glyphicon glyphicon-wrench"></span> 회원정보수정</a></li>
                      <li><a href="${contextPath}/memImageForm.do"><span class="glyphicon glyphicon glyphicon-picture"></span> 사진등록</a></li>
                      <li><a href="${contextPath}/memLogout.do"><span class="glyphicon glyphicon-log-out"></span> 로그아웃</a></li>            
                      <c:if test="${!empty mvo}">
                      <c:if test="${mvo.memProfile eq ''}">
                        <li><img class="img-circle" src="${contextPath}/resources/images/person.PNG" style="width: 50px; height: 50px"/> ${mvo.memName} 님Welcome.</li>
                      </c:if>
                      <c:if test="${mvo.memProfile ne ''}">
                        <li><img class="img-circle" src="${contextPath}/resources/upload/${mvo.memProfile}" style="width: 50px; height: 50px"/> ${mvo.memName} 님Welcome.</li>
                      </c:if>			  
                    </c:if>
                </ul>
            </c:if> -->
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
				<div class="panel-heading">공지사항</div>
				<!-- <div class="col-sm-9 page">  -->
				<div class="panel-body">
					<form action="modifyNotice" method="post">
					  <input type="hidden" name="noticeNo" value="${noticeVO.noticeNo}">						
						<table class="table table-bordered">
							<tr>
								<td>제목</td>
								<td>
								<input type="text" name="title" class="form-control"
								value="${noticeVO.title}"/>
								</td>
							</tr>
							<tr>
								<td>내용</td>
								<td>
								<textarea rows="7" class="form-control" name="content">${noticeVO.content}</textarea>
								</td>
							</tr>
							<tr>
								<td>작성자</td>
								<td><input type="text" class="form-control" value="${noticeVO.writer}" readonly="readonly"></td>
							</tr>
							<tr>
								<td colspan="2" align="center">
									<button type="submit" class="btn btn-primary btn-sm">수정</button>
									<button type="reset" class="btn btn-warning btn-sm">취소</button>
									<button type="button" class="btn btn-info btn-sm"
										onclick="location.href='/noticeList'">목록</button>
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
		<!-- 본문 끝 -->
	</div>
</body>
</html>