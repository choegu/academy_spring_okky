package com.project.one.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.one.service.MemberService;
import com.project.one.service.MessageService;
import com.project.one.vo.MemberVO;


@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	@Autowired
	private MessageService messageService;

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public ModelAndView login(String id, String pw, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if (service.loginCheck(id, pw)) {
			session.setAttribute("loginId", id);
			int noCheckMessage = messageService.noCheckMessageCount(id);
			mv.addObject("noCheck", noCheckMessage);
			mv.addObject("loginId", id);
			mv.setViewName("index");
		} else {
			mv.setViewName("login_fail");
		}
		return mv;
	}

	@RequestMapping("/joinForm.do")
	public String joinForm() {
		return "join_form";
	}

	@ResponseBody
	@RequestMapping(value = "/checkId.do", method = RequestMethod.POST)
	public String checkId(String id) {
		System.out.println(id);
		if (id.equals("")) {
			return String.valueOf(2);
		} else {
			int count = service.selectIdCheck(id);
			return String.valueOf(count);
		}
	}

	@ResponseBody
	@RequestMapping(value = "/join.do", method = RequestMethod.POST)
	public String join(String pwCheck, MemberVO member) {
		System.out.println("dasdasdasdasdasdasdsa");
		System.out.println(member);
		if (member.getId().equals("") || member.getPw().equals("") || member.getName().equals("")
				|| member.geteMail().equals("") || member.getQuestion().equals("")
				|| member.getQuestionAnswer().equals("")) {
			return String.valueOf(4);
		} else {
			if (service.selectIdCheck(member.getId()) > 0) {
				return String.valueOf(1);
			} else if (!member.getPw().equals(pwCheck)) {
				return String.valueOf(2);
			} else {
				if (service.joinInsert(member)) {
					return String.valueOf(0);
				} else {
					return String.valueOf(3);
				}
			}
		}
	}
	
	@RequestMapping("/searchIdForm.do")
	public String searchIdForm() {
		return "searchId_form";
	}

	@RequestMapping("/searchId.do")
	public ModelAndView searchId(String name, String eMail) {
		System.out.println(name + eMail);
		ModelAndView mv = new ModelAndView();
		if (service.searchIdCount(name, eMail) > 0) {
			String searchId = service.selectId(name, eMail);
			mv.addObject("searchId", searchId);
			mv.setViewName("searchId_success");
		} else {
			mv.setViewName("searchId_fail");
		}
		return mv;
	}

	@RequestMapping("/beforeSearchPw.do")
	public String beforeSearchPw() {
		return "beforeSearchPw_form";
	}

	@RequestMapping(value="searchPwForm.do",method=RequestMethod.POST)
	public ModelAndView searchPwForm(String id) {
		ModelAndView mv = new ModelAndView();
		if (service.selectIdCheck(id)>0) {
			System.out.println(service.selectIdCheck(id));
			String question = service.questionSelect(id);
			mv.addObject("id", id);
			mv.addObject("question", question);
			mv.setViewName("searchPw_form");
		}else {
			mv.setViewName("beforeSearchPw_fail");
		}
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/searchPw.do", method = RequestMethod.POST)
	public void searchPw(MemberVO member, HttpServletResponse resp) {
		String result = "0";
		if(service.checkQuestionAnswer(member.getQuestionAnswer(),member.getId())>0) {
			String pw = service.selectPw(member.getQuestionAnswer(),member.getId());
			result = pw;
		}else {
			result = "0";
		}
		try {
			resp.getWriter().println(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping("/logOut.do")
	public String logOut(HttpSession session) {
		session.invalidate();
		return "index";
	}

}
