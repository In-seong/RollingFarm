<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square-neo.css" rel="stylesheet">
<link rel="stylesheet" href="./resource/css/Login.css" />
<meta charset="UTF-8">
<title>마이팜 로그인</title>
</head>
<body>
	<jsp:include page="MenuBar.jsp"></jsp:include>
	
	<div class="content-wrapper">
	    <div class="login-wrapper">
	        <h1>Sign In</h1>
	        <form method="post" action="Login.do" id="login-form">
			<%
				String error = request.getParameter("error");
				if (error != null) {
			%>
				<a class="error">아이디와 비밀번호를 확인해 주세요</a>
			<% } %>
	            <input type="text" name="userId" placeholder="ID">
	            <input type="password" name="userPassword" placeholder="Password">
	            <label for="remember-check">
	                <input type="checkbox" id="remember-check" name="remember">&nbsp;로그인 상태 유지
	            </label>
	            <input type="submit" value="로그인">
	        <a class="login-footer" href="#">아이디 찾기</a>
	        <a class="login-footer">&nbsp;|&nbsp;</a>
	        <a class="login-footer" href="#">비밀번호 찾기</a>
	        <a class="login-footer signUp" id="signUp" href="AddMember.jsp">회원가입</a>
	        </form>
	    </div>
	</div>
	
	<%
    // 로그인 정보가 있는 경우 자동으로 로그인 처리
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userId") && cookie.getValue() != null) {
                String userId = cookie.getValue();
                // userId를 사용하여 자동 로그인 처리
            }
        }
    }

    // 로그인 시 쿠키에 정보 저장
    if (request.getParameter("remember") != null) {
        String userId = request.getParameter("userId");
        Cookie cookie = new Cookie("userId", userId);
        cookie.setMaxAge(60 * 60 * 24 * 30); // 쿠키 유효기간 30일
        response.addCookie(cookie);
    } else {
        // 체크박스가 해제되어 있으면 쿠키에서 로그인 정보 삭제
        Cookie cookie = new Cookie("userId", null);
        cookie.setMaxAge(0);
        response.addCookie(cookie);
    }
%>
</body>
</html>