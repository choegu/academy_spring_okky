package com.project.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.one.service.MemberService;
import com.project.one.service.MessageService;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MessageService messageService;
	
	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView login(String id,String pw,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(service.loginCheck(id,pw)) {
			session.setAttribute("loginId", id);
			int noCheckMessage = messageService.noCheckMessageCount(id);
			mv.addObject("noCheck",noCheckMessage);
			mv.addObject("loginId",id);
			mv.setViewName("index");
		}else {
			mv.setViewName("login_fail");
		}
		return mv;
	}
	
	@RequestMapping("/logOut.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "index";
	}
}
