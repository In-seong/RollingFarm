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

		JSONObject jsonObject = new JSONObject();
		
		
		 String sql1 = "SELECT * FROM airConSwitch order by num desc";
	     ResultSet rs1 = stmt.executeQuery(sql1);
	      //db 값가져오기
	     rs1.next();
	     jsonObject.put("airAC", rs1.getInt(2));
	     rs1.close();
	     
	     String sql2 = "SELECT * FROM heaterSwitch order by num desc";
	     ResultSet rs2 = stmt.executeQuery(sql2);
	      //db 값가져오기
	     rs2.next();
	     jsonObject.put("heaterAC", rs2.getInt(2));
	     rs2.close();
	     
	     String sql3 = "SELECT * FROM fanSwitch order by num desc";
	     ResultSet rs3 = stmt.executeQuery(sql3);
	      //db 값가져오기
	     rs3.next();
	     jsonObject.put("fanAC", rs3.getInt(2));
	     rs3.close();
	     
	     String sql4 = "SELECT * FROM LEDSwitch order by num desc";
	     ResultSet rs4 = stmt.executeQuery(sql4);
	     rs4.next();
	     jsonObject.put("LEDAC", rs4.getInt(2));
	     rs4.close();
	     
	     String sql5 = "SELECT * FROM pumpSwitch order by num desc";
	     ResultSet rs5 = stmt.executeQuery(sql5);
	      //db 값가져오기
	     rs5.next();
	     jsonObject.put("pumpAC", rs5.getInt(2));
	     rs5.close();
	     
        out.print(jsonObject);
        
        stmt.close();
        conn.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    
%>
