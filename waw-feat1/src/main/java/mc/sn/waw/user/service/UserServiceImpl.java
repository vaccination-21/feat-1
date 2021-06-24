package mc.sn.waw.user.service;

import javax.servlet.http.HttpSession;

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
	public boolean loginCheck(UserVO userVO, HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		boolean result =  userDAO.loginCheck(userVO);
		if (result) {
			UserVO user = viewUser(userVO);
			session.setAttribute("email", user.getEmail());
			session.setAttribute("name", user.getName());
		}
		return result;
	}
	
	@Override
	public UserVO viewUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return userDAO.viewUser(userVO);
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		session.invalidate();
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
