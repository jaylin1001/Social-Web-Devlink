package com.devlink.network.cont;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.devlink.dao.Certification;
import com.devlink.dao.Education;
import com.devlink.dao.Exp;
import com.devlink.dao.Frd;
import com.devlink.dao.Honor;
import com.devlink.dao.Language;
import com.devlink.dao.Member;
import com.devlink.dao.Patent;
import com.devlink.dao.Skill;
import com.devlink.dao.TestScore;
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
				mav.addObject("result","1");//이미 친구가 된 상태 근데 여기 올일이 없음 잘못짬
			}
			else {
				mav.addObject("result","2");//친구 신청을 상대가 취소해버림
			}
			return mav;
		}
		service.frdtoOk(frdNo);
		mav.addObject("result","1");//친구 오케 함
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
	

	@RequestMapping(value="/viewotherprofile.do", method=RequestMethod.GET)
	public ModelAndView viewIntro(HttpServletRequest req,@RequestParam(value="no") String no) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		String id=service.getIdByNo(no);
		ModelAndView mav = new ModelAndView("network/viewOthersProfile");
		Member m = meService.getIntro(id);
		ArrayList<Certification> certi=meService.getCerti(id);
		ArrayList<Education> edu=meService.getEdu(id);
		ArrayList<Exp> exp=meService.getExp(id);
		ArrayList<Honor> honor=meService.getHonor(id);
		ArrayList<Language> lang=meService.getLang(id);
		ArrayList<Skill> skill=meService.getSkill(id);
		ArrayList<Patent> patent =meService.getPatent(id);
		ArrayList<TestScore> ts = meService.getTestScore(id);
		int st=meService.howSt(certi,edu,exp,honor,lang,skill,patent,ts);
		String color = meService.howColor(st);
		ArrayList<Frd> frd= service.getFrd((String)req.getSession(false).getAttribute("no"));
		ArrayList<Frd> otherfrd= service.getFrd(m.getM_no());
		mav.addObject("frd",frd);
		mav.addObject("otherfrd",otherfrd);
		mav.addObject("m", m);
		mav.addObject("certi", certi);
		mav.addObject("edu", edu);
		mav.addObject("exp", exp);
		mav.addObject("honor", honor);
		mav.addObject("lang", lang);
		mav.addObject("skill", skill);
		mav.addObject("patent", patent);
		mav.addObject("ts", ts);
		mav.addObject("st",st);
		mav.addObject("color",color);
		return mav;
	}
	
	@RequestMapping(value="/otherfriendlist.do", method=RequestMethod.GET)
	public ModelAndView otherfriendlist(HttpServletRequest req,@RequestParam(value="no") String no) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav = new ModelAndView("network/otherfriendlist");
		ArrayList<Frd> frd= service.getFrd(no);
		mav.addObject("frd",frd);
		return mav;
	}
	
	@RequestMapping(value="/searchfrdbystr.do", method=RequestMethod.GET)
	public ModelAndView searchfrdbystr(HttpServletRequest req, @RequestParam(value="str")String str) {
		ModelAndView mav = new ModelAndView("srStrResult");
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		String myno=(String) req.getSession(false).getAttribute("no");
		ArrayList<Member> frd=service.getFrdlike(str,myno);
		ArrayList<Member> frding=service.getFrdinglike(str,myno);
		ArrayList<Member> frding2=service.getFrdinglike2(str,myno);//fromme
		ArrayList<Member> frdnot=service.getFrdPlike(str,myno);
		ArrayList<Frd> myfrd= service.getFrd(myno);
		mav.addObject("myfrd",myfrd);
		mav.addObject("frd", frd);
		mav.addObject("frding", frding);
		mav.addObject("frding2", frding2);
		mav.addObject("frdnot", frdnot);
		return mav;
	}
	@RequestMapping(value="/delfrdchg.do", method=RequestMethod.POST)
	public ModelAndView delfrdchg(HttpServletRequest req,@RequestParam(value="fno") String fno) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav = new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		service.delFrd(myno, fno);
		return mav;	
	}
	@RequestMapping(value="/ingfrdchg.do", method=RequestMethod.POST)
	public ModelAndView ingfrdchg(HttpServletRequest req,@RequestParam(value="fno") String fno) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav = new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		if(service.isFrd(myno, fno)!=null) {
			mav.addObject("result", "2");//친구되어버림
			return mav;
		}
		String frdNo=service.getFrdFromMeNo(myno, fno);
		if(frdNo!=null) {
			service.delFrdFrom(frdNo);
		}
		mav.addObject("result", "1");//그쪽에서 삭제
		return mav;
	}
	@RequestMapping(value="/nofrdchg.do", method=RequestMethod.POST)
	public ModelAndView nofrdchg(HttpServletRequest req,@RequestParam(value="fno") String fno) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav = new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		if(service.getIngFrdToMeNo(myno, fno)!=null) {
			mav.addObject("result", "<button type=\"button\" class=\"btn btn-info\" onclick=\"frdtoOk("+fno+")\">수락</button><button type=\"submit\" class=\"btn btn-warning\" onclick=\"frdingdel("+fno+")\">거절</button>");
			return mav;
			//오키 취소
		}
		service.addFrdReq(myno, fno);
		mav.addObject("result", "1");
		return mav;	
	}

	@RequestMapping(value="/delfrdtome.do", method=RequestMethod.POST)
	public ModelAndView delfrdtome(HttpServletRequest req,@RequestParam(value="fno") String fno) {
		if(req.getSession(false)==null) {
			return new ModelAndView("index");
		}else {
			if((String) req.getSession(false).getAttribute("no")==null)
				return new ModelAndView("index");
		}
		ModelAndView mav = new ModelAndView("result");
		String myno=(String) req.getSession(false).getAttribute("no");
		String frdNo=service.getIngFrdNo(myno,fno);
		if(frdNo==null) {
			frdNo=service.isFrd(myno,fno);
			if(frdNo!=null) {
				mav.addObject("result","1");//이미 친구가 된 상태
			}
			else {
				mav.addObject("result","2");//친구 신청을 상대가 취소해버림
			}
			return mav;
		}
		service.delIngFrd(frdNo);
		mav.addObject("result","2");//친구 지움
		return mav;
	}
}