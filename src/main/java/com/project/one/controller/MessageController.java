package com.project.one.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.project.one.service.MemberService;
import com.project.one.service.MessageService;
import com.project.one.vo.MessageVO;


@Controller
public class MessageController {
	@Autowired
	private MessageService service;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/receiveMessage.do")
	public ModelAndView receiveMessage(@RequestParam(defaultValue = "1") int page, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mv = new ModelAndView();
		mv.addObject("messagePage", service.makeMessagePage(page, loginId, 1));
		mv.setViewName("receiveMessage_list");
		return mv;
	}

	@RequestMapping("/sendMessage.do")
	public ModelAndView sendMessage(@RequestParam(defaultValue = "1") int page, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		ModelAndView mv = new ModelAndView();
		mv.addObject("messagePage", service.makeMessagePage(page, loginId, 2));
		mv.setViewName("sendMessage_list");
		return mv;
	}

	@RequestMapping("/messageWriteForm.do")
	public ModelAndView messageWriteForm(@RequestParam(defaultValue = "") String receiveId) {
		ModelAndView mv = new ModelAndView();
		if(receiveId.equals("")) {
			mv.addObject("receiveId", receiveId);
			mv.setViewName("messageWrite_form");
		}else {
			if(memberService.receiveIdCheck(receiveId)) {
				mv.addObject("receiveId", receiveId);
				mv.setViewName("messageWrite_form");
			}else {
				mv.setViewName("message_fail");
			}
		}		
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "writeMessage.do", method = RequestMethod.POST)
	public String writeMessage(MessageVO message, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if (memberService.receiveIdCheck(message.getReceive_id())) {
			if (service.writeMessage(message, loginId)) {
				return String.valueOf(0);
			}else {
				return String.valueOf(1);
			}
		} else {
			return String.valueOf(2);
		}
	}
	
	@RequestMapping("/sendMessageRead.do")
	public ModelAndView sendMessageRead(int message_num) {
		ModelAndView mv = new ModelAndView();
		MessageVO message = service.sendMessageRead(message_num);
		mv.addObject("message",message);
		mv.setViewName("sendMessageRead");
		return mv;
	}
	
	@RequestMapping("/receiveMessageRead.do")
	public ModelAndView receiveMessageRead(int message_num) {
		ModelAndView mv = new ModelAndView();
		MessageVO message = service.receiveMessageRead(message_num);
		mv.addObject("message",message);
		mv.setViewName("receiveMessageRead");
		return mv;
	}
	
	@RequestMapping("/deleteReceiveAll.do")
	public String deleteReceiveAll(HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if(service.deleteReceiveAll(loginId)) {
			return "deleteReceiveAll_success";
		}else {
			return "deleteReceiveAll_fail";
		}
	}
	
	@RequestMapping("/deleteSendAll.do")
	public String deleteSendAll(HttpSession session) {
		System.out.println("dsadsadsad");
		String loginId = (String) session.getAttribute("loginId");
		if(service.deleteSendAll(loginId)) {
			return "deleteSendAll_success";
		}else {
			return "deleteSendAll_fail";
		}
	}

}
