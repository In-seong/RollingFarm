<%@page import="org.apache.tomcat.util.buf.StringUtils"%>
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
   String date = (String)request.getParameter("date");
    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://3.37.167.68:3306/RollingFarm";
    String id = "master_user";
    String password = "1234";
   if(date != null){
      
    try {
        Class.forName(driver);
        Connection conn = DriverManager.getConnection(url, id, password);
        //JSON
        JSONArray data = new JSONArray();

      
      //온도 24시간 가져오기
        String sql1 = "SELECT * FROM Temperature where date like '"+date+" %00___' order by date";
        Statement stmt1 = conn.createStatement();
         ResultSet rs1 = stmt1.executeQuery(sql1);
      // 데이터를 담을 JSONArray 객체 생성

         JSONObject temp2 = new JSONObject();
         // ResultSet에서 데이터를 추출해서 JSONArray에 추가
         while (rs1.next()) {
           JSONObject temp = new JSONObject();
           temp.put("value", rs1.getString(2));
           temp2.put("value", rs1.getString(2));
           data.add(temp);
         }
         data.add(temp2);
         rs1.close();
         System.out.print(data);
         
         //습도 24시간 담기
         String sql2 = "SELECT * FROM humidity where date like '"+date+" %00___' order by date";
        Statement stmt2 = conn.createStatement();
         ResultSet rs2 = stmt2.executeQuery(sql2);
         // 데이터를 담을 JSONArray 객체 생성
         JSONObject hum2 = new JSONObject();
         // ResultSet에서 데이터를 추출해서 JSONArray에 추가
         while (rs2.next()) {
           JSONObject hum = new JSONObject();
           hum.put("value1", rs2.getString(2));
           hum2.put("value1", rs2.getString(2));
           data.add(hum);
         }
         data.add(hum2);
         rs2.close();
         System.out.print("2");
         
         //Co2 24시간 담기
         String sql3 = "SELECT * FROM waterLevel where date like '"+date+" %00___' order by date";
        Statement stmt3 = conn.createStatement();
         ResultSet rs3 = stmt3.executeQuery(sql3);
         // 데이터를 담을 JSONArray 객체 생성
         JSONObject wLv2 = new JSONObject();
         // ResultSet에서 데이터를 추출해서 JSONArray에 추가
         while (rs3.next()) {
           JSONObject wLv = new JSONObject();
           wLv.put("value2", rs3.getString(2));
           wLv2.put("value2", rs3.getString(2));
           data.add(wLv);
         }
         data.add(wLv2);
         rs3.close();
         
        // JSONArray를 JSON 문자열로 변환하여 출력
        System.out.print(data);
        out.print(data.toString());
        
        stmt1.close();
        stmt2.close();
        stmt3.close();
        conn.close();
        
    } catch (Exception e) {
        e.printStackTrace();
    }
   }
    
    
%>