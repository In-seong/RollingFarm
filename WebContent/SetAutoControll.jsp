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
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://3.37.167.68:3306/RollingFarm";
    String id = "master_user";
    String password = "1234";

    try {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, id, password);
        Statement stmt = conn.createStatement();
      
       String sql1 = "insert into airConSwitch (status,date) value (1,now())";
        stmt.executeUpdate(sql1);
        
        String sql2 = "insert into heaterSwitch (status,date) value (1,now())";
        stmt.executeUpdate(sql2);
        
        String sql3 = "insert into fanSwitch (status,date) value (1,now())";
        stmt.executeUpdate(sql3);
        
        String sql4 = "insert into LEDSwitch (status,date) value (1,now())";
        stmt.executeUpdate(sql4);
        
        String sql5 = "insert into pumpSwitch (status,date) value (1,now())";
        stmt.executeUpdate(sql5);
        stmt.close();
        conn.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    
%>