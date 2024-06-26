<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	if(${!empty msgType}){
     		$("#messageType").attr("class", "modal-content panel-warning");    
    		$("#myMessage").modal("show");
    	}
    });
</script>
<style>
* { padding: 0; margin: 0; }

html, body {
  height: 100%;
  background: #ffffff;
}

#container {
  display: flex;
  flex-direction: row;
  justify-content: center;
  align-items: center;
  height: 100%;
}

#loginBox {
  width: 300px;
  text-align: center;
  background-color: #ffffff;
  transform: scale(1.2);
}
.input-form-box {
  border: 0px solid #ff0000;
  display: flex;
  margin-bottom: 5px;
}
.input-form-box > span {
  display: block;
  text-align: left;
  padding-top: 5px;
  min-width: 65px;
}
.button-login-box {
  margin: 10px 0;
}
#loginBoxTitle {
  color:#000000;
  font-weight: bold;
  font-size: 32px;
  text-transform: uppercase;
  padding: 5px;
  margin-bottom: 20px;
  background: linear-gradient(to right, #270a09, #8ca6ce);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
#inputBox {
  margin: 10px;
}
#inputBox button {
  padding: 3px 5px;
}
.container-fluid {
  padding-left: 0;
}
.col-md-2 {
  width: 100%;
  padding-left: 0;
}
.div {
  display: flex;
  flex-direction: row;
}
.div a {
  text-align: center;
  flex: 1;
}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp"/>
<div class="container-fluid container-padding">
  <div class="row">
    <div class="col-md-2">
       <jsp:include page="../include/sideBar.jsp"/>
    </div>
    <div class="col-md-10">
      <div id="container" class="container-position">
        <div id="loginBox" class="box-position">
          <div id="loginBoxTitle">Bacademy 로그인</div>
          
          <form method="post" action="/memberLogin">
            <div id="inputBox">
              <div class="input-form-box">
              	<c:if test="${not empty findId}">
              		<span>아이디</span>
                	<input type="text" name="id" class="form-control" value=${findId}>
              	</c:if>
              	<c:if test="${empty findId}">
              		<span>아이디</span>
                	<input type="text" name="id" class="form-control">
              	</c:if>
              </div>
              <div class="input-form-box">
                <span>비밀번호</span>
                <input type="password" name="pw" class="form-control">
              </div>
              <div class="button-login-box">
                <input type="submit" class="btn btn-primary btn-xs" style="width:100%" value="로그인">
              </div>
              <div class="input-form-box div">
              	<a href="/findIdForm">아이디 찾기</a>
              	<a href="/findPwForm">비밀번호 찾기</a>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
	<!-- 실패 메세지를 출력(modal) -->
<div id="myMessage" class="modal fade" role="dialog">
  <div class="modal-dialog">  
    <!-- Modal content-->
    <div id="messageType" class="modal-content bg-primary text-white">
      <div class="modal-header">
        <h4 class="modal-title">${msgType}</h4>
      </div>
      <div class="modal-body">
        <p>${msg}</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>  
  </div>
</div>
</body>
</html>