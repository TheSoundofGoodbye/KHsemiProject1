package custom.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import custom.dao.CustomDao;
import custom.dao.CustomDaoImpl;
import custom.dto.Custom;
import official.dao.OfficialDao;
import official.dao.OfficialDaoImpl;
import official.dto.Official;
import util.Paging;

public class CustomServiceImpl implements CustomService{
	
	//CustomDao 객체 생성
	private CustomDao customDao = new CustomDaoImpl();
	
	@Override
	public Paging getPaging(HttpServletRequest req) {
		
		//전달 파라미터 curPage 파싱
		String param = req.getParameter("curPage");
		int curPage = 0;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		} else {
			System.out.println("[CAUTION] curPage값이 null 또는 비어있습니다");
		}
		
		//Offical 테이블의 총 데이터 수(레시피 숫자)를 조회
		int totalCount = customDao.selectCntAll(JDBCTemplate.getConnection());
		
		//Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;				
	}
	
	@Override
	public Paging getPaging(HttpServletRequest req, String search, String category) {
		//전달 파라미터 curPage 파싱
		String param = req.getParameter("curPage");
		int curPage = 0;
		if(param != null && !"".equals(param)) {
			curPage = Integer.parseInt(param);
		} else {
			System.out.println("[CAUTION] curPage값이 null 또는 비어있습니다");
		}
		
		int totalCount = 0;
		
		//검색어로 검색한 테이블의 반환 데이터 수(레시피 숫자)를 조회
		if( "all".equals(category) ) {
			totalCount = customDao.selectCntSearchAll(JDBCTemplate.getConnection(), search);
		} else {
			totalCount = customDao.selectCntSearch(JDBCTemplate.getConnection(), search, category);
			//글쓴이 정보 가져오기 필요
		}
		
		//Paging 객체 생성
		Paging paging = new Paging(totalCount, curPage);
		
		return paging;		
	}
	
	@Override
	public List<Custom> getList(Paging paging) {

		return customDao.selectAll(JDBCTemplate.getConnection(), paging);
	}
	
	@Override
	public List<Custom> getList(Paging paging, String search, String category) {
		
		List<Custom> list = new ArrayList<>();
		
		if( "all".equals(category)) {
			list = customDao.selectSearchAll(JDBCTemplate.getConnection(), paging, search);
		} else {
			list = customDao.selectSearch(JDBCTemplate.getConnection(), paging, search, category);
		}
		
		return list;
	}
	
	@Override
	public Custom getCustom_no(HttpServletRequest req) {
		
		//Custom 객체 생성
		Custom customno = new Custom();
		
		//customno 전달 파라미터 검증 - null or ""
		String param = req.getParameter("custom_no");
		if(param != null && !"".equals(param)) {
			//custom_no 전달 파라미터 추출
			customno.setCustom_board_no(Integer.parseInt(param));
		}
		
		//결과 Custom 객체 반환
		return customno;
	}
	
	@Override
	public Custom view(Custom custom_no) {
		
		Connection connection = JDBCTemplate.getConnection();
		
		//[비활성] 조회수 증가 
//		if( customDao.updateHit(connection, custom_no) == 1 ) {
//			JDBCTemplate.commit(connection);
//		} else {
//			JDBCTemplate.rollback(connection);
//		}
		
		//레시피 조회
		Custom custom = customDao.selectCustomByCustomno(connection, custom_no);
		
		return custom;
	}
	
	
	
	
}
