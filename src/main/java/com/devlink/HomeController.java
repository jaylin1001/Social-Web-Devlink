package com.devlink;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.devlink.dao.Member;
import com.devlink.me.service.Service;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Resource(name="meService")
	Service service;
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if(session!=null) {
			if(req.getSession(false).getAttribute("id")!=null)
				return "redirect:/home.do";
		}
		return "index";
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(HttpServletRequest req,@RequestParam(value = "id") String id,@RequestParam(value = "pwd") String pwd) {
		String rPwd=rpwd(pwd);
		Member m=service.login(id,rPwd);
		if(m!=null) {
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			session.setAttribute("no", m.getM_no());
			session.setAttribute("name", m.getName());
			if(m.getPath()!=null) {
				System.out.println(m.getPath());
				session.setAttribute("path", m.getPath());
			}else {
				System.out.println(m.getPath());				
			}
			return "redirect:/home.do";
		}
		else {
			System.out.println("遺덉씪移�!");
			return "redirect:/";
		}
	}
	private String rpwd(String pwd) {
		String result ="";
		for(int i=0;i<pwd.length();i++){
			char c=pwd.charAt(i);
			if(c>='a'&&c<='z'){
				c=(char) (((c-97+10)%26)+97);
				result+=c;
			}else if(c>='A'&&c<='Z'){
				c=(char) (((c-65+5)%26)+65);
				result+=c;
			}else if(c>='0'&&c<='9'){
				c=(char) (((c-48+3)%10)+48);
				result+=c;
			}else{
				result+=c;
			}
		}
		return result;
	}
	
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {
		System.out.println("HERE");
		HttpSession session = req.getSession(false);
		if(session!=null) {
			session.removeAttribute("id");
			session.removeAttribute("no");
			session.removeAttribute("name");
			if(session.getAttribute("path")!=null)
				session.removeAttribute("path");		
			session.invalidate();
		}
		return "redirect:/";
	}

	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if(session==null)
			return "redirect:/";
		else{
			if(req.getSession(false).getAttribute("id")==null)
				return "redirect:/";
		}
		return "home/home";
	}
	
	@RequestMapping(value="/jobs", method=RequestMethod.GET)
	public String jobs() {
		return "me/viewMyProfile";
	}
	@RequestMapping(value="/msg", method=RequestMethod.GET)
	public String msg() {
		return "me/viewMyProfile";
	}
	
	@RequestMapping(value="/me", method=RequestMethod.GET)
	public String me() {
		return "me/viewMyProfile";
	}
}
