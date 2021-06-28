package mc.sn.waw.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

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

	    //회원가입 처리 요청
	    @PostMapping("/joinProcess")
	    public String register(@RequestBody MemberVO memberVO) throws Exception {
	        memberService.register(memberVO);
	        return "joinSuccess";
	    }

	    

	    //이메일 중복확인 체크 요청
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

	    //닉네임 중복확인 체크 요청
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
	    @PostMapping("/loginCheck")
	    public String login(@RequestBody LoginVO loginVO, HttpSession session) {
	        String result = null;
	       
	        
	        MemberVO memberVO = memberService.loginMember(loginVO);

	        

	        
	        if (memberVO != null) {	                          	                    	                   
                    session.setAttribute("login", memberVO);
                    
	                    
                    result = "loginSuccess";
	                } else	{                   
	                    result ="Fail";
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
	    
	    @GetMapping("/find.do")
	    public ModelAndView find() throws Exception {
	        return new ModelAndView("member/findForm");
	    }
	    
	    @PostMapping(value= "/findEmail", produces = "application/text; charset=utf8")
	    public String findEmail(@RequestBody MemberVO memberVO) {
	        String result = null;	       
	        
	        MemberVO member = memberService.findEmail(memberVO);
	        	        
	        if (member!= null) {                 	                    	                   
                    	                    
                    result = "이메일은"+member.getEmail()+"입니다.";
                    
	                } else	{                   
	                    result ="이메일을 찾지 못했습니다.";
	    }
	        return result;
	    }
	    

	}
	