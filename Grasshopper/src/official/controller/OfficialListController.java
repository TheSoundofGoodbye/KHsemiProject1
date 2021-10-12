package official.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import official.dto.Official;
import official.service.OfficialService;
import official.service.OfficialServiceImpl;
import util.Paging;

/**
 * Servlet implementation class OfficialSearchController
 */
@WebServlet("/official/list")
public class OfficialListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	OfficialService officialService = new OfficialServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/official/list [GET]");
		
		String search = null;
		Paging paging;
		List<Official> list;
		
		//검색어 전달받기
		search = req.getParameter("search");
		
		//get 메소드로 넘어온 파라미터확인
//		System.out.println("[TEST] search(get) : " + search);
		
//		List<Official> list = officialService.getList(paging, search); // 페이징 정보를 입력하여 조회
				
		//요청 파라미터를 전달하여 paging 객체생성
//		paging = officialService.getPaging(req);
//		list = officialService.getList(paging); // 페이징 정보를 입력하여 조회
		
		paging = officialService.getPaging(req, search);
		list = officialService.getList(paging, search); // 페이징 정보를 입력하여 조회
		
		System.out.println("OfficialListController [GET] - " + paging);
			
		//조회결과 MODEL값 전달
		req.setAttribute("list", list);
		
		//페이징 정보 MODEL값 전달
		req.setAttribute("paging", paging);
		
		//검색어 다시 전달
		req.setAttribute("search", search);
		
		//포워딩
		req.getRequestDispatcher("/WEB-INF/views/board/official_list.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/official/list [POST] -> redirect to doGet");
		doGet(req, resp);
	}

}
