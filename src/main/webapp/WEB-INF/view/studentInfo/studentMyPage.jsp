<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginForm</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
    	if(${!empty msgType}){
     		$("#messageType").attr("class", "modal-content panel-warning");    
    		$("#myMessage").modal("show");
    	}
    });
    function handleSelectChange(selectedValue) {
    	window.location.href = "/studentMyPage?lectureStatus="+selectedValue;
    }
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
.flex-container {
   display: flex;
   align-items: center;
   justify-content: space-between;
}
</style>
</head>
<body>

<jsp:include page="../include/header.jsp"/>
<div class="container-fluid container-padding">
  <div class="row">
    <div class="col-md-2">
      <jsp:include page="../include/studentSideBar.jsp"/>
    </div>
    <section>

    	<div class="col-md-10 area1">
			<div class="panel panel-default">
			    <div class="panel-heading">내 정보</div>
			    <div class="panel-body">
			       <table class="table table-bordered table-hover">
					<tr>
						<td>이름</td>
						<td>${student.name}</td>
					</tr>
					<tr>
						 <td>성별</td>
						 <td>${student.gender}</td>
					</tr>
						<td>생년월일</td>
						<td>${student.birth}</td>
					</tr>
					<tr>
						<td>이메일</td>
						<td>${student.email}</td>
					</tr>
					<tr>
						<td>캐쉬</td>
						<td>${student.myCash}</td>
					</tr>			          
			       </table>    
			    </div>
			 </div>	
			
    	</div>
    </section>
  </div>
    <div class="row">
    <div class="col-md-2"></div>
    <section>
    	<div class="col-md-10 area1">
			<div class="panel panel-default">
			    <div class="panel-heading flex-container">
			    	<span>수강중인 강의 리스트</span>
			    	<c:if test="${empty lectureStatus}">
					<select  id="lectureStatusSelect" class="form-select form-select-sm" 
							aria-label=".form-select-sm example" onchange="handleSelectChange(this.value)">
					  <option value="1" >강의 상태</option>
					  <option value="전체" >전체</option>
					  <option value="수강대기">수강대기</option>
					  <option value="수강중">수강중</option>
					  <option value="수강완료">수강완료</option>
					</select>
					</c:if>
			    </div>
			    <div class="panel-body">
			       <table class="table table-bordered table-hover">
			          <tr>
			            <td>강의이름</td>
			            <td>기간</td>
			            <td>요일</td>
			            <td>강의료</td>
			            <td>상태</td>
			          </tr>
			          <c:forEach var="lecture" items="${lectureList}">
			           <tr>
			            <td><a href="lectureOne?idx=${lecture.lectureNo}">${lecture.lectureName}</a></td>
			            <td>${lecture.startDate} ~ ${lecture.endDate}</td>
			            <td>${lecture.lectureDay}</td>
			            <td>${lecture.lecturePrice}</td>
			            <td>${lecture.lectureStatus}</td>
			           </tr>
			          </c:forEach>
			       </table>    
			    </div>
			 	<div class="panel-footer">Bacademy</div>
			 </div>	
    	</div>
    </section>
  </div>
</div>
	<!-- 실패 메세지를 출력(modal) -->
	<div id="myMessage" class="modal fade" role="dialog" >
	  <div class="modal-dialog">	
	    <!-- Modal content-->
	    <div id="messageType" class="modal-content panel-info">
	      <div class="modal-header panel-heading">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">${msgType}</h4>
	      </div>
	      <div class="modal-body">
	        <p>${msg}</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>	
	  </div>
	</div>  

</body>
</html>