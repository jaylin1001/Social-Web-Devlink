package com.devlink.me.cont;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.devlink.dao.Certification;
import com.devlink.dao.Education;
import com.devlink.dao.Exp;
import com.devlink.dao.Honor;
import com.devlink.dao.Language;
import com.devlink.dao.Member;
import com.devlink.dao.Skill;
import com.devlink.dao.TestScore;
import com.devlink.me.service.Service;

@Controller
public class MeController {
	Service service;
	@RequestMapping(value="/viewmyprofile", method=RequestMethod.GET)
	public String viewMyProfile2() {
		return "me/viewMyProfile";
	}

	@RequestMapping(value="/viewmyprofile", method=RequestMethod.GET)
	public ModelAndView viewIntro(HttpServletRequest req) {
		
		ModelAndView mav = new ModelAndView("me/viewMyProfile");
		
		String id="id1";
		Member m = service.getIntro(id);
		ArrayList<Certification> certi=service.getCerti(id);
		ArrayList<Education> edu=service.getEdu(id);
		ArrayList<Exp> exp=service.getExp(id);
		ArrayList<Honor> honor=service.getHonor(id);
		ArrayList<Language> lang=service.getLang(id);
		ArrayList<Skill> skill=service.getSkill(id);
		ArrayList<TestScore> ts = service.getTestScore(id);
		mav.addObject("m", m);
		mav.addObject("certi", certi);
		mav.addObject("edu", edu);
		mav.addObject("exp", exp);
		mav.addObject("honor", honor);
		mav.addObject("lang", lang);
		mav.addObject("skill", skill);
		mav.addObject("ts", ts);
		
		return mav;
	}
	
}
