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
<title>게시글</title>

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
				<div class="panel-heading">게시판</div>
				<!-- <div class="col-sm-9 page">  -->
				<div class="panel-body">
					<table class="table table-bordered table-hover">
						<tr>
							<th>번호</th>
							<th>카테고리</th>
							<th>제목</th>
							<th>작성일</th>
						</tr>
						<c:forEach var="board" items="${boardList}">
							<tr>
								<td>${board.boardNo}</td>
								<td>${board.category}</td>
								<td><a href="/boardOne?boardNo=${board.boardNo}">${board.title}</a></td>
								<td>${board.createDate}</td>
							</tr>
						</c:forEach>
					</table>

					<nav aria-label="Page navigation example">
						<ul class="pagination justify-content-center">
							<c:if
								test="${paging.currentPage > 1 && paging.currentPage < paging.lastPage}">
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=1">&laquo;</a></li>
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.currentPage - 1}">&lsaquo;</a></li>
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.currentPage + 1}">&rsaquo;</a></li>
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.lastPage}">&raquo;</a></li>
							</c:if>

							<c:if test="${paging.lastPage == 1}">
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
							</c:if>

							<c:if test="${paging.currentPage == 1}">
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.currentPage + 1}">&rsaquo;</a></li>
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.lastPage}">&raquo;</a></li>
							</c:if>

							<c:if test="${paging.currentPage == paging.lastPage}">
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=1">&laquo;</a></li>
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.currentPage - 1}">&lsaquo;</a></li>
								<li class="page-item"><a class="page-link"
									href="/boardList?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
							</c:if>
						</ul>
					</nav>

					<a href="addBoardForm" class="btn btn-primary btn-sm">글쓰기</a>
				</div>
			</div>
		</div>
		<!-- 본문 끝 -->
	</div>
</body>
</html>