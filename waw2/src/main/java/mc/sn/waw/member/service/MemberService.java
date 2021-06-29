package mc.sn.waw.member.service;


import org.springframework.dao.DataAccessException;

import mc.sn.waw.member.vo.LoginVO;
import mc.sn.waw.member.vo.MemberVO;

public interface MemberService {
	  	 
	 void register(MemberVO memberVO) throws DataAccessException;
	 
	 int duplicateID(String id) throws DataAccessException;
	 
	 int duplicateNickname(String nickname) throws DataAccessException;
	 
	 MemberVO loginMember(LoginVO loginVO) throws DataAccessException;
	 
}

