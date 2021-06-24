package mc.sn.waw.user.repository;

import javax.servlet.http.HttpSession;

import mc.sn.waw.user.vo.UserVO;

public interface UserDAO {
	void register(UserVO userVO) throws Exception;
	
	boolean loginCheck(UserVO userVO) throws Exception;
	
	UserVO viewUser(UserVO userVO) throws Exception;

	void logout(HttpSession session) throws Exception;
	
	String userFindEmail(UserVO userVO) throws Exception;

	String userFindPwd(UserVO userVO) throws Exception;
}