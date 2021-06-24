package mc.sn.waw.user.repository;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import mc.sn.waw.user.vo.UserVO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void register(UserVO userVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("mapper.user.register", userVO);
	}
	
	@Override
	public boolean loginCheck(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		String name =sqlSession.selectOne("mapper.user.loginCheck", userVO);
		return (name == null) ? false : true;
	}

	@Override
	public UserVO viewUser(UserVO userVO) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.user.viewUser", userVO);
	}

	@Override
	public void logout(HttpSession session) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

	@Override
	public String userFindEmail(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.user.userFindEmail", userVO);
	}

	@Override
	public String userFindPwd(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.user.userFindPwd", userVO);
	}

	

}
