package mc.sn.waw.user.repository;

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
	public String login(UserVO userVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("mapper.user.login", userVO);
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
