package custom.dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import custom.dto.Custom;
import custom.dto.Custom;
import util.Paging;

public interface CustomDao {
	
	/**
	 * 전체 테이블의 행 갯수를 조회
	 * 
	 * @param conn - DB연결객체
	 * @return int = Custom테이블 전체 행의 갯수 
	 */
	int selectCntAll(Connection connection);
		
	/**
	 * 특정 검색어로 특정 카테고리에서 검색한 데이터베이스의 행 갯수를 조회
	 * @param search 
	 * 
	 * @param conn - DB연결객체
	 * @return int = Custom테이블 전체 행의 갯수 
	 */
	int selectCntSearch(Connection connection, String search, String category);

	/**
	 * 검색어가포함된 테이블의 행 갯수를 조회
	 * 
	 * @param conn - DB연결객체
	 * @param search - 검색어
	 * @return int - Custom테이블 전체 행의 갯수 
	 */
	int selectCntSearchAll(Connection connection, String search);
	
	/**
	 * 파일 정보 테이블 전체 조회 (DB로부터)
	 * 페이징 처리 추가
	 * 
	 * @param connection - DB연결 객체
	 * @param Paging 페이징 객체
	 * @return 테이블 전체 조회 결과 List<C>
	 */
	List<Custom> selectAll(Connection connection, Paging paging);

	/**
	 * 파일 정보 테이블 검색어 조회 (DB로부터)
	 * 페이징 처리 추가
	 * 
	 * @param connection - DB연결 객체
	 * @param Paging 페이징 객체
	 * @param search - 카테고리 + 검색어
	 * @return 테이블 전체 조회 결과 List<Custom>
	 */
	List<Custom> selectSearch(Connection connection, Paging paging, String search, String category);
	
	/**
	 * 파일 정보 테이블 검색어 조회 (DB로부터)
	 * 페이징 처리 추가
	 * 
	 * @param connection - DB연결 객체
	 * @param Paging 페이징 객체
	 * @param categorySearch - 검색어
	 * @return 테이블 전체 조회 결과 List<Custom>
	 */
	List<Custom> selectSearchAll(Connection connection, Paging paging, String search);
	
	/**
	 * [비활성]조회된 게시글의 조회수 증가시키기
	 * 
	 * @param custom_no - 조회된 게시글 번호를 가진 객체
	 */
	int updateHit(Connection connection, Custom custom_no);

	/**
	 * 특정 레시피 조회
	 * 
	 * @param custom_no - 조회할 custom_cocktail_no를 가진 Custom 객체
	 * @return Custom - 조회된 결과 Custom객체
	 */
	Custom selectCustomByCustomno(Connection connection, Custom custom_no);








}
