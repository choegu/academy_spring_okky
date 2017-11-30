package com.project.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.one.service.MessageService;
import com.project.one.vo.MessageVO;

@Controller
public class MessageController {
	@Autowired
	private MessageService service;

	@RequestMapping("/receiveMessage.do")
	public ModelAndView receiveMessage(@RequestParam(defaultValue = "1") int page, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		loginId = "ase";
		ModelAndView mv = new ModelAndView();
		mv.addObject("messagePage", service.makeMessagePage(page, loginId, 1));
		mv.setViewName("receiveMessage_list");
		return mv;
	}

	@RequestMapping("/sendMessage.do")
	public ModelAndView sendMessage(@RequestParam(defaultValue = "1") int page, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		loginId = "ase";
		ModelAndView mv = new ModelAndView();
		mv.addObject("messagePage", service.makeMessagePage(page, loginId, 2));
		mv.setViewName("sendMessage_list");
		return mv;
	}

	@RequestMapping("/messageWriteForm.do")
	public String messageWriteForm() {
		return "messageWrite_form";
	}

	@ResponseBody
	@RequestMapping(value = "writeMessage.do", method = RequestMethod.POST)
	public String writeMessage(MessageVO message, HttpSession session) {
		System.out.println("dsasdasdsads");
		String loginId = (String) session.getAttribute("loginId");
		loginId = "ase";
		if (service.receiveIdCheck(message.getReceive_id())) {
			if (service.writeMessage(message, loginId)) {
				return String.valueOf(0);
			}else {
				return String.valueOf(1);
			}
		} else {
			return String.valueOf(2);
		}
	}

}
