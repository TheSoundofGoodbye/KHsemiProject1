package free.service.impl;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import common.JDBCTemplate;
import free.dao.face.MemberDao;
import free.dao.impl.MemberDaoImpl;
import free.service.face.MemberService;
import member.dto.User_info;

public class MemberServiceImple implements MemberService {

	private MemberDao memberDao = new MemberDaoImpl();


	@Override
	public boolean login(free.dto.User_info member) {
		
		if(memberDao.selectCntMemberByUseridUserpw(JDBCTemplate.getConnection(), member)>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public User_info getLoginMember(HttpServletRequest req) {

		try {
			req.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		User_info member = new User_info();
		
		member.setUser_email( req.getParameter("useremail") );
		member.setUser_password( req.getParameter("userpassword") );
		
		System.out.println("getLoginMember() : " + member);
		
		return member;
	}

	@Override
	public free.dto.User_info info(free.dto.User_info member) {
		// TODO Auto-generated method stub
		return null;
	}


}
