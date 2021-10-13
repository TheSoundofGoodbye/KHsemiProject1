package official.controller;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
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
    	System.out.println("[CONSOLE] /list로 리다이렉트합니다");
    	
    	resp.sendRedirect("/official/list");

    	//기본적으로 default값이 주어진 official_list.jsp 로 포워딩 한다
//    	req.getRequestDispatcher("/WEB-INF/views/board/official_list.jsp").forward(req, resp);
    	
    }

}
