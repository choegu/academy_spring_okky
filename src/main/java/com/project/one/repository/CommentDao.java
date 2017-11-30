package com.project.one.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.mapper.CommentMapper;
import com.project.one.vo.CommentVO;

@Component
public class CommentDao {

	@Autowired
	private SqlSessionTemplate session;
	
    // ´ñ±Û °³¼ö
    public int commentCount() {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.commentCount();
    }
 
    // ´ñ±Û ¸ñ·Ï
    public List<CommentVO> commentList(int board_num) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.commentList(board_num);
    }
    public List<Integer> commentListCno(int board_num) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.commentListCno(board_num);
    }
 
    // ´ñ±Û ÀÛ¼º
    public int commentInsert(CommentVO comment) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.commentInsert(comment);
    }
    
    // ´ñ±Û ¼öÁ¤
    public int commentUpdate(CommentVO comment) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.commentUpdate(comment);
    }
 
    // ´ñ±Û »èÁ¦
    public int commentDelete(int comment_num) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.commentDelete(comment_num);
    }
    public CommentVO selectComment(int comment_num) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.selectComment(comment_num);
    }
    public int replyExistCheckComment(int list, int level, int ridx, int board_num) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.replyExistCheckComment(list, level, ridx, board_num);
    }
    public int updateOpenComment(int open, int comment_num) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.updateOpenComment(open, comment_num);
    }
    
    
    // ´ë´ñ±Û °ü·Ã
    public int selectTotalCommentCount(int board_num) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.selectTotalCommentCount(board_num);
    }
    public int maxCommentList(int board_num) {
    	CommentMapper mapper = session.getMapper(CommentMapper.class);
    	return mapper.maxCommentList(board_num);
    }
	public int replyCommentList(int comment_num) {
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		return mapper.replyCommentList(comment_num);
	}
	public int replyCommentLevel(int comment_num) {
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		return mapper.replyCommentLevel(comment_num);
	}
	public int replyCommentRidx(int comment_num) {
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		return mapper.replyCommentRidx(comment_num);
	}
	public int listCountComment(int list, int board_num) {
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		return mapper.listCountComment(list, board_num);
	}
	public int countCommentRidx(int list, int level, int ridx, int board_num) {
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		return mapper.countCommentRidx(list, level, ridx, board_num);
	}
	public int inputCommentRidx(int list, int level, int ridx, int board_num) {
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		return mapper.inputCommentRidx(list, level, ridx, board_num);
	}
	public int inputCommentMaxRidx(int list, int board_num) {
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		return mapper.inputCommentMaxRidx(list, board_num);
	}
	public int increaseCommentRidx(int list, int ridx, int board_num) {
		CommentMapper mapper = session.getMapper(CommentMapper.class);
		return mapper.increaseCommentRidx(list, ridx, board_num);
	}
	
}
