package mc.sn.waw.user.repository;

import mc.sn.waw.user.vo.UserVO;

public interface UserDAO {
	void register(UserVO userVO) throws Exception;
	
	String login(UserVO userVO) throws Exception;

	String userFindEmail(UserVO userVO) throws Exception;

	String userFindPwd(UserVO userVO) throws Exception;
}