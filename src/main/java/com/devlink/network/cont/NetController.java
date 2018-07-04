package com.devlink.network.cont;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.devlink.dao.Member;
import com.devlink.me.service.MeService;
import com.devlink.network.service.Service;

@Controller
public class NetController {
	@Resource(name="netService")
	Service service;
	
	@Resource(name="meService")
	MeService meService;
	
	@RequestMapping(value="/network", method=RequestMethod.GET)
	public String network() {
		return "network/network";
	}
	@RequestMapping(value="/network.do", method=RequestMethod.GET)
	public ModelAndView network2(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("network/network");
		String id="id1";
		String no=meService.getNo(id);
		ArrayList<Member> frdto = service.getFrdTo(no);
		ArrayList<Member> frdfrom = service.getFrdFrom(no);
		ArrayList<Member> frdp=service.getFrdP(no);
		mav.addObject("frd", frdto);
		mav.addObject("frdfrom", frdfrom);
		mav.addObject("frdp", frdp);
		return mav;
	}
	@RequestMapping(value="/friendlist", method=RequestMethod.GET)
	public String frdlist() {
		return "network/friendlist";
	}
}