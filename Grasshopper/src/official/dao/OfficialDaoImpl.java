package official.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import common.JDBCTemplate;
import official.dto.Official;
import util.Paging;

public class OfficialDaoImpl implements OfficialDao{

	PreparedStatement ps = null; //SQL 수행객체 생성
	ResultSet rs = null; //결과값을 담을 객체 생성
	
	@Override
	public int selectCntAll(Connection connection) {
		
		String sql = "";
		sql += "SELECT count(*) FROM officialcocktail";
		
		//총 레시피 숫자
		int cnt = 0;
		
		try {
			ps = connection.prepareStatement(sql);
			rs = ps.executeQuery();
			
			while(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
		
		return cnt;
	}
	
	@Override
	public List<Official> selectAll(Connection connection, Paging paging) {
		
		String sql = ""; //SQL 작성
		sql += "SELECT * FROM (";
	    sql += " SELECT ROWNUM rnum, O.* FROM (";
	    sql += "    SELECT official_cocktail_no, official_cocktail_name, official_cocktail_detail, official_cocktail_ingred, official_cocktail_vote, official_write_date";
	    sql += "     FROM officialcocktail ORDER BY official_cocktail_no ) O";
	    sql += "   ) officialcocktail";
	    sql += " WHERE rnum BETWEEN ? AND ?";
	    
		//결과 저장 리스트
		List<Official> officialList = new ArrayList<>();
	    
	    try {
			ps = connection.prepareStatement(sql);
			
			//변수 채우기
			ps.setInt(1, paging.getStartNo());
			ps.setInt(2, paging.getEndNo());
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				Official official = new Official();
				official.setOfficial_cocktail_no(rs.getInt("official_cocktail_no"));
				official.setOfficial_cocktail_name(rs.getString("official_cocktail_name"));
				official.setOfficial_cocktail_detail(rs.getString("official_cocktail_detail"));
				official.setOfficial_cocktail_ingred(rs.getString("official_cocktail_no"));
				official.setOfficial_cocktail_vote(rs.getInt("official_cocktail_vote"));
				official.setOfficial_write_date(rs.getDate("official_write_date"));
				
				//리스트에 official 객체로 저장
				officialList.add(official);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}
	    		
		return officialList;
	}
	
	@Override
	public int updateHit(Connection connection, Official official_no) {

		//SQL 작성
		String sql = "";
		sql += "UPDATE officialcocktail";
		sql += " SET official_cocktail_view = official_cocktail_view + 1";
		sql += " WHERE official_cocktail_no = ?";

		int res = 0;

		try {
			ps = connection.prepareStatement(sql); //SQL수행 객체

			ps.setInt(1, official_no.getOfficial_cocktail_no()); //조회할 게시글 번호 적용

			res = ps.executeUpdate(); //SQL 수행

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(ps);
		}

		return res;
	}
	
	@Override
	public Official selectOfficialByOfficialno(Connection connection, Official official_no) {
		
		//SQL 작성
		String sql = "";
		sql += "SELECT * FROM officialcocktail";
		sql += " WHERE official_cocktail_no = ?";

		//결과 저장할 Board객체
		Official viewRecipe = null;

		try {
			ps = connection.prepareStatement(sql); //SQL수행 객체

			ps.setInt(1, official_no.getOfficial_cocktail_no()); //조회할 게시글 번호 적용

			rs = ps.executeQuery(); //SQL 수행 및 결과집합 저장

			//조회 결과 처리
			while(rs.next()) {
				viewRecipe = new Official(); //결과값 저장 객체

				//결과값 한 행 처리
				viewRecipe.setOfficial_cocktail_no(rs.getInt("official_cocktail_no"));
				viewRecipe.setOfficial_cocktail_name(rs.getString("official_cocktail_name"));
				viewRecipe.setOfficial_cocktail_detail(rs.getString("official_cocktail_detail"));
				viewRecipe.setOfficial_cocktail_ingred(rs.getString("official_cocktail_no"));
				viewRecipe.setOfficial_cocktail_vote(rs.getInt("official_cocktail_vote"));
				viewRecipe.setOfficial_write_date(rs.getDate("official_write_date"));

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			//DB객체 닫기
			JDBCTemplate.close(rs);
			JDBCTemplate.close(ps);
		}

		//최종 결과 반환
		return viewRecipe;
	}
}
