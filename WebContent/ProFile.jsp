<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="./resource/css/ProFile.css" />
<meta charset="UTF-8">
<title>내 정보</title>
</head>
<body>
	<%@ include file="MenuBar.jsp" %>
	<div class="container-wrapper">
		<div class="ProFile-wrapper">
		
			<div class="ProFile-header">
				<div class="ProFile-image"><img src="./upload/<%=session.getAttribute("fileName") %>" style="width: 100%; height: 100%; border-radius: 50%; overflow: hidden;"></div>
				<div class="ProFile-name">
					<h2>${dto.getName() }</h2>
					<a>${dto.getId() }</a>
				</div>
			</div>
			
			<div class="ProFile-Content">
				<img src="./resource/images/mail.png" class="mail-img">
					<a>${dto.getEmail() }</a>
				<img src="./resource/images/tel.png" class="tel-img">
					<a>${dto.getTell() }</a>
			</div>
			
			<input type="button" class="edit" onClick="location.href='EditMemberCheck.jsp'" value="수정">
			<input type="button" class="delete" onclick="location.href='DeleteMember.jsp'" value="탈퇴">
		</div>
	</div>
</body>
</html>