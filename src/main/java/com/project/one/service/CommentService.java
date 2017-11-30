package com.project.one.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.CommentDao;
import com.project.one.vo.CommentVO;

@Component
public class CommentService {
	
	@Autowired
	private CommentDao dao;
	
    // 댓글 목록
    public List<CommentVO> commentList(int board_num) {
    	return dao.commentList(board_num);
    }
    public List<Integer> commentListCno(int board_num) {
    	return dao.commentListCno(board_num);
    }
 
    // 댓글 작성
    public int commentInsert(CommentVO comment) {
    	comment.setWrite_date(new Date());
    	comment.setOpen(1); //공개글
    	
		if (dao.selectTotalCommentCount(comment.getBoard_num())==0) {
			comment.setList(1);
		} else {
			comment.setList(dao.maxCommentList(comment.getBoard_num())+1);
		}
		
    	return dao.commentInsert(comment);
    }
    
	// 대댓글 쓰기
	public int replyComment(CommentVO comment, int ref_comment_num) {
		int list = dao.replyCommentList(ref_comment_num);
		int level = dao.replyCommentLevel(ref_comment_num);
		comment.setWrite_date(new Date());
		comment.setList(list);
		comment.setLevel(level+1);
		comment.setOpen(1); //공개글
		
		if (dao.listCountComment(list, comment.getBoard_num())==1) {
			comment.setRidx(1);
		} else {
			int ridx = dao.replyCommentRidx(ref_comment_num);
			
			if (dao.countCommentRidx(list, level, ridx, comment.getBoard_num())==0) {
				comment.setRidx(dao.inputCommentMaxRidx(list, comment.getBoard_num()));
			} else {
				int updateRidx = dao.inputCommentRidx(list, level, ridx, comment.getBoard_num());
				dao.increaseCommentRidx(list, updateRidx, comment.getBoard_num());
				comment.setRidx(updateRidx);
			}
			
		}
		
		return dao.commentInsert(comment);
	}
    
    // 댓글 수정
    public int commentUpdate(CommentVO comment) {
    	comment.setOpen(1); //공개글
    	return dao.commentUpdate(comment);
    }
 
    // 댓글 삭제
    public int commentDelete(int comment_num, String loginId) {
//    	return dao.commentDelete(comment_num);
    	
		CommentVO comment = dao.selectComment(comment_num);
		
		if (loginId!=null && loginId.equals(comment.getWriter())) {
			if (dao.replyExistCheckComment(comment.getList(), comment.getLevel()+1, comment.getRidx()+1, comment.getBoard_num())==1) {
				dao.updateOpenComment(3, comment_num);
			} else {
				dao.updateOpenComment(2, comment_num);
			}
			return 1;
		} else {
			return 0;
		}
    }
}
