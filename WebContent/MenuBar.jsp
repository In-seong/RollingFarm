<%@page import="mvc.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="./resource/css/Menu.css" />
<div>
	<div class="list-wrapper">
		<img src="./resource/images/logoRoll.png" onclick="location.href='Intro.jsp'" style="cursor:pointer;">
		<c:choose>
			<c:when test="${empty sessionScope.user_id}">
		<ul class="list-header">
			<li class="menu" onclick="location.href='Intro.jsp'"><a class="SMN_effect-34">Home</a>
    		<li class="menu" onclick="location.href='Login.jsp'"><a class="SMN_effect-34">DashBoard</a></li>
		</ul>
	</div>

	<div class="header-wrapper">
			<ul class="login-header">
				<li class="login-menu"><a href="Login.jsp">로그인</a></li>
			</ul>
		</c:when>
		<c:otherwise>
		<ul class="list-header">
			<li class="menu" onclick="location.href='Intro.jsp'"><a class="SMN_effect-34">Home</a></li>
    		<li class="menu" onclick="location.href='DashBoardMain.jsp'"><a class="SMN_effect-34">DashBoard</a></li>
		</ul>
	</div>

	<div class="header-wrapper">
			<ul class="login-header">
				<li class="login-menu"><a href="ProFile.jsp">내정보</a></li>
					<li class="login-menu"><a href="Logout.jsp">로그아웃</a></li>
			</ul>
		</c:otherwise>
		</c:choose>
		<span class="list-footer">&copy;Design by Guys' Garage</span>
	</div>
</div>
