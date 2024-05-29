<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>Document</title>
    <style>
        /* 사이드바 */
        .sidenav {
          background-color: #f1f1f1;
          position: fixed;
          width: 250px;
          height: 100%;
          margin-left: -20px;
          margin-top:-20px
        }
        /* 본문 */
        .page {
         margin-top:50px;
         margin-left: 250px;
        }
        @media (max-width: 1350px) {
	    	.sidenav {
	        	display: none; /* 화면 크기가 작아지면 해당 영역을 숨김 */
	    	}
		}
		.info {
			display: flex; 
			justify-content: center;
			flex-direction: column; 
			align-items: center;
			text-align :center;
		}
    </style>

</head>
<body>
	 <!-- 사이드바 -->
	<nav class="sidenav">
		<div class="info">
			<c:set var="loginInfo" value="${sessionScope.loginInfo}" />
			<h2 class="mt-2"><string>'${loginInfo['name']}'님<string></h2>
			<h5>(학생)</h5>
			<h5>현재 캐쉬 : <fmt:formatNumber type="number" value="${loginInfo['cash']}" pattern="#,###"/> 원</h5>
			<ul class="nav nav-pills nav-stacked">
	          <li><a href="/studentMyPage">내 정보</a></li>
	          <li><a href="/myCashList">내 캐쉬</a></li>
	          <li><a href="/myWishList">관심강의</a></li>
	        </ul>
    	</div>
    	<div class="info">
	        <ul class="nav nav-pills nav-stacked">
	          <li><a href="/noticeList">공지사항</a></li>
	          <li><a href="/lectureList">강의목록</a></li>
	        </ul>
    	</div>
     </nav>
     <!-- 사이드바 끝 -->
</body>
</html>