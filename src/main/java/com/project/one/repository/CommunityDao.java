package com.project.one.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.mapper.CommunityMapper;
import com.project.one.vo.CommunityBoardVO;
import com.project.one.vo.CommunityCommentVO;

@Component
public class CommunityDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int selectCount() {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectTotalCount();
	}
	
	public List<CommunityBoardVO> selectList(int startRow, int count) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);		
		return mapper.selectList(startRow, count);
	}
	
	public CommunityBoardVO select(int num){
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.select(num);
	}
	
	public int insert(CommunityBoardVO board) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.insert(board);
	}
	
	public int updateInsertList(int boardNum) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.updateInsertList(boardNum);
	}
	
	public int updateReadCount(int boardNum) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.updateReadCount(boardNum);
	}
	
	public int updateReplyRidx(int list, int ridx) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.updateReplyRidx(list, ridx);
	}
	
	public int updateInsertRidx(int boardNum, int ridx) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.updateInsertRidx(boardNum, ridx);
	}
	
	public int update(CommunityBoardVO board) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.update(board);
	}
	
	public int delete(int boardNum) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.delete(boardNum);
	}
	
	public int deleteReply(int boardNum) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.deleteReply(boardNum);
	}
	
	//°Ë»ö 
	public int selectWholeSearchCount(String searchWord) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectWholeSearchCount(searchWord);
	}
	
	public int selectTitleSearchCount(String searchWord) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectTitleSearchCount(searchWord);
	}
	
	public int selectContentSearchCount(String searchWord) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectContentSearchCount(searchWord);
	}
	
	public int selectWriterSearchCount(String searchWord) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectWriterSearchCount(searchWord);
	}
	
	public List<CommunityBoardVO> selectWholeList(int startRow, int count, String searchWord){
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectWholeList(startRow, count, searchWord);
	}
	
	public List<CommunityBoardVO> selectTitleList(int startRow, int count, String searchWord){
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectTitleList(startRow, count, searchWord);
	}
	
	public List<CommunityBoardVO> selectContentList(int startRow, int count, String searchWord){
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectContentList(startRow, count, searchWord);
	}
	
	public List<CommunityBoardVO> selectWriterList(int startRow, int count, String searchWord){
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectWriterList(startRow, count, searchWord);
	}

	//ÄÚ¸àÆ®
	public int insertComment(CommunityCommentVO comment) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.insertComment(comment);
	}
	
	public CommunityCommentVO selectComment(int commentNum) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectComment(commentNum);
	}
	
	public List<CommunityCommentVO> selectCommentList(int boardNum, int startRow, int count){
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectCommentList(boardNum, startRow, count);
	}
	
	public int selectCommentCount(int boardNum) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.selectCommentCount(boardNum);
	}

	public int deleteComment(int commentNum) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.deleteComment(commentNum);
	}
	
	public int updateComment(CommunityCommentVO comment) {
		CommunityMapper mapper = session.getMapper(CommunityMapper.class);
		return mapper.updateCommnet(comment);
				
	}
}
