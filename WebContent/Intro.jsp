<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="./resource/css/Intro.css" />
<meta charset="UTF-8">
<title>소개</title>
</head>
<body>
	<%@ include file="MenuBar.jsp" %>
	
	<div class="container">
		<div class="album-wrapper">
			<section>
		        원본이미지
		        <img src="./resource/images/Donut.jpg" id="slider">
		        썸네일
		        <ul class="navigation">
		            <li id="m1" onclick="imgslider('./resource/images/Donut.jpg', '회전체 구상')"><img src="./resource/images/Donut.jpg"></li>
		            <li onclick="imgslider('./resource/images/config.png', '롤링팜 구성')"><img src="./resource/images/config.png"></li>
		            <li onclick="imgslider('./resource/images/Donutcreate.jpg', '회전체 제작')"><img src="./resource/images/Donutcreate.jpg"></li>
		            <li onclick="imgslider('./resource/images/RollingFarm.jpg', '롤링팜')"><img src="./resource/images/RollingFarm.jpg"></li>
		        </ul>
		        <h2 id="title">회전체 구상</h2>
    		</section>
		</div>
	</div>
	<script type="text/javascript" src="./resource/js/Intro.js"></script>
</body>
</html>