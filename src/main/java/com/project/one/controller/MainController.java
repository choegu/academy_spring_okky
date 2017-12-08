package com.project.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.one.service.MemberService;
import com.project.one.service.MessageService;
import com.project.one.vo.MemberVO;

@Controller
public class MainController {
	@Autowired
	private MessageService messageService;
	@Autowired
	private MemberService memberService;
	
	
	@RequestMapping("/main.do")
	public ModelAndView main(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		int noCheckMessage = messageService.noCheckMessageCount(loginId);
		MemberVO member = memberService.selectMemberInfo(loginId);
		mv.addObject("member",member);
		mv.addObject("noCheck",noCheckMessage);
		mv.addObject("loginId",loginId);
		mv.setViewName("index");
		return mv;
	}
}
