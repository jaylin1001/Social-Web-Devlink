package com.devlink.home.cont;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.devlink.dao.Coment;
import com.devlink.dao.Frd;
import com.devlink.dao.HomeContents;
import com.devlink.home.service.Service;
import com.devlink.network.service.NetService;

@Controller
public class MainController {
	@Resource(name="mainService")
	Service service;

	@Resource(name="netService")
	NetService nService;
	
	@RequestMapping(value="/home.do", method=RequestMethod.GET)
	public ModelAndView home(HttpServletRequest req) {
		HttpSession session = req.getSession(false);
		if(session==null)
			return new ModelAndView("index");
		else{
			if(req.getSession(false).getAttribute("id")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav = new ModelAndView("home/home");
		String no=(String)session.getAttribute("no");
		ArrayList<HomeContents> hc = service.docselect(no);
		System.out.println(hc);
		mav.addObject("hc", hc);
		ArrayList<Frd> frd= nService.getFrd(no);
		mav.addObject("frd",frd);
		System.out.println(frd.size());
		return mav;
	}
	
	@RequestMapping(value="/cmtwrite", method=RequestMethod.POST)
	public ModelAndView doccmt(HttpServletRequest req,@ModelAttribute Coment cm)throws Exception {
		System.out.println("cmtwrite들어옴");
		ModelAndView mav = null;
		HttpSession session = req.getSession(false);
		if(session==null)
			return new ModelAndView("index");
		else{
			if(req.getSession(false).getAttribute("id")==null)
				return new ModelAndView("index");
		}
		String no=(String)session.getAttribute("no");
		if(cm.getCmt() == null) {
		System.out.println("cmtnull들어옴");
		ArrayList<HomeContents> hccmt = service.doccmtselect(cm.getDoc_num());
		System.out.println(hccmt);
		mav = new ModelAndView("home/homeresult");
		mav.addObject("hccmt", hccmt);
		System.out.println("dafasdfasdfasdf"+hccmt);

		}else {
		System.out.println("cmcm"+cm);
		cm.setW_no(no);
		service.cmtinsert(cm);
		mav = new ModelAndView("redirect:/home");
		}
		return mav;
	}
	
	
	@RequestMapping(value="/docwrite.do", method=RequestMethod.POST)
	public String docwrite(HttpServletRequest req,@ModelAttribute HomeContents hc)throws Exception {
		System.out.println("docwrite.do");
		HttpSession session = req.getSession(false);
		if(session==null)
			return "redirect:/";
		else{
			if(req.getSession(false).getAttribute("id")==null)
				return "redirect:/";
		}
		String no=(String)session.getAttribute("no");
		String title = "testTitle";
		
		hc.setM_no(no);
		hc.setTitle(title);
		System.out.println(hc);
		if(hc.getContents() ==  null) {
			hc.setContents(hc.getEditor());
			hc.setDoc_kind("1");
			//code
		}else {
			hc.setDoc_kind("0");
			//markdown
		}
		service.writeinsert(hc);
		return "redirect:/home";
	}
	@RequestMapping(value="/docdel.do", method=RequestMethod.POST)
	public String docdel(@ModelAttribute String doc_num)throws Exception {
		System.out.println(doc_num);
		try {
		service.docnumdelete(doc_num);
		}catch(Exception e){
			e.printStackTrace();
		}
		return "home/home";
	}

	

}
