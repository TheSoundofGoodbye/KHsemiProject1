package free.service.impl;

import java.sql.Connection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import free.dao.face.ShoppingBoardDao;
import free.dao.impl.ShoppingBoardDaoImpl;
import free.dto.Shopping_board;
import free.service.face.ShoppingService;

public class ShoppingServiceImpl implements ShoppingService {

	private ShoppingBoardDao shoppingdao = new ShoppingBoardDaoImpl();
	
	@Override
	public List<Shopping_board> getList() {
		
		return shoppingdao.getList(JDBCTemplate.getConnection());
	}

	@Override
	public List<Shopping_board> getList(HttpServletRequest req) {
		String category = req.getParameter("category");
		Connection conn = JDBCTemplate.getConnection();
		List<Shopping_board> shoppingBoard = null;
		
		if(category.equals("alchol")) {
			shoppingBoard = shoppingdao.getAlcholList(conn);
		}
		if(category.equals("tool")) {
			shoppingBoard = shoppingdao.getToolList(conn);
		}
		if(category.equals("food")){
			shoppingBoard = shoppingdao.getFoodList(conn);
		}
		
		System.out.println("res: " + shoppingBoard);
		
		return shoppingBoard;
	}

}
