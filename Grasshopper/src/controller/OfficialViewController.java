package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dto.Official;
import service.OfficialService;
import service.OfficialServiceImpl;

/**
 * Servlet implementation class OfficialViewController
 */
@WebServlet("/official/view")
public class OfficialViewController extends HttpServlet {
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
		
		//****여기부터*******
		//조회결과 MODEL값 전달
		req.setAttribute("viewBoard", viewBoard);

		//닉네임 전달
		req.setAttribute("nick", boardService.getNick(viewBoard));

		//첨부파일 정보 조회
		BoardFile boardFile = boardService.viewFile(viewBoard);

		//첨부파일 정보 MODEL값 전달
		req.setAttribute("boardFile", boardFile);

		//VIEW 지정 및 응답 - forward
		req.getRequestDispatcher("/WEB-INF/views/board/view.jsp").forward(req, resp);	
		
	}
	
	
	
}
