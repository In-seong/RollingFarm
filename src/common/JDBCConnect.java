package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class JDBCConnect {
	public Connection con;		//데이터 베이스 연경
	public Statement stmt;		// 파라미터 없는 정적 쿼리문
	public PreparedStatement psmt;	// 파라미터 있는 동적 쿼리문
	public ResultSet rs;
	
	public String userName;
	public String userfile;
	public String check_Id;
	public String check_Pw;
	
	public JDBCConnect() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String url = "jdbc:mysql://3.37.167.68:3306/RollingFarm?useSSL=false";
			String id = "master_user";
			String pwd = "1234";
			
			con = DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공(기본생성자)");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DB 연결실패");
		}
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(con != null) con.close();
			
			System.out.println("JDBC 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
