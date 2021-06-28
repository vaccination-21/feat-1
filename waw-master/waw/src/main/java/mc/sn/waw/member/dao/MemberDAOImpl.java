package mc.sn.waw.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import mc.sn.waw.member.vo.LoginVO;
import mc.sn.waw.member.vo.MemberVO;

@Repository("memberDAO")
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
		
	//회원가입
	@Override
	public void register(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.member.register", memberVO);
	}
	//email 중복
	@Override
	public int duplicateID(String email) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("mapper.member.duplicateID", email);
		return result;		
	}
	//nickname 중복
	@Override
	public int duplicateNickname(String nickname) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("mapper.member.duplicateNickname", nickname);
		return result;
	}
	//로그인
	@Override
	public MemberVO loginMember(LoginVO loginVO) throws DataAccessException {
		// TODO Auto-generated method stub
		 MemberVO memberVO = sqlSession.selectOne("mapper.member.memberLogin",loginVO);
			
		 return memberVO;
	}
	@Override
	public MemberVO findEmail(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		MemberVO member = sqlSession.selectOne("mapper.member.findEmail",memberVO);
		
		 return member;
	}
	@Override
	public MemberVO findPwd(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		MemberVO member = sqlSession.selectOne("mapper.member.findPwd",memberVO);
		
		 return member;
	}
	

	
}
