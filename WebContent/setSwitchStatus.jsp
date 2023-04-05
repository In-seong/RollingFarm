<%@page import="java.io.Console"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String deviceMC = request.getParameter("deviceMC");
	int statusMC = Integer.parseInt(request.getParameter("statusMC"));
	
	System.out.print(deviceMC);
	System.out.print(statusMC);
	
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://3.37.167.68:3306/RollingFarm";
    String id = "master_user";
    String password = "1234";

    try {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, id, password);
		String sql = "insert into "+deviceMC+" (status, date) values (?,now())";
        
		PreparedStatement psmt = conn.prepareStatement(sql);
		psmt.setInt(1, statusMC);
		
		psmt.executeUpdate();
        
        psmt.close();
        conn.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    
%>
