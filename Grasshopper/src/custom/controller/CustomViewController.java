package custom.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import official.dto.Official;
import official.dto.OfficialComment;
import official.service.OfficialService;
import official.service.OfficialServiceImpl;

/**
 * Servlet implementation class OfficialViewController
 */
@WebServlet("/custom/view")
public class CustomViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//서비스 객체 생성
	OfficialService officialService = new OfficialServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/official/view [GET]");
		
		//전달 파라미터 얻기 - official_cocktail_no
		Official official_no = officialService.getOfficial_no(req);
	
		//상세보기 결과 조회
		Official viewOfficial = officialService.view(official_no);
		
		//official 객체 전달 테스트
//		System.out.println("[TEST] viewOFficial : " + viewOfficial);
		
		//특정 레시피 조회결과 MODEL값 전달
		req.setAttribute("viewOfficial", viewOfficial);
		
		//-------------------------------
		//user_no로 유저정보 조회 및 전달 (오피셜 레시피에선 필요하지 않음)
//		req.setAttribute("nick", boardService.getNick(viewOfficial));
		
		//댓글정보 조회
//		OfficialComment comments = officialService.getComment(viewOfficial;)

		//첨부파일 정보 조회 (오피셜에선 필요하지 않음)
//		BoardFile boardFile = boardService.viewFile(viewOfficial);

		//첨부파일 정보 MODEL값 전달 (오피셜에선 필요하지 않음)
//		req.setAttribute("boardFile", boardFile);
	

		//VIEW 지정 및 응답 - forward
		req.getRequestDispatcher("/WEB-INF/views/board/official_view.jsp").forward(req, resp);	
		
	}
	
	
	
}
