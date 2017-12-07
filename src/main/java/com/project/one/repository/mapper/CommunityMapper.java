package com.project.one.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.one.vo.CommunityBoardVO;
import com.project.one.vo.CommunityCommentVO;


public interface CommunityMapper {
	public List<CommunityBoardVO> selectList(@Param("startRow") int startRow, @Param("count") int count);

	public CommunityBoardVO select(int boardNum);

	public int selectTotalCount();

	public int insert(CommunityBoardVO board);

	public int updateInsertList(int boardNum);

	public int updateReadCount(int boardNum);

	public int updateReplyRidx(@Param("list") int list, @Param("ridx") int ridx);

	public int updateInsertRidx(@Param("boardNum") int boardNum, @Param("ridx") int ridx);

	public int update(CommunityBoardVO board);

	public int delete(int boardNum);

	// ÄÚ¸àÆ®
	public int insertComment(CommunityCommentVO comment);

	public CommunityCommentVO selectComment(int CommentNum);

	public int selectCommentCount(int boardNum);

	public List<CommunityCommentVO> selectCommentList(@Param("boardNum") int boardNum, @Param("startRow") int startRow,
			@Param("count") int count);

	public int updateCommnet(CommunityCommentVO comment);

	public int deleteComment(int commentNum);

	public int deleteReply(int boardNum);

	// °Ë»ö
	public int selectWholeSearchCount(@Param("searchWord") String searchWord);

	public int selectTitleSearchCount(@Param("searchWord") String searchWord);

	public int selectContentSearchCount(@Param("searchWord") String searchWord);

	public int selectWriterSearchCount(@Param("searchWord") String searchWord);

	public List<CommunityBoardVO> selectWholeList(@Param("startRow") int startRow, @Param("count") int count,
			@Param("searchWord") String searchWord);

	public List<CommunityBoardVO> selectTitleList(@Param("startRow") int startRow, @Param("count") int count,
			@Param("searchWord") String searchWord);

	public List<CommunityBoardVO> selectContentList(@Param("startRow") int startRow, @Param("count") int count,
			@Param("searchWord") String searchWord);

	public List<CommunityBoardVO> selectWriterList(@Param("startRow") int startRow, @Param("count") int count,
			@Param("searchWord") String searchWord);

}
