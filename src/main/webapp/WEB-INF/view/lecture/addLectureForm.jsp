<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>김형호</title>
</head>
<body>
	<h1>강의등록</h1>
	<form action="/lecture/addLecture" method="post">
		<div>	
			과목 : 
			<select name="categoryNo">
				<option value="1">HTML/CSS</option>
				<option value="2">JAVA</option>
				<option value="3">Spring</option>
				<option value="4">JavaScript</option>
				<option value="5">React</option>
				<option value="6">Node.js</option>
			</select>
		</div>
		<div>
			강의명 : 
			<input type="text" name="lectureName" required="required">
		</div>
		<div>
			강사 : 
			<select name="id">
				<option value="blue">송은택</option>
				<option value="green">장동준</option>
				<option value="navy">류성완</option>
				<option value="orange">김태균</option>
				<option value="purple">윤혜정</option>
				<option value="red">박민아</option>
				<option value="teacher">강사</option>
				<option value="white">최유리</option>
				<option value="yellow">김예리</option>
			</select>
		</div>
		<div>
			시작일 : 
			<input type="date" name="startDate" required="required">
		</div>
		<div>
			종료일 : 
			<input type="date" name="endDate" required="required">
		</div>
		<div>
			강의요일 : 
			<input type="radio" name="lectureDay" value="월수" required="required"> 월수
			<input type="radio" name="lectureDay" value="화목" required="required"> 화목
			<input type="radio" name="lectureDay" value="금" required="required"> 금
		</div>
		<div>
			강의시간 : 
			<input type="radio" name="lectureTime" value="9시-17시" required="required"> 9시-17시
			<input type="radio" name="lectureTime" value="9시-18시" required="required"> 9시-18시
		</div>
		<div>
			강의실 : 
			<select name="roomNum">
				<option value="101">101</option>
				<option value="102">102</option>
				<option value="103">103</option>
				<option value="104">104</option>
				<option value="105">105</option>
				<option value="106">106</option>
				<option value="107">107</option>
			</select>
		</div>
		<div>
			강의료 : 
			<input type="number" name="lecturePrice" required="required">원
		</div>
		<button type="submit">등록하기</button>
	</form>
</body>
</html>