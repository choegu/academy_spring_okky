package com.project.one.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.project.one.service.CommunityService;
import com.project.one.vo.CommunityBoardPageVO;
import com.project.one.vo.CommunityBoardVO;
import com.project.one.vo.CommunityCommentPageVO;
import com.project.one.vo.CommunityCommentVO;

@Controller
public class CommunityController {
	
	@Autowired
	private CommunityService service;

	@RequestMapping("/commMain.do")
	public ModelAndView boardList(@RequestParam(defaultValue = "1") int page) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardPage", service.makeBoardPage(page));
		mv.setViewName("comm_board_list");
		return mv;
	}
	
	@RequestMapping("/commWriteForm.do")
	public ModelAndView writeForm(@RequestParam(defaultValue = "0") int list,
			@RequestParam(defaultValue = "0") int level, 
			@RequestParam(defaultValue = "0") int ridx) {
		System.out.println("writeForm list:"+list+",level:"+level+",ridx:"+ridx);
		ModelAndView mv = new ModelAndView("comm_write_form");

		mv.addObject("list", list);
		mv.addObject("level", level);
		mv.addObject("ridx", ridx);

		return mv;
	}

	@RequestMapping(value = "/commWrite.do", method = RequestMethod.POST)
	public ModelAndView write(CommunityBoardVO board, HttpSession session) {
		System.out.println("controll write = " + board.getBoardNum());
		String loginId = (String) session.getAttribute("loginId");
		
		int result = service.write(board, loginId);
		CommunityBoardVO vo = service.readNoCount(result);

		ModelAndView mv = new ModelAndView();
		mv.addObject("board", vo);
		mv.setViewName("comm_read");
		return mv;
	}
	
	@RequestMapping("commComment.do")
	public void ajaxComment(HttpServletResponse res, int boardNum, String content, String writer) {
		System.out.println("ajaxReply content:"+content+", writer:"+writer);
		
		CommunityCommentVO comment = service.insertComment(boardNum, content, writer);
		System.out.println(comment);
		res.setContentType("text/json;charset=utf8");
		try {			
			res.getWriter().print(new Gson().toJson(comment));
		} catch (IOException e) {
			System.out.println("오류:댓글 저장에 문제가 생겼습니다.");
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="commCommentList.do", method = RequestMethod.POST)
	public void ajaxCommentList(int boardNum, @RequestParam(defaultValue="1") int page, HttpServletResponse response) {
		System.out.println("cmtListController : "+boardNum +", "+page);
		CommunityCommentPageVO list = service.selectCommentList(boardNum, page);
		response.setContentType("text/json;charset=utf8");
		try {
			response.getWriter().print(new Gson().toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="commDeleteComment.do", method = RequestMethod.POST)
	public void ajaxCommentDel(HttpServletResponse response, int commentNum) {
		boolean result = service.deleteComment(commentNum);
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="commUpdateComment.do", method=RequestMethod.POST)
	public void ajaxCommentUpdate(HttpServletResponse response, int commentNum, String content) {
		boolean result = service.updateComment(commentNum, content);
		try {
			response.getWriter().print(result);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = "/commRead.do", method = RequestMethod.GET)
	public ModelAndView read(int boardNum, HttpSession session) {
		String loginId = (String) session.getAttribute("loginId");
		if (loginId == null) {
			loginId = "";
		}
		ModelAndView mv = new ModelAndView();

		CommunityBoardVO board = service.read(boardNum, loginId);
		mv.addObject("board", board);
		mv.setViewName("comm_read");
		return mv;
	}

	@RequestMapping("/commUpdateForm.do")
	public ModelAndView updateForm(int boardNum) {
		// 조회 증가 없이 원본 조회
		CommunityBoardVO board = service.readNoCount(boardNum);
		ModelAndView mv = new ModelAndView();
		mv.addObject("original", board);
		mv.setViewName("comm_update_form");
		return mv;
	}

	@RequestMapping(value="/commUpdate.do", method=RequestMethod.POST)
	public ModelAndView update(CommunityBoardVO board, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		boolean result = service.update(board, (String) session.getAttribute("loginId"));
		
		System.out.println("controller update.do : "+board.getBoardNum()+","+result);
		if (result) {
			mv.addObject("boardNum", board.getBoardNum());
			mv.setViewName("comm_update_success");
		} else {
			mv.setViewName("comm_update_fail");
		}
		return mv;
	}

	@RequestMapping("/commDelete.do")
	public ModelAndView delete(HttpSession session, int boardNum) {
		String loginId = (String) session.getAttribute("loginId");

		boolean result = service.delete(loginId, boardNum);

		ModelAndView mv = new ModelAndView();
		mv.addObject("result", result);
		mv.setViewName("comm_delete_result");
		return mv;
	}

	@RequestMapping("/commBoardListSearch.do")
	public ModelAndView searchList(@RequestParam(defaultValue = "1") int page, int searchSelect, String searchWord) {
		System.out.println("searchSelect : " + searchSelect + ", searchWord:" + searchWord);
		CommunityBoardPageVO vo = service.makeSearchBoardPage(page, searchSelect, searchWord);

		System.out.println(vo);
		ModelAndView mv = new ModelAndView();
		mv.addObject("boardPage", vo);
		mv.setViewName("comm_board_search_list");
		return mv;
	}

}
