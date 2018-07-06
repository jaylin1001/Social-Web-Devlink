package com.devlink.network.cont;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devlink.dao.Frd;
import com.devlink.me.service.MeService;
import com.devlink.network.service.Service;

@Controller
public class NetController {
	@Resource(name="netService")
	Service service;
	
	@Resource(name="meService")
	MeService meService;
	
	@RequestMapping(value="/network.do", method=RequestMethod.GET)
	public ModelAndView network(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("network/network");
		String id="id1";
		String no=meService.getNo(id);
		ArrayList<Frd> frdto = service.getFrdTo(no);
		ArrayList<Frd> frdfrom = service.getFrdFrom(no);
		ArrayList<Frd> frdp=service.getFrdP(no);
		ArrayList<Frd> frd= service.getFrd(no);
		mav.addObject("frdto", frdto);
		mav.addObject("frdfrom", frdfrom);
		mav.addObject("frdp", frdp);
		mav.addObject("frd",frd);
		ArrayList<Frd> frdAll = service.getFrdAll(no);
		mav.addObject("frdAll",frdAll);
/*		if(frdp.size()==0) {
			ArrayList<Frd> frdAll = service.getFrdAll(no);
			mav.addObject("frdAll",frdAll);
		}else {
			mav.addObject("frdAll",null);
		}*/
		return mav;
	}
	@RequestMapping(value="/friendlist", method=RequestMethod.GET)
	public String frdlist2() {
		return "network/friendlist";
	}
	

	@RequestMapping(value="/friendlist.do", method=RequestMethod.GET)
	public ModelAndView frdlist(HttpServletRequest req) {
		String id="id1";
		String no=meService.getNo(id);
		ModelAndView mav = new ModelAndView("network/friendlist");
		ArrayList<Frd> frd= service.getFrd(no);
		mav.addObject("frd",frd);
		return mav;
	}
	
	@RequestMapping(value="/delfrdfrom.do")
	public ModelAndView delFrdFrom(HttpServletRequest req,@RequestParam(value = "no") String no) {
		ModelAndView mav=new ModelAndView("result");
		String id="id1";
		String myno=meService.getNo(id);
		String frdNo=service.getIngFrdNo(myno,no);
		service.delFrdFrom(frdNo);
		mav.addObject("result","1");
		return mav;
	}	
}