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
        
        String sql1 = "SELECT * FROM Temperature order by num desc";
         ResultSet rs1 = stmt.executeQuery(sql1);
          //db 값가져오기
         rs1.next();
         jsonObject.put("temp", rs1.getString(2));
         rs1.close();
         
         String sql2 = "SELECT * FROM humidity order by num desc";
         ResultSet rs2 = stmt.executeQuery(sql2);
          //db 값가져오기
         rs2.next();
         jsonObject.put("hum", rs2.getString(2));
         rs2.close();
         
         String sql3 = "SELECT * FROM CO2 order by num desc";
         ResultSet rs3 = stmt.executeQuery(sql3);
          //db 값가져오기
         rs3.next();
         jsonObject.put("co2", rs3.getString(2));
         rs3.close();
         
         String sql4 = "SELECT * FROM waterQuality order by num desc";
         ResultSet rs4 = stmt.executeQuery(sql4);
          //db 값가져오기
         rs4.next();
         jsonObject.put("wQual", rs4.getString(2));
         rs4.close();
         
         String sql5 = "SELECT * FROM waterTemp order by num desc";
         ResultSet rs5 = stmt.executeQuery(sql5);
          //db 값가져오기
         rs5.next();
         jsonObject.put("wTemp", rs5.getString(2));
         rs5.close();
         
         String sql6 = "SELECT * FROM waterLevel order by num desc";
         ResultSet rs6 = stmt.executeQuery(sql6);
          //db 값가져오기
         rs6.next();
         jsonObject.put("wLv", rs6.getString(2));
         rs6.close();
         
         String sql7 = "SELECT * FROM Illuminance order by num desc";
         ResultSet rs7 = stmt.executeQuery(sql7);
          //db 값가져오기
         rs7.next();
         jsonObject.put("illu", rs7.getString(2));
         rs7.close();
        
        out.print(jsonObject);
        stmt.close();
        conn.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    
%>
