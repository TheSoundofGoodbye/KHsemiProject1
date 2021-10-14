package custom.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import custom.service.CustomService;
import custom.service.CustomServiceImpl;


/**
 * Servlet implementation class CustomWriteController
 */
@WebServlet("/custom/write")
public class CustomWriteController extends HttpServlet {
private static final long serialVersionUID = 1L;
    
	CustomService customService = new CustomServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/custom/write [GET]");
		
		//세션 객체 생성
		HttpSession session = req.getSession();
		
		//로그인 되어있지 않으면 리다이렉트 (일단 disable)
//		if( session.getAttribute("login")== null || !(boolean)session.getAttribute("login")) {
//			resp.sendRedirect("/");
//			return;
//		}
		
		//현재 session에 저장된 key, value모두 출력
		Enumeration<String> attributes = req.getSession().getAttributeNames();
		while (attributes.hasMoreElements()) {
		    String attribute = (String) attributes.nextElement();
		    System.out.println(attribute+" : "+req.getSession().getAttribute(attribute));
		}		
		
		System.out.println("[TEST] session : " + session);
		
		req.getRequestDispatcher("/WEB-INF/views/board/custom_write.jsp").forward(req, resp);
	
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/custom/write [POST]");
		
		//세션 객체 생성
		HttpSession session = req.getSession();
//		
////		Custom custom = new Custom();
//
//		custom.setTitle(req.getParameter("title"));
//		custom.setContent(req.getParameter("content"));
//		
//		custom.setUserid((String)session.getAttribute("userid"));
//		
//		System.out.println(custom);
//		
//		//게시글 등록 메소드
////		customService.write(custom);
//		
//		//---------------------------------------
//		
//		System.out.println("첨부파일 업로드 시 custom : " + custom);
//		
//		//파일 첨부 + 게시글
//		customService.write(req,resp);
//				
//		
		resp.sendRedirect("/custom/list");
		
	}
	
	
}
