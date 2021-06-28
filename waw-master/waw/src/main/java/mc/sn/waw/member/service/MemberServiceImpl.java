package mc.sn.waw.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import mc.sn.waw.member.dao.MemberDAO;
import mc.sn.waw.member.vo.LoginVO;
import mc.sn.waw.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	
	@Override
	public void register(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String encoded = encoder.encode(memberVO.getPwd()); 
		memberVO.setPwd(encoded);
		memberDAO.register(memberVO);
	}

	@Override
	public int duplicateID(String email) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = memberDAO.duplicateID(email);
		return result;
	}

	@Override
	public int duplicateNickname(String nickname) throws DataAccessException {
		// TODO Auto-generated method stub
		int result = memberDAO.duplicateNickname(nickname);
		return result;
	}

	@Override
	public MemberVO loginMember(LoginVO loginVO) throws DataAccessException {
		// TODO Auto-generated method stub				 
		return memberDAO.loginMember(loginVO);
	}

	@Override
	public MemberVO findEmail(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		MemberVO member = memberDAO.findEmail(memberVO);
		return member;
	}

	@Override
	public MemberVO findPwd(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		MemberVO member = memberDAO.findPwd(memberVO);
		return member;
	}
}
