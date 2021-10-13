package custom.controller;

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
@WebServlet("/custom/main")
public class CustomMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	OfficialService officialService = new OfficialServiceImpl();
	
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("/custom/main [GET]");
    	
    	System.out.println("[CONSOLE] /list로 리다이렉트합니다");
    	
    	resp.sendRedirect("/custom/list");
    	
    }

}
