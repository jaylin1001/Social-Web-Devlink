package com.devlink;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value="/home", method=RequestMethod.GET)
	public String home() {
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
