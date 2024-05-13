<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>FindIdForm</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <style>
  	.error {
  		color:red;
  	}
  </style>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script>
  function goInsert(){
  	document.frm.submit(); // 전송
  }
  function oninputPhone(target) {
      target.value = target.value
          .replace(/[^0-9]/g, '')
          .replace(/(^02.{0}|^01.{1}|[0-9]{3,4})([0-9]{3,4})([0-9]{4})/g, "$1-$2-$3");
  }
  </script>
</head>
<body>
<div class="container">
  <jsp:include page="../include/header.jsp"/> 
  <h2>Spring MVC05</h2>
  <div class="panel panel-default">
    <div class="panel-heading">아이디 찾기</div>
    <div class="panel-body">
      <form name="frm" action="${contextPath}/findId" method="post">
         <table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd;">
            <tr>
             <td style="width: 110px; vertical-align: middle;">사용자 이름</td>
             <td colspan="2"><input id="name" name="name" class="form-control" type="text" maxlength="20" placeholder="이름을 입력하세요."/></td>            
           </tr>
           <tr>
           	<td style="width: 110px; vertical-align: middle;">전화번호</td>
           	<td colspan="2"><input id="phoneNum" name="phoneNum" class="form-control" type="text" oninput="oninputPhone(this)" maxlength="14" placeholder="숫자만 입력하세요."/></td>            
           </tr>
           <tr>
           	
             <td colspan="3" style="text-align: left;">
             	<span class="error">${msg}</span>
                <span id="passMessage" style="color: red"></span><input type="button" class="btn btn-primary btn-sm pull-right" value="찾기" onclick="goInsert()"/>
             </td>             
           </tr>
         </table>   
      </form>    
    </div>
    <div class="panel-footer">Bacademy</div>
  </div>
</div>
</body>
</html>