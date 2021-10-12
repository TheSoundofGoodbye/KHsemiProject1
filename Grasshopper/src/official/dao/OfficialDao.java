package official.dao;

import java.sql.Connection;
import java.util.List;

import official.dto.Official;
import util.Paging;

public interface OfficialDao {
	
	/**
	 * 데이터베이스의 행 갯수를 조회
	 * 
	 * @param conn - DB연결객체
	 * @return int = Official테이블 전체 행의 갯수 
	 */
	int selectCntAll(Connection connection);

	/**
	 * 파일 정보 테이블 전체 조회 (DB로부터)
	 * 페이징 처리 추가
	 * 
	 * @param connection - DB연결 객체
	 * @param Paging 페이징 객체
	 * @return 테이블 전체 조회 결과 List<Official>
	 */
	List<Official> selectAll(Connection connection, Paging paging);

	/**
	 * [비활성]조회된 게시글의 조회수 증가시키기
	 * 
	 * @param official_no - 조회된 게시글 번호를 가진 객체
	 */
	int updateHit(Connection connection, Official official_no);

	/**
	 * 특정 레시피 조회
	 * 
	 * @param official_no - 조회할 official_cocktail_no를 가진 Official 객체
	 * @return Official - 조회된 결과 Official객체
	 */
	Official selectOfficialByOfficialno(Connection connection, Official official_no);

}
