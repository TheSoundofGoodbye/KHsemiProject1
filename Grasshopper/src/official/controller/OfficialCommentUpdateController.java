package official.controller;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import official.dto.OfficialComment;
import official.service.OfficialService;
import official.service.OfficialServiceImpl;

/**
 * Servlet implementation class OfficialCommentUpdateController
 */
@WebServlet("/official/comment/update")
public class OfficialCommentUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private OfficialService officialService = new OfficialServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/official/comment/update [GET] Why you see me?");

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/official/comment/update [POST]");
		
		//세션 객체 생성
		HttpSession session = req.getSession();

		OfficialComment officialComment = new OfficialComment();
		
		//수정할 comment의 reply_no 수신
		officialComment.setOfficial_reply_no(Integer.parseInt(req.getParameter("official_reply_no")));

		System.out.println(officialComment);
		
		//코멘트 업데이트
//		officialSevice.updateComment(officialComment);
		
		//코멘트+파일업데이트 (disabled)
//		boardService.update(req, resp);
		
		resp.sendRedirect("/board/list");
		
	}
}
	
	
	
