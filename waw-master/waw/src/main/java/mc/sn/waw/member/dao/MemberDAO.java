package mc.sn.waw.member.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import mc.sn.waw.member.vo.LoginVO;
import mc.sn.waw.member.vo.MemberVO;


public interface MemberDAO {	
	
	 void register(MemberVO memberVO) throws DataAccessException;
	 
	 int duplicateID(String id) throws DataAccessException;
	 
	 int duplicateNickname(String nickname) throws DataAccessException;
	 
	 MemberVO loginMember(LoginVO loginVO) throws DataAccessException;
	 
	 MemberVO findEmail(MemberVO memberVO) throws DataAccessException;
	 
	 MemberVO findPwd(MemberVO memberVO) throws DataAccessException;
}
