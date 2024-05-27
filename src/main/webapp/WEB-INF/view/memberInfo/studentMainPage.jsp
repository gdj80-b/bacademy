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
    	window.location.href = "/studentMainPage?lectureStatus="+selectedValue;
    }
 </script>
<style>
* { padding: 0; margin: 0; }

html, body {
  height: 100%;
  background: #ffffff;
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
.panel.panel-default {
  text-align: center;
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
    <div class="col-md-10">
      <section class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading">공지사항</div>
                <div class="panel-body">
                   <table class="table table-bordered table-hover">
                      <tr>
                        <td>?</td>
                        <td>?</td>
                      </tr>
                       <tr>
                          <td></td>
                          <td></td>                      
                       </tr>                      
                   </table>    
                </div>
             </div>  
          </div>
        </div>
      </section>
    </div>
  </div>
  <div class="row">
    <div class="col-md-2"></div>
    <div class="col-md-10">
      <section class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-heading flex-container">
                    <span>수강 가능한 강의 리스트</span>
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
                        <td><a href="lectureOne?lectureNo=${lecture.lectureNo}">${lecture.lectureName}</a></td>
                        <td>${lecture.startDate} ~ ${lecture.endDate}</td>
                        <td>${lecture.lectureDay}</td>
                        <td>${lecture.lecturePrice}</td>
                        <td>${lecture.lectureStatus}</td>
                       </tr>
                      </c:forEach>
                   </table>    
                
                <nav aria-label="Page navigation example">
                  <ul class="pagination justify-content-center">
                    <c:if test="${paging.currentPage > 1 && paging.currentPage < paging.lastPage}">
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=1">&laquo;</a></li>
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.currentPage - 1}">&lsaquo;</a></li>
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.currentPage + 1}">&rsaquo;</a></li>
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.lastPage}">&raquo;</a></li>
                    </c:if>
                    
                    <c:if test="${paging.lastPage == 1}">
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
                    </c:if>
                    
                    <c:if test="${paging.currentPage == 1}">
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.currentPage + 1}">&rsaquo;</a></li>
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.lastPage}">&raquo;</a></li>
                    </c:if>
                    
                    <c:if test="${paging.currentPage == paging.lastPage}">
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=1">&laquo;</a></li>
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.currentPage - 1}">&lsaquo;</a></li>
                        <li class="page-item"><a class="page-link" href="/studentMainPage?currentPage=${paging.currentPage}">${paging.currentPage}</a></li>
                    </c:if>
                  </ul>
                </nav>
                </div>
                <div class="panel-footer">Bacademy</div>
             </div>
          </div>
        </div>
      </section>
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
