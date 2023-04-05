package mvc.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mvc.model.MemberDAO;
import mvc.model.MemberDTO;

@WebServlet("*.do")
@MultipartConfig(fileSizeThreshold = 1024*1024, maxFileSize = 1024*1024*5, maxRequestSize = 1024*1024*5*5)
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String UPLOAD_DIR = "upload_files";
	MemberDTO dto;
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		
		if(command.equals("/AddMember.do")) {
			if(addMember(request) == 0) {
				request.getRequestDispatcher("./AddMember.jsp?addPassCheck=1").forward(request, response);
			} else { 
				request.getRequestDispatcher("./Login.jsp").forward(request, response);
			}
		}
		if(command.equals("/Login.do")) {
			dto = loginAction(request);
			if(dto.getId() != null) {
				session.setAttribute("dto", dto);
				session.setAttribute("user_id", dto.getId());
				session.setAttribute("fileName", dto.getFilename());
				request.getRequestDispatcher("./Intro.jsp").forward(request, response);
			}else {
				request.getRequestDispatcher("./Login.jsp?error=1").forward(request, response);
			}
		}
		if(command.equals("/Edit.do")) {
			if(EditMemberAction(request) == 0) {
				request.getRequestDispatcher("./EditMember.jsp?check=1").forward(request, response);
			} else {
				session.setAttribute("dto", dto);
				request.getRequestDispatcher("./ProFile.jsp").forward(request, response);
			}
		}
		if(command.equals("/EditCheck.do")) {
			if(LoginCheckAction(request) == 0) {
				request.getRequestDispatcher("./EditMemberCheck.jsp?passError=1").forward(request, response);
			} else {
				request.getRequestDispatcher("./EditMember.jsp").forward(request, response);
			}
		}
		if(command.equals("/Delete.do")) {
			if(LoginCheckAction(request) == 0) {
				request.getRequestDispatcher("./DeleteMember.jsp?passError=1").forward(request, response);
			} else {
				DeleteMemberAction(request);
				session.invalidate();
				request.getRequestDispatcher("./Intro.jsp").forward(request, response);
			}
		}
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	// 회원 추가
	public int addMember(HttpServletRequest request) {
		
		ServletContext scontext = getServletContext();
		//String url2= "C:\\jspstudy\\RollingFarm\\WebContent\\upload";
		
		String url = scontext.getRealPath("/upload");
		int maxSize = 5 * 1024 * 1024 ;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multi;
		int result = 0;
		try {
			multi = new MultipartRequest(request, url, maxSize,"utf-8", policy);
			MemberDAO dao = new MemberDAO();
			String id = multi.getParameter("userId");
			String pw = multi.getParameter("userPassword");
			String pwCheck = multi.getParameter("userPasswordCheck");
			String name = multi.getParameter("userName");
			String tel = multi.getParameter("userTel");
			String userEmail = multi.getParameter("userEmail");
			String emailDomain = multi.getParameter("emailDomain");
			String email = userEmail + emailDomain;
			if(pw.equals(pwCheck)) {
				result = 1;
				dao.makeMember(id, pw, name, tel, email);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
			return result;
	}
	
	// 로그인 확인
	public MemberDTO loginAction(HttpServletRequest request) {
		MemberDAO dao = new MemberDAO();
		MemberDTO dto = new MemberDTO();
		String id = request.getParameter("userId");
		String pass = request.getParameter("userPassword");
		dto = dao.loginMember(id, pass);
		return dto;
	}
	
	// 회원 정보 수정
	public int EditMemberAction(HttpServletRequest request) {
//		MemberDAO dao = new MemberDAO();
//		String id = dto.getId();
//		String pass = dto.getPassword();
//		String name = request.getParameter("userName");
//		String tell = request.getParameter("userTell");
//		String email = request.getParameter("userEmail");
//		dao.EditMember(id, pass, name, tell, email);
		
		ServletContext scontext = getServletContext();
		//String url2= "C:\\jspstudy\\RollingFarm\\WebContent\\upload";
		
		int result = 0;
		String url = scontext.getRealPath("/upload");
		int maxSize = 5 * 1024 * 1024 ;
		DefaultFileRenamePolicy policy = new DefaultFileRenamePolicy();
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, url, maxSize,"utf-8", policy);
			MemberDAO dao = new MemberDAO();
			String id = dto.getId();
			String pass = multi.getParameter("newPassword");
			String passCheck = multi.getParameter("newPasswordCheck");
			String name = multi.getParameter("userName");
			String tel = multi.getParameter("userTel");
			String email = multi.getParameter("userEmail");
			String filename = multi.getFilesystemName("userImage");
			if(pass.equals(passCheck)) {
				result = 1;
				dao.EditMember(id, pass, name, tel, email, filename);
				dto = dao.loginMember(id, pass);
			}
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("회원정보 수정 실패");
		}
		
		return result;
	}
	
	// 회원 정보 삭제
	public void DeleteMemberAction(HttpServletRequest request) {
		MemberDAO dao = new MemberDAO();
		String id = dto.getId();
		String pass = request.getParameter("userPassword");
		
		dao.DeleteMember(id, pass);
	}
	
	// 비밀번호 확인
	public int LoginCheckAction(HttpServletRequest request) {
		MemberDAO dao = new MemberDAO();
		String id = dto.getId();
		String pass = request.getParameter("userPassword");
		
		int result = dao.PasswordCheck(id, pass);
		return result;
	}
}
