<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" href="${contextPath}/">Bacademy</a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li class="active"><a href="${contextPath}/">Home</a></li>
              <li><a href="boardMain.do">게시판</a></li>            
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${contextPath}/loginForm"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
                <li><a href="${contextPath}/memberJoinForm"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>            
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
</body>
</html>