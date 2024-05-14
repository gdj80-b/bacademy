<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    </style>

</head>
<body>


        <!-- 사이드바 -->

      <nav class="sidenav">
      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
        <strong>mdo</strong>
      </a>
        <ul class="nav nav-pills nav-stacked">
          <li><a href="#">공지사항</a></li>
          <li><a href="#">강의목록</a></li>
          <li><a href="#">직원목록</a></li>
          <li><a href="#">학생목록</a></li>
        </ul>
      </nav>
   
      <!-- 사이드바 끝 -->
 
    
  
      <!-- 본문 -->
      <!-- 본문 끝 -->
   
	

</body>
</html>