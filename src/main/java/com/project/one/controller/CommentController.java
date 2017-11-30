package com.project.one.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.project.one.service.CommentService;
import com.project.one.vo.CommentVO;

@Controller
//@RequestMapping("/board")
public class CommentController {
	
	@Autowired
    private CommentService service;
    
    
    @RequestMapping("/listComment.do") //¥Ò±€ ∏ÆΩ∫∆Æ
    @ResponseBody
    private void commentList(int board_num, HttpServletResponse resp) {
    	resp.setContentType("text/html;charset=UTF-8");
    	
    	Gson gson = new Gson();
    	try {
			resp.getWriter().write(gson.toJson(service.commentList(board_num)));
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    }
    @RequestMapping("/listCommentCno.do") //¥Ò±€ ∏ÆΩ∫∆Æ cno∏∏
    @ResponseBody
    private void commentListCno(int board_num, HttpServletResponse resp) {
    	Gson gson = new Gson();
    	try {
			resp.getWriter().write(gson.toJson(service.commentListCno(board_num)));
		} catch (IOException e) {
			e.printStackTrace();
		}
    	
    }
    
    @RequestMapping("/insertComment.do") //¥Ò±€ ¿€º∫ 
    @ResponseBody
    private String commentInsert(int board_num, String content, HttpSession session){
    	String loginId = (String)session.getAttribute("loginId");
    	
        CommentVO comment = new CommentVO();
        comment.setBoard_num(board_num);
        comment.setContent(content);
        comment.setWriter(loginId);  
        
        return service.commentInsert(comment)+"";
    }
    
    @RequestMapping("/replyComment.do") //¥Î¥Ò±€ ¿€º∫ 
    @ResponseBody
    private String replyComment(int ref_comment_num, CommentVO comment, HttpSession session){
    	String loginId = (String)session.getAttribute("loginId");
    	
        comment.setWriter(loginId);  
        
        return service.replyComment(comment, ref_comment_num)+"";
    }
    
    @RequestMapping(value="/updateComment.do", method=RequestMethod.POST) //¥Ò±€ ºˆ¡§  
    @ResponseBody
    private void commentUpdateProc(int comment_num, String content , HttpServletResponse resp) {
        
        CommentVO comment = new CommentVO();
        comment.setComment_num(comment_num);
        comment.setContent(content);
        
        try {
			resp.getWriter().write(service.commentUpdate(comment)+"");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    @RequestMapping(value="/deleteComment.do", method=RequestMethod.POST) //¥Ò±€ ªË¡¶  
    @ResponseBody
    private void commentServiceDelete(int comment_num, HttpSession session, HttpServletResponse resp) {
//    	Gson gson = new Gson();
//    	try {
//			resp.getWriter().write(gson.toJson(service.commentDelete(comment_num)));
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
    	
		String loginId = (String) session.getAttribute("loginId");
		
    	Gson gson = new Gson();
    	try {
			resp.getWriter().write(gson.toJson(service.commentDelete(comment_num, loginId)));
		} catch (IOException e) {
			e.printStackTrace();
		}
    }

    
}
