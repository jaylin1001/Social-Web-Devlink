package com.devlink.board;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devlink.dao.Board;
import com.devlink.dao.Member;

@Controller
public class BoardController {
	@Resource(name="boardService")
	private Service service;
	
	public void setService(Service service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/helpcenter.do", method = RequestMethod.GET)
	public ModelAndView helpcenter(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("me/helpcenter");
		HttpSession session = req.getSession(false);
		String id=(String)session.getAttribute("id");
		Member m = service.getMember(id);
		mav.addObject("m", m);
		return mav;
		
	}
	
	@RequestMapping(value = "/helpcenterlist.do", method = RequestMethod.GET)
	public ModelAndView helpcenterlist(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView("me/helpcenterlist");
		if(req.getSession(false)==null) {
		       return new ModelAndView("index");
		    }else {
		       if((String) req.getSession(false).getAttribute("no")==null)
		          return new ModelAndView("index");
		    }
		String no=(String)req.getSession(false).getAttribute("no");
		ArrayList<Board> b = service.getBoard(no);
		/*for(Board bb:b) {
			System.out.println("here : " + bb);
		}*/
		mav.addObject("bb", b);
		System.out.println(b);
		return mav;
	}
	
	@RequestMapping(value = "/write.do")
	public String write(Board b, HttpServletRequest req) {
		if(req.getSession(false)==null) {
	       return "index";
	    }else {
	       if((String) req.getSession(false).getAttribute("no")==null)
	          return "index";
	    }
		String no=(String)req.getSession(false).getAttribute("no");
		b.setM_no(no);
		service.addBoard(b);
		return "redirect:helpcenter.do";
	}
	
	@RequestMapping(value = "/helpcenterview.do")
	public String helpcenterview(HttpServletRequest req) {
		System.out.println("babo");
		/*return "me/helpcenterview";*/
		return "redirect:helpcenterview.jsp";
		/*return "index";*/
	}
	
	@RequestMapping(value = "/showboard.do")
	public ModelAndView showboard(@RequestParam(value = "bno") String bno) {
		System.out.println("showboard:" + bno);
		ModelAndView mav = new ModelAndView("me/helpboard");
		Board br = new Board();
		br.setB_no(bno);
		Board b = service.getContents(br.getB_no());
		/*for(Board bb:b) {
			System.out.println("showboardhere : " + bb);
		}*/
		mav.addObject("b",b);
		return mav;
	}
}
