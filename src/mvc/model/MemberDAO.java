package mvc.model;

import common.JDBCConnect;

public class MemberDAO extends JDBCConnect{
	
	// 회원가입
	public void makeMember(String Id, String Pw, String name, String tel, String email) {
		String sql = "insert into user values(?,?,?,?,?,null,now())";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, Id);
			psmt.setString(2, Pw);
			psmt.setString(3, name);
			psmt.setString(4, tel);
			psmt.setString(5, email);
			
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원가입 실패");
		}
		close();
	}
	
	// 로그인
	public MemberDTO loginMember(String id, String pass) {
		MemberDTO dto = new MemberDTO();
		String sql = "select * from user";
		try {
			psmt = con.prepareStatement(sql);
			rs = psmt.executeQuery();
			while(rs.next()) {
				if(rs.getString(1).equals(id) && rs.getString(2).equals(pass)) {
					dto.setId(rs.getString(1));
					dto.setPassword(rs.getString(2));
					dto.setName(rs.getString(3));
					dto.setTell(rs.getString(4));
					dto.setEmail(rs.getString(5));
					dto.setFilename(rs.getString(6));
					break;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 실패");
		}
		return dto;
	}
	
	// 회원정보 수정
	public void EditMember(String id, String pass, String name, String tel, String email, String filename ) { 
		String sql = "update user set user_password=?, user_name=?, user_phone=?, user_email=?, user_image=? where user_id=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, pass);
			psmt.setString(2, name);
			psmt.setString(3, tel);
			psmt.setString(4, email);
			psmt.setString(5, filename);
			psmt.setString(6, id);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원정보 수정 실패");
		}
	}
	
	// 회원 탈퇴
	public void DeleteMember(String id, String pass) {
		String sql = "delete from user where user_id=? and user_password=?";
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			psmt.setString(2, pass);
			psmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("회원탈퇴 실패");
		}
	}
	
	// Edit, Delete 로그인 체크
	public int PasswordCheck(String id, String pass) {
		String sql = "select user_password from user where user_id=?";
		int result = 0;
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();
			if(rs.next()) {
				String userPass = rs.getString(1);
				if(userPass.equals(pass)) {
					result = 1;
				}
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("로그인 체크 실패");
		}
		
		return result;
	}
}
