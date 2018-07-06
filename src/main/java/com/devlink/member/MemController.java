package com.devlink.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devlink.dao.Member;

@Controller
public class MemController {
	@Resource(name="memService")
	private Service service;
	
	public void setService(Service service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/joinForm.do")
	public String form(HttpServletRequest req) {
		HttpSession session = req.getSession();
		session.setAttribute("idCheck", false);
		return "me/joinForm";
	}
	
	@RequestMapping(value = "/join.do")
	public String join(Member m, HttpServletRequest req) {
		System.out.println(m);
		service.addMember(m);	
		return "index";
				
	}
	
	@RequestMapping(value = "/idCheck.do")
	public ModelAndView idCheck(HttpServletRequest req, @RequestParam(value = "id") String id) {
		HttpSession session = req.getSession(false);
		/*String id=session.getAttribute("id");*/
		ModelAndView mav = new ModelAndView("me/idCheck");
		String result = "";
		try {
			Member m = service.getMember(id);
			System.out.println(m+"kkk");
			if(m == null) {
				result = "사용가능";
				session.setAttribute("idCheck", true);
			}else {
				result = "사용불가능";
				session.setAttribute("idCheck", false);
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		System.out.println(session.getAttribute("idCheck"));
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping(value = "/settings.do", method = RequestMethod.GET)
	public String settings() {
		return "me/settings";
	}
	
	@RequestMapping(value = "/editemail.do")
	public String editEmail(Member m, HttpServletRequest req, @RequestParam(value = "id") String id, @RequestParam(value = "email") String email) {
		System.out.println("editemail.do");
		System.out.println(id);
		System.out.println(email);
		service.editEmail(m);
		return "me/settings";
	}
	@RequestMapping(value = "/editphone.do")
	public String editPhone(Member m, HttpServletRequest req, @RequestParam(value = "id") String id, @RequestParam(value = "phone") String phone) {
		System.out.println("editphone.do");
		service.editPhone(m);
		return "me/settings";
	}
	@RequestMapping(value = "/editaddress.do")
	public String editaddress(Member m, HttpServletRequest req, @RequestParam(value = "id") String id, @RequestParam(value = "address") String address) {
		System.out.println("editaddress");
		service.editAddress(m);
		System.out.println(address);
		return "me/settings";
	}
	@RequestMapping(value = "/editpwd.do")
	public String editPwd(Member m, HttpServletRequest req, @RequestParam(value = "id") String id, @RequestParam(value = "pwd") String pwd) {
		System.out.println("editpwd");
		System.out.println(id);
		System.out.println(pwd);
		service.editPwd(m);
		return "me/settings";
	}
	@RequestMapping(value = "/pwdCheck.do")
	public ModelAndView pwdCheck(HttpServletRequest req, @RequestParam(value = "pwd") String pwd) {
		System.out.println("pwdCheck");
		System.out.println(pwd);
		HttpSession session = req.getSession(false);
		/*String id=session.getAttribute("id");*/
		ModelAndView mav = new ModelAndView("me/pwdCheck");
		String result = "";
		try {
			Member m = service.getMemberPwd(pwd);
			System.out.println(m+"kkk");
			if(m == null) {
				result = "다시입력해주세요!";
				session.setAttribute("pwdCheck2", false);
			}else {
				result = "확인되었습니다!";
				session.setAttribute("pwdCheck2", true);
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		}
		System.out.println(session.getAttribute("pwdCheck2"));
		mav.addObject("result", result);
		return mav;
	}
	
	@RequestMapping(value = "/helpcenter.do", method = RequestMethod.GET)
	public String helpcenter() {
		return "me/helpcenter";
	}
	
}
