package service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import dto.Official;
import util.Paging;

public interface OfficialService {
	
	/**
	 * 페이징 객체 생성
	 * 
	 * 요청 파라미터 curPage를 구한다
	 * Official테이블과 curPage값을 이용해 Paging객체를 구하여 반환한다 
	 * 
	 * @param req - 요청정보 객체
	 * @return 페이징 계산이 완료된 Paging 객체
	 */
	Paging getPaging(HttpServletRequest req);
	
	/**
	 * 레시피 목록을 조회하는 기능
	 * 페이징 정보를 고려하여 조회한다
	 * 
	 * @param paging - 현재 페이징 정보
	 * @return 게시글 목록을 List<Official>형태로 가져온다
	 */
	List<Official> getList(Paging paging);
	
	/**
	 * 요청파라미터 얻기
	 * 
	 * @param req - 요청정보객체
	 * @return Board - 전달파라미터 official_no를 포함한 Official객체
	 */
	Official getOfficial_no(HttpServletRequest req);
	
	/**
	 * 주어진 official_no를 이용하여 레시피를 조회 
	 * [비활성] 조회된 게시글의 조회수를 1 증가시킨다
	 * 
	 * @param official_no - official_cocktail_no를 가지고 있는 Official 객체
	 * @return Official - 조회된 레시피
	 */
	Official view(Official official_no);

}
