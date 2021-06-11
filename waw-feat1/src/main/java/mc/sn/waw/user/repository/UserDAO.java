package mc.sn.waw.user.repository;

import mc.sn.waw.user.vo.LoginVO;
import mc.sn.waw.user.vo.UserVO;

public interface UserDAO {
	
	void register(UserVO user) throws Exception; // 회원가입
	
	UserVO selectByEmail(String email)throws Exception;  
	
	UserVO selectById(String id) throws Exception;
	
	UserVO modify(UserVO user) throws Exception; // 정보 수정
	
	UserVO Login(LoginVO login) throws Exception; // 로그인
		
}
