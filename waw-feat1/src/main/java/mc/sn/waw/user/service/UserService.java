package mc.sn.waw.user.service;

import mc.sn.waw.user.vo.UserVO;

public interface UserService {
	
	void register(UserVO userVO) throws Exception;
	
	String login(UserVO userVO) throws Exception;

	String userFindEmail(UserVO userVO) throws Exception;

	String userFindPwd(UserVO userVO) throws Exception;
}
