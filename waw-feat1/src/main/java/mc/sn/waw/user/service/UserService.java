package mc.sn.waw.user.service;

import javax.servlet.http.HttpSession;

import mc.sn.waw.user.vo.UserVO;

public interface UserService {
	
	void register(UserVO userVO) throws Exception;
	
	boolean loginCheck(UserVO userVO, HttpSession session) throws Exception;

	UserVO viewUser(UserVO userVO) throws Exception;
	 
	void logout(HttpSession session) throws Exception;
	
	String userFindEmail(UserVO userVO) throws Exception;

	String userFindPwd(UserVO userVO) throws Exception;
}
