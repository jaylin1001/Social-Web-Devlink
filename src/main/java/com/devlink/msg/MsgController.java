package com.devlink.msg;

import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class MsgController {
	@Resource(name = "msgService")
	private MsgServiceImpl service;
	public static String basePath = "C:\\Users\\pc\\Desktop\\my\\workspace\\.metadata"
			+ "\\.plugins\\org.eclipse.wst.server.core\\tmp0\\webapps\\shopimg\\";

	public void setService(MsgServiceImpl service) {
		this.service = service;
	}
	
	@RequestMapping(value = "/msg/msgList.do")
	public ModelAndView msgList(@RequestParam(value="from_id") String from_id,
			@RequestParam(value="to_id") String to_id) {
		//ModelAndView mav = new ModelAndView("msg/chat-ws");
		ModelAndView mav = new ModelAndView("msg/msgResult");
		ArrayList<Message> msglist = (ArrayList<Message>)service.setMsg(from_id, to_id);
		for(Message value : msglist) {
			System.out.println("msglist to22: " + value.getMsg_to() +" " 
					+"msglist from22: " + value.getMsg_from() );
		}
	
		mav.addObject("msgList", msglist);
		return mav;
	}
	@RequestMapping(value="/msg/msgmain.do")
	public ModelAndView frdList(HttpServletRequest req) {
		String from_id = (String)req.getSession(false).getAttribute("no");
		ModelAndView mav = new ModelAndView("msg/chat-ws");
		ArrayList<Friend> frdlist = (ArrayList<Friend>) service.setFrd(from_id);
		for(Friend value : frdlist) {
			System.out.println(value.getFrd_no()+". " + value.getFrd_name() );
		}
		if(frdlist.isEmpty()) {
			return mav;
		}else {
			String to_id = frdlist.get(0).getFrd_no();
			System.out.println("frdList의 from_id : " + from_id);
			mav.addObject("frdlist", frdlist);
			ArrayList<Message> msglist = (ArrayList<Message>)service.setMsg(from_id, to_id);
			for(Message value : msglist) {
				System.out.println("msglist to: " + value.getMsg_to() +" " 
						+"msglist from: " + value.getMsg_from() );
			}			
			mav.addObject("msgList", msglist);
			return mav;
		}
	}
	
	@RequestMapping(value="/msg/send.do")
	public void msgSend(@RequestParam(value="from_id") String from_id,
			@RequestParam(value="to_id") String to_id, 
			@RequestParam(value="msg")String msg) {
		System.out.println("msgSend controller 잘들어옴");
		System.out.println("from_id : " + from_id);
		System.out.println("to_id : " + to_id);
		System.out.println("msg : " + msg);
		service.addMsg(from_id, to_id, msg);
	}	
}
