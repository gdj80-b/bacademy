<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Map"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 부트스트랩 5.3.3으로 수정  -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<style>
    	.navbar-right.align {
        	display: flex;
        	justify-content: center;
       		align-items: center;
    	}
	</style>
	<title>사이드바</title>
</head>
<body>
	<%-- 세션 스코프에 있는 "loginInfo" 속성을 가져와서 Map으로 형변환 --%>
	<c:set var="loginInfo" value="${sessionScope.loginInfo}" />
	<nav class="navbar fixed-top navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
			<a class="navbar-brand" href="${contextPath}/">BACADEMY</a>
			<div class="collapse navbar-collapse" id="mynavbar">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="${contextPath}/">메인페이지</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							게시판
						</a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="noticeList">공지사항</a></li>
							<li><a class="dropdown-item" href="boardList">과제/질문게시판</a></li>
						</ul>            
					</li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<div class="d-flex justify-content-end">
				<c:choose>
					<%-- 로그인 정보가 없을 때 --%>
					<c:when test="${empty loginInfo or empty loginInfo['name']}">
						<ul class="navbar-nav">
							<li class="nav-item me-4">
								<a href="${contextPath}/loginForm"><span class="glyphicon glyphicon-log-in"></span>&nbsp;&nbsp;로그인</a>
							</li>
							<li class="nav-item">
								<a href="${contextPath}/memberJoinForm"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;회원가입</a>
							</li>            
						</ul>
					</c:when>
					<%-- 로그인 정보가 있을 때 --%>
					<c:otherwise>
						<ul class="navbar-nav">
							<%-- "loginInfo" Map에서 "name" 키에 해당하는 값을 가져와서 출력 --%>
							<li class="nav-item me-4">${loginInfo['name']}님, 환영합니다</li>
							<li class="nav-item">
								<a href="${contextPath}/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;&nbsp;로그아웃</a>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
	</nav>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>