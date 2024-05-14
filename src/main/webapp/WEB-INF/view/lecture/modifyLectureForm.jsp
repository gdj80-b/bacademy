<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강의 수정 폼</title>
</head>
<body>
	<h1>강의 수정</h1>
	<c:forEach var="vo" items="${lectureOneList}">
	<form action="/lecture/modifyLecture?lectureNo=${vo.lectureNo}" method="post">
		<div>	
			과목 : 
			<c:choose>
				<c:when test="${vo.category eq 'HTML/CSS'}">
					<select name="categoryNo">
						<option value="1" selected="selected">HTML/CSS</option>
						<option value="2">JAVA</option>
						<option value="3">Spring</option>
						<option value="4">JavaScript</option>
						<option value="5">React</option>
						<option value="6">Node.js</option>
					</select>
				</c:when>
				<c:when test="${vo.category eq 'JAVA'}">
					<select name="categoryNo">
						<option value="1">HTML/CSS</option>
						<option value="2" selected="selected">JAVA</option>
						<option value="3">Spring</option>
						<option value="4">JavaScript</option>
						<option value="5">React</option>
						<option value="6">Node.js</option>
					</select>
				</c:when>
				<c:when test="${vo.category eq 'Spring'}">
					<select name="categoryNo">
						<option value="1">HTML/CSS</option>
						<option value="2">JAVA</option>
						<option value="3" selected="selected">Spring</option>
						<option value="4">JavaScript</option>
						<option value="5">React</option>
						<option value="6">Node.js</option>
					</select>
				</c:when>
				<c:when test="${vo.category eq 'JavaScript'}">
					<select name="categoryNo">
						<option value="1">HTML/CSS</option>
						<option value="2">JAVA</option>
						<option value="3">Spring</option>
						<option value="4" selected="selected">JavaScript</option>
						<option value="5">React</option>
						<option value="6">Node.js</option>
					</select>
				</c:when>
				<c:when test="${vo.category eq 'React'}">
					<select name="categoryNo">
						<option value="1" >HTML/CSS</option>
						<option value="2">JAVA</option>
						<option value="3">Spring</option>
						<option value="4">JavaScript</option>
						<option value="5" selected="selected">React</option>
						<option value="6">Node.js</option>
					</select>
				</c:when>
				<c:otherwise>
					<select name="categoryNo">
						<option value="1">HTML/CSS</option>
						<option value="2">JAVA</option>
						<option value="3">Spring</option>
						<option value="4">JavaScript</option>
						<option value="5">React</option>
						<option value="6" selected="selected">Node.js</option>
					</select>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			강의명 : 
			<input type="text" name="lectureName" required="required" value="${vo.lectureName}">
		</div>
		<div>
			강사 : 
			<c:choose>
				<c:when test="${vo.name eq '송은택'}">
					<select name="id">
						<option value="blue" selected="selected">송은택</option>
						<option value="green">장동준</option>
						<option value="navy">류성완</option>
						<option value="orange">김태균</option>
						<option value="purple">윤혜정</option>
						<option value="red">박민아</option>
						<option value="teacher">강사</option>
						<option value="white">최유리</option>
						<option value="yellow">김예리</option>
					</select>
				</c:when>
				<c:when test="${vo.name eq '장동준'}">
					<select name="id">
						<option value="blue">송은택</option>
						<option value="green" selected="selected">장동준</option>
						<option value="navy">류성완</option>
						<option value="orange">김태균</option>
						<option value="purple">윤혜정</option>
						<option value="red">박민아</option>
						<option value="teacher">강사</option>
						<option value="white">최유리</option>
						<option value="yellow">김예리</option>
					</select>
				</c:when>
				<c:when test="${vo.name eq '류성완'}">
					<select name="id">
						<option value="blue">송은택</option>
						<option value="green">장동준</option>
						<option value="navy" selected="selected">류성완</option>
						<option value="orange">김태균</option>
						<option value="purple">윤혜정</option>
						<option value="red">박민아</option>
						<option value="teacher">강사</option>
						<option value="white">최유리</option>
						<option value="yellow">김예리</option>
					</select>
				</c:when>
				<c:when test="${vo.name eq '김태균'}">
					<select name="id">
						<option value="blue">송은택</option>
						<option value="green">장동준</option>
						<option value="navy">류성완</option>
						<option value="orange" selected="selected">김태균</option>
						<option value="purple">윤혜정</option>
						<option value="red">박민아</option>
						<option value="teacher">강사</option>
						<option value="white">최유리</option>
						<option value="yellow">김예리</option>
					</select>
				</c:when>
				<c:when test="${vo.name eq '윤혜정'}">
					<select name="id">
						<option value="blue">송은택</option>
						<option value="green">장동준</option>
						<option value="navy">류성완</option>
						<option value="orange">김태균</option>
						<option value="purple" selected="selected">윤혜정</option>
						<option value="red">박민아</option>
						<option value="teacher">강사</option>
						<option value="white">최유리</option>
						<option value="yellow">김예리</option>
					</select>
				</c:when>
				<c:when test="${vo.name eq '박민아'}">
					<select name="id">
						<option value="blue">송은택</option>
						<option value="green">장동준</option>
						<option value="navy">류성완</option>
						<option value="orange">김태균</option>
						<option value="purple">윤혜정</option>
						<option value="red" selected="selected">박민아</option>
						<option value="teacher">강사</option>
						<option value="white">최유리</option>
						<option value="yellow">김예리</option>
					</select>
				</c:when>
				<c:when test="${vo.name eq '강사'}">
					<select name="id">
						<option value="blue">송은택</option>
						<option value="green">장동준</option>
						<option value="navy">류성완</option>
						<option value="orange">김태균</option>
						<option value="purple">윤혜정</option>
						<option value="red">박민아</option>
						<option value="teacher" selected="selected">강사</option>
						<option value="white">최유리</option>
						<option value="yellow">김예리</option>
					</select>
				</c:when>
				<c:when test="${vo.name eq '최유리'}">
					<select name="id">
						<option value="blue">송은택</option>
						<option value="green">장동준</option>
						<option value="navy">류성완</option>
						<option value="orange">김태균</option>
						<option value="purple">윤혜정</option>
						<option value="red">박민아</option>
						<option value="teacher">강사</option>
						<option value="white" selected="selected">최유리</option>
						<option value="yellow">김예리</option>
					</select>
				</c:when>
				<c:otherwise>
					<select name="id">
						<option value="blue">송은택</option>
						<option value="green">장동준</option>
						<option value="navy">류성완</option>
						<option value="orange">김태균</option>
						<option value="purple">윤혜정</option>
						<option value="red">박민아</option>
						<option value="teacher">강사</option>
						<option value="white">최유리</option>
						<option value="yellow" selected="selected">김예리</option>
					</select>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			시작일 : 
			<input type="date" name="startDate" required="required" value="${vo.startDate}">
		</div>
		<div>
			종료일 : 
			<input type="date" name="endDate" required="required" value="${vo.endDate}">
		</div>
		<div>
			강의요일 : 
			<c:choose>
				<c:when test="${vo.lectureDay eq '월수'}">
					<input type="radio" name="lectureDay" value="월수" required="required" checked="checked"> 월수
					<input type="radio" name="lectureDay" value="화목" required="required"> 화목
					<input type="radio" name="lectureDay" value="금" required="required"> 금
				</c:when>
				<c:when test="${vo.lectureDay eq '화목'}">
					<input type="radio" name="lectureDay" value="월수" required="required"> 월수
					<input type="radio" name="lectureDay" value="화목" required="required" checked="checked"> 화목
					<input type="radio" name="lectureDay" value="금" required="required"> 금
				</c:when>
				<c:otherwise>
					<input type="radio" name="lectureDay" value="월수" required="required"> 월수
					<input type="radio" name="lectureDay" value="화목" required="required"> 화목
					<input type="radio" name="lectureDay" value="금" required="required" checked="checked"> 금
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			강의시간 : 
			<c:choose>
				<c:when test="${vo.lectureTime eq '9시-17시'}">
					<input type="radio" name="lectureTime" value="9시-17시" required="required" checked="checked"> 9시-17시
					<input type="radio" name="lectureTime" value="9시-18시" required="required"> 9시-18시
				</c:when>
				<c:otherwise>
					<input type="radio" name="lectureTime" value="9시-17시" required="required"> 9시-17시
					<input type="radio" name="lectureTime" value="9시-18시" required="required" checked="checked"> 9시-18시
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			강의실 : 
			<c:choose>
				<c:when test="${vo.roomNum eq '101'}">
					<select name="roomNum">
						<option value="101" selected="selected">101</option>
						<option value="102">102</option>
						<option value="103">103</option>
						<option value="104">104</option>
						<option value="105">105</option>
						<option value="106">106</option>
						<option value="107">107</option>
					</select>
				</c:when>
				<c:when test="${vo.roomNum eq '102'}">
					<select name="roomNum">
						<option value="101">101</option>
						<option value="102" selected="selected">102</option>
						<option value="103">103</option>
						<option value="104">104</option>
						<option value="105">105</option>
						<option value="106">106</option>
						<option value="107">107</option>
					</select>
				</c:when>
				<c:when test="${vo.roomNum eq '103'}">
					<select name="roomNum">
						<option value="101">101</option>
						<option value="102">102</option>
						<option value="103" selected="selected">103</option>
						<option value="104">104</option>
						<option value="105">105</option>
						<option value="106">106</option>
						<option value="107">107</option>
					</select>
				</c:when>
				<c:when test="${vo.roomNum eq '104'}">
					<select name="roomNum">
						<option value="101">101</option>
						<option value="102">102</option>
						<option value="103">103</option>
						<option value="104" selected="selected">104</option>
						<option value="105">105</option>
						<option value="106">106</option>
						<option value="107">107</option>
					</select>
				</c:when>
				<c:when test="${vo.roomNum eq '105'}">
					<select name="roomNum">
						<option value="101">101</option>
						<option value="102">102</option>
						<option value="103">103</option>
						<option value="104">104</option>
						<option value="105" selected="selected">105</option>
						<option value="106">106</option>
						<option value="107">107</option>
					</select>
				</c:when>
				<c:when test="${vo.roomNum eq '106'}">
					<select name="roomNum">
						<option value="101">101</option>
						<option value="102">102</option>
						<option value="103">103</option>
						<option value="104">104</option>
						<option value="105">105</option>
						<option value="106" selected="selected">106</option>
						<option value="107">107</option>
					</select>
				</c:when>
				<c:otherwise>
					<select name="roomNum">
						<option value="101">101</option>
						<option value="102">102</option>
						<option value="103">103</option>
						<option value="104">104</option>
						<option value="105">105</option>
						<option value="106">106</option>
						<option value="107" selected="selected">107</option>
					</select>
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			강의료 : 
			<input type="number" name="lecturePrice" required="required" value="${vo.lecturePrice}">원
		</div>
		<button type="submit">수정하기</button>
	</form>
	</c:forEach>
</body>
</html>