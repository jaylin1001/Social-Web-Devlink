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
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav = new ModelAndView("network/network");
		String no=(String) req.getSession(false).getAttribute("no");
		ArrayList<Frd> frdto = service.getFrdTo(no);
		ArrayList<Frd> frdfrom = service.getFrdFrom(no);
		ArrayList<Frd> frdp=service.getFrdP(no);
		ArrayList<Frd> frd= service.getFrd(no);
		mav.addObject("frdto", frdto);
		mav.addObject("frdfrom", frdfrom);
		mav.addObject("frdp", frdp);
		mav.addObject("frd",frd);
/*		ArrayList<Frd> frdAll = service.getFrdAll(no);
		mav.addObject("frdAll",frdAll);*/
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
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		String no=(String) req.getSession(false).getAttribute("no");
		ModelAndView mav = new ModelAndView("network/friendlist");
		ArrayList<Frd> frd= service.getFrd(no);
		mav.addObject("frd",frd);
		return mav;
	}
	
	@RequestMapping(value="/delfrdfrom.do")
	public ModelAndView delFrdFrom(HttpServletRequest req,@RequestParam(value = "no") String no) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav=new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		String frdNo=service.getIngFrdNo(myno,no);
		if(frdNo!=null) {
			service.delFrdFrom(frdNo);	
		}
		mav.addObject("result","1");
		return mav;
	}
	
	@RequestMapping(value="/frdtoOk.do")
	public ModelAndView frdtoOk(HttpServletRequest req,@RequestParam(value="m_no") String no) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav=new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		String frdNo=service.getIngFrdNo(myno,no);
		if(frdNo==null) {
			frdNo=service.isFrd(myno,no);
			if(frdNo!=null) {
				mav.addObject("result","1");
			}
			else {
				mav.addObject("result","2");
			}
			return mav;
		}
		service.frdtoOk(frdNo);
		mav.addObject("result","1");
		return mav;
	}
	
	@RequestMapping(value="/addFrdReq.do")
	public ModelAndView addFrdReq(HttpServletRequest req,@RequestParam(value="m_no") String no) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav=new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		String frdNo=service.getIngFrdToMeNo(myno,no);
		if(frdNo==null) {
			frdNo=service.isFrd(myno,no);
			if(frdNo!=null) {
				mav.addObject("result","3");
				return mav;
			}
		}else {
			mav.addObject("result","2");
			return mav;
		}
		frdNo=service.getFrdFromMeNo(myno,no);
		if(frdNo==null)
			service.addFrdReq(myno,no);
		mav.addObject("result","1");
		return mav;
	}
	
	@RequestMapping(value="/delFrdReq.do")
	public ModelAndView delFrdReq(HttpServletRequest req,@RequestParam(value="m_no") String no) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav=new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		String frdNo=service.getIngFrdNo(myno,no);
		if(frdNo!=null) {
			frdNo=service.isFrd(myno,no);
			if(frdNo!=null) {
				mav.addObject("result","3");
				return mav;
			}
		}else {
			mav.addObject("result","1");
			return mav;
		}
		service.delFrdReq(myno,no);
		mav.addObject("result","1");
		return mav;
	}

	@RequestMapping(value="/delFrd.do")
	public ModelAndView delFrd(HttpServletRequest req,@RequestParam(value="m_no") String no) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav=new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		service.delFrd(myno,no);
		mav.addObject("result","1");
		return mav;
	}
}