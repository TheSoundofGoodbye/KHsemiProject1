package official.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OfficialMainController
 */
@WebServlet("/official/main")
public class OfficialMainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("/official/main");
    	
    	//세션 객체 생성
    	HttpSession session = req.getSession();
    	
    	//메인 오피셜칵테일 페이지 진입
    	req.getRequestDispatcher("/WEB-INF/views/official_main.jsp").forward(req, resp);
    	
    }

}
