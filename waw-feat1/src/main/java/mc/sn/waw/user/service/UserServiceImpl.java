package mc.sn.waw.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import mc.sn.waw.user.repository.UserDAO;
import mc.sn.waw.user.vo.UserVO;

@Service("userService")
public class UserServiceImpl implements UserService {

	
	@Autowired
	private UserDAO userDAO;
	
	@Override
	public void register(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		userDAO.register(userVO);
	}

	@Override
	public String login(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.login(userVO);
	}

	@Override
	public String userFindEmail(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.userFindEmail(userVO);
	}

	@Override
	public String userFindPwd(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.userFindPwd(userVO);
	}
	
}
