package com.project.one.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.one.vo.CommentVO;

public interface CommentMapper {
    // ��� ����
    public int commentCount();
 
    // ��� ���
    public List<CommentVO> commentList(int board_num);
    public List<Integer> commentListCno(int board_num);
 
    // ��� �ۼ�
    public int commentInsert(CommentVO comment);
    
    // ��� ����
    public int commentUpdate(CommentVO comment);
 
    // ��� ����
    public int commentDelete(int comment_num);
    public CommentVO selectComment(int comment_num);
    public int replyExistCheckComment(@Param("list")int list, @Param("level")int level, @Param("ridx")int ridx, @Param("board_num")int board_num);
    public int updateOpenComment(@Param("open")int open, @Param("comment_num")int comment_num);
    
    // ���� ����
    public int selectTotalCommentCount(int board_num);
    public int maxCommentList(int board_num);
	public int replyCommentList(int comment_num);
	public int replyCommentLevel(int comment_num);
	public int replyCommentRidx(int comment_num);
	public int listCountComment(@Param("list")int list, @Param("board_num")int board_num);
	public int countCommentRidx(@Param("list")int list, @Param("level")int level, @Param("ridx")int ridx, @Param("board_num")int board_num);
	public int inputCommentRidx(@Param("list")int list, @Param("level")int level, @Param("ridx")int ridx, @Param("board_num")int board_num);
	public int inputCommentMaxRidx(@Param("list")int list, @Param("board_num")int board_num);
	public int increaseCommentRidx(@Param("list")int list, @Param("ridx")int ridx, @Param("board_num")int board_num);
    
}
