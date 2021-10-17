package free.dao.face;

import java.sql.Connection;
import java.util.List;

import free.dto.Shopping_board;

public interface ShoppingBoardDao {

	/**
	 * shoppingboard의 전체 데이터를 가지고오는 메소드
	 * 
	 * @param conn - DB 연결 객체
	 * @return - dto타입의 ArrayList로 반환
	 */
	public List<Shopping_board> getList(Connection connection);

	/**
	 * 쇼핑 테이블에서 술과 관련된 list만 찾아 list로 반환
	 * 
	 * @param conn - DB연결 객체
	 * @return - free.dto ArrayList
	 */
	public List<Shopping_board> getAlcholList(Connection conn);

	/**
	 * 쇼핑 테이블에서 도구과 관련된 list만 찾아 list로 반환
	 * 
	 * @param conn - DB연결 객체
	 * @return - free.dto ArrayList
	 */
	public List<Shopping_board> getToolList(Connection conn);

	/**
	 * 쇼핑 테이블에서 음식과 관련된 list만 찾아 list로 반환
	 * 
	 * @param conn - DB연결 객체
	 * @return - free.dto ArrayList
	 */
	public List<Shopping_board> getFoodList(Connection conn);
	
}
