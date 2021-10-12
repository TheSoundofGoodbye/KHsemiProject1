package official.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import official.dto.Official;
import official.service.OfficialService;
import official.service.OfficialServiceImpl;
import util.Paging;

/**
 * Servlet implementation class OfficialMainController
 */
@WebServlet("/official/main")
public class OfficialMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	OfficialService officialService = new OfficialServiceImpl();
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("/official/main [GET]");
    	
    	//세션 객체 생성
    	HttpSession session = req.getSession();
    	
    	//요청 파라미터를 전달하여 paging 객체생성
    	Paging paging = officialService.getPaging(req);
    	System.out.println("OfficialListController [GET] - " + paging);

    	List<Official> list = officialService.getList(paging); // 페이징 정보를 입력하여 조회

    	//조회결과 MODEL값 전달
    	req.setAttribute("list", list);

    	//페이징 정보 MODEL값 전달
    	req.setAttribute("paging", paging);

    	//기본적으로 default값이 주어진 official_list.jsp 로 포워딩 한다
    	req.getRequestDispatcher("/WEB-INF/views/board/official_list.jsp").forward(req, resp);
    	
    }

}
