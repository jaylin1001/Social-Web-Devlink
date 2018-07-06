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
		boolean login=service.login(id,rPwd);
		if(login) {
			System.out.println("일치!");
			HttpSession session = req.getSession();
			session.setAttribute("id", id);
			return "redirect:/home.do";
		}
		else {
			System.out.println("불일치!");
			return "redirect:/";
		}
	}
	
	private String rpwd(String pwd) {
		return pwd;
	}

	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public String home(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if(session==null)
			return "index";
		else{
			if(req.getSession(false).getAttribute("id")==null)
				return "index";
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
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout() {
		return "me/viewMyProfile";
	}
}
