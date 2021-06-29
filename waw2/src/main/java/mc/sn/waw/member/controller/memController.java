package mc.sn.waw.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import mc.sn.waw.member.service.MemberSHA256;
import mc.sn.waw.member.service.MemberService;
import mc.sn.waw.member.vo.LoginVO;
import mc.sn.waw.member.vo.MemberVO;



	@RestController
	@RequestMapping("/member")
	public class memController {

	    //private static final Logger logger = LoggerFactory.getLogger(memController.class);
	    

	    @Autowired
	    private MemberService memberService;
	    	    	    
	    @GetMapping("/join.do")
	    public ModelAndView join() throws Exception {
	        return new ModelAndView("member/sign_up");
	    }

	    //회원가입
	    @PostMapping("/joinProcess")
	    public String register(@RequestBody MemberVO memberVO) throws Exception {
	        String securityPwd = MemberSHA256.encrypt(memberVO.getPwd());
	        memberVO.setPwd(securityPwd);
	    	memberService.register(memberVO);
	        return "joinSuccess";
	    }

	    

	    //이메일 중복확인
	    @PostMapping("/emailCheck")
	    public Map<String, Object> comfirmEmail(@RequestBody String email) throws Exception {	        	    	
	        Map<String, Object> data = new HashMap<String, Object>();
	        
	        int result = memberService.duplicateID(email);
	        
	        if (result == 0) {
	            System.out.println("이메일 사용가능");
	            data.put("confirm", "OK");
	        } else {
	        	System.out.println("이메일 중복");
	            data.put("confirm", "NO");
	        }
	        return data;
	    }

	    //닉네임 중복확인
	    @PostMapping("/nicknameCheck")
	    public Map<String, Object> confirmId(@RequestBody String nickname) throws Exception {

	        Map<String, Object> data = new HashMap<String, Object>();
	        int result = memberService.duplicateNickname(nickname);
	        
	        if (result == 0) {
	            System.out.println("닉네임 사용가능");
	            data.put("confirm", "OK");
	        } else {
	        	System.out.println("닉네임 중복");
	            data.put("confirm", "NO");
	        }
	        return data;
	    }

	    
	    //로그인
	    @PostMapping(value ="/loginCheck", produces = "application/text; charset=utf8")
	    public String login(@RequestBody LoginVO loginVO, HttpSession session) {
	        String result = null;
	        System.out.println(loginVO);
	       String securityPwd = MemberSHA256.encrypt(loginVO.getPwd());
	       loginVO.setPwd(securityPwd);
	       MemberVO memberVO = memberService.loginMember(loginVO);
	              
	        if (memberVO != null) {	 	             	                    
	        		session.setAttribute("login", memberVO);                    	                    
                    result = "loginSuccess";	               
	                
	        } else { 
	        	result ="멤버없음";
	        }
	        return result;
	    }


	    //로그아웃
	    @GetMapping("/logout")
	    public ModelAndView logout(HttpSession session) throws Exception {

	        //세션에서 login정보 가져옴
	        Object obj = session.getAttribute("login");
	        //세션에 로그인 정보가 있다면
	        if (obj != null) {
	            session.removeAttribute("login");
	            session.invalidate();               
	        }
	        return new ModelAndView("redirect:/");
	    }
	    	    	    

	}
	