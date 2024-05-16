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
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
	<title>헤더</title>
	<style>
		*,
		::after, 
		::before {
			box-sizing: border-box;
		}
	</style>
</head>
<body>
	<%-- 세션 스코프에 있는 "loginInfo" 속성을 가져와서 Map으로 형변환 --%>
	<c:set var="loginInfo" value="${sessionScope.loginInfo}" />
	<header class="navbar navbar-expand-lg bg-body-tertiary fixed-top">
        <nav class="container-fluid">
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
			<div class="d-flex justify-content-end">
				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<c:choose>
					<%-- 로그인 정보가 없을 때 --%>
					<c:when test="${empty loginInfo or empty loginInfo['name']}">
						<ul class="navbar-nav">
							<li class="nav-item me-2">
								<a class="nav-link active" href="${contextPath}/loginForm"><i class="bi bi-box-arrow-in-right"></i>&nbsp;&nbsp;로그인</a>
							</li>
							<li class="nav-item me-2">
								<a class="nav-link active" href="${contextPath}/memberJoinForm"><i class="bi bi-person-fill-add"></i>&nbsp;&nbsp;회원가입</a>
							</li>            
						</ul>
					</c:when>
					<%-- 로그인 정보가 있을 때 --%>
					<c:otherwise>
						<ul class="navbar-nav">
							<%-- "loginInfo" Map에서 "name" 키에 해당하는 값을 가져와서 출력 --%>
							<li class="nav-item me-2">${loginInfo['name']}님, 환영합니다</li>
							<li class="nav-item me-2">
								<a class="nav-link active" href="${contextPath}/logout"><i class="bi bi-box-arrow-right"></i>&nbsp;&nbsp;로그아웃</a>
							</li>
						</ul>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</nav>
	</header>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>