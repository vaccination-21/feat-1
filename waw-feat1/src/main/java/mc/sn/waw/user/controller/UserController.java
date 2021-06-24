package mc.sn.waw.user.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import mc.sn.waw.user.service.UserService;
import mc.sn.waw.user.vo.UserVO;


@Controller("userController")
@RequestMapping("/user")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	private UserVO userVO;
	
	@Autowired	
	private UserService userService;

	@RequestMapping(value = "/registerForm.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String register() throws Exception {	
		
		return "/user/registerForm";
	}
	
	
	@RequestMapping(value = "/registerForm", method= RequestMethod.POST)	
	public ModelAndView Register(UserVO userVO) throws Exception{		
		
		ModelAndView mav = new ModelAndView();
							
		userService.register(userVO);
		mav.setViewName("main");			
						
		return mav;
	}
//	@RequestMapping(value = "/register.do", produces = "application/text; charset=utf8", method= {RequestMethod.GET, RequestMethod.POST})		
//	@ResponseBody
//	public String register(HttpServletRequest req, HttpServletResponse res) throws Exception{
//		System.out.println("인");
//		String email=req.getParameter("email");
//		String id=req.getParameter("id");
//		String pwd=req.getParameter("pwd");
//		String name= req.getParameter("name");
//		String phoneNumber= req.getParameter("phoneNumber");
//		System.out.println("회원가입 이메일: "+email+"\t아이디: "+id+"\t비밀번호: "+pwd+"\t이름: "+name+"\t전화번호: "+phoneNumber);
//		
//		try {
//			userVO = new UserVO(email,id, name, pwd, phoneNumber);
//			userService.register(userVO);
//			return "성공";
//		} catch (Exception e) {
//			return "실패";
//		}
//	}		
	

//	@RequestMapping(value = "/login.do", produces = "application/text; charset=utf8", method= RequestMethod.POST)		
//	@ResponseBody
//	public String login (HttpServletRequest req, HttpServletResponse res) throws Exception{
//		System.out.println("인");
//		String email=req.getParameter("email");
//		String pwd=req.getParameter("pwd");
//		JSONObject json=new JSONObject();
//		try {
//			userVO = new UserVO(email,pwd);
//			String name= userService.login(userVO);
//		
//			if (name != null) {
//				HttpSession session=req.getSession();
//				session.setAttribute("userVO", userVO);
//				System.out.println("성공!");
//				json.put("myPage", "<a class='nav-link' href='#' id='my_page'>"+name+"'s 페이지</a>");
//				json.put("logoutBtn", "반갑습니다. <kbd>"+name+"</kbd>님<br>오늘도 즐거운 하루 되세요!<br><br><button type='submit' class='btn btn-sm btn-danger' id='logout'>로그아웃</button>");
//								
//			} else {
//				System.out.println("로그인 실패! 이메일: \"+email+\"\\t비밀번호: \"+pwd+\"\\t이름: \"+name" );
//				json.put("msg", "다시 시도해주세요");
//					
//			}
//		} catch (Exception e) {
//			json.put("msg", e.getMessage());
//		}
//		return json.toJSONString();
//	}		
	
	@RequestMapping(value = "/loginCheck.do", method = RequestMethod.POST)
	public ModelAndView login(@ModelAttribute UserVO userVO , HttpSession session) throws Exception{
		
		logger.info("post login");
		
		boolean result = userService.loginCheck(userVO, session);
		System.out.println(userService.viewUser(userVO));
		System.out.println(result);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("home");
			mav.addObject("msg","success");
		}else {
			mav.setViewName("main");
			mav.addObject("msg", "fail");
		}
		
		return mav;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public ModelAndView logout(HttpSession session) throws Exception{
		
		userService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		mav.addObject("msg","logout");
		return mav;
	}
	@RequestMapping (value = "/userFindForm.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String userFind () {
		
		return "user/userFindForm";
	}
	
	
//	@RequestMapping(value = "/userFindEmail", produces = "application/text; charset=utf8", method= RequestMethod.POST)		
//	@ResponseBody
//	public String userFindEmail (HttpServletRequest req, HttpServletResponse res) throws Exception{
//		String name=req.getParameter("name");
//		String phoneNumber= req.getParameter("phoneNumber");
//		
//		
//		try {
//			userVO = new UserVO (name, phoneNumber);
//			String email = userService.userFindEmail(userVO);
//			System.out.println(userVO);
//			if (email == null) {
//				System.out.println("아이디없음");
//				return "아이디를 찾지 못했습니다";
//			} else {
//				return "이메일은"+email+"입니다.\n메인페이지에서 로그인 해주세요";
//			}
//		} catch (Exception e) {
//			return e.getMessage();
//		}
//	}	
	
	
//	@RequestMapping(value = "/userFindPwd", produces = "application/text; charset=utf8", method= RequestMethod.POST)		
//	@ResponseBody
//	public String userFindPwd (HttpServletRequest req, HttpServletResponse res) throws MemberException{
//		String name=req.getParameter("name");
//		String email=req.getParameter("email");
//		String phoneNumber= req.getParameter("phoneNumber");
//		
//		try {
//			userVO = new userVO(name,email, phoneNumber);
//			String pwd =userService.userFindPwd(userVO);
//			System.out.println(userVO);
//			if (pwd==null) {
//				System.out.println("pwd ==null");
//				return "비밀번호를 찾지 못했습니다";
//			} else {
//				return ""+name+"님의 비밀번호는 "+pwd+"입니다.\n메인페이지에서 로그인 해주세요";
//			}
//		} catch (Exception e) {
//			return e.getMessage();
//		}
//		
//	}		
	
	
//	@RequestMapping(value = "/logout", method= RequestMethod.POST, produces = "application/text; charset=utf8")			
//	@ResponseBody
//	public String logout(HttpServletRequest req, HttpServletResponse res){
//			HttpSession session=req.getSession(false);
//			session.invalidate();
//			return "";
//	}
}
