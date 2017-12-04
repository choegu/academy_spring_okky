package com.project.one.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.mapper.BoardMapper;
import com.project.one.vo.BoardVO;

@Component
public class BoardDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	public int insert(BoardVO board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.insert(board);
	}
	public int selectTotalCount() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectTotalCount();
	}
	public int searchTitleCount(String keyword) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchTitleCount(keyword);
	}
	public int searchContentCount(String keyword) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchContentCount(keyword);
	}
	public int searchTitleContentCount(String keyword) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchTitleContentCount(keyword);
	}
	public int searchWriterCount(String keyword) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchWriterCount(keyword);
	}
	public int searchCategoryCount(String keyword) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryCount(keyword);
	}
	public int searchCategoryTitleCount(String keyword, String category) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryTitleCount(keyword, category);
	}
	public int searchCategoryContentCount(String keyword, String category) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryContentCount(keyword, category);
	}
	public int searchCategoryTitleContentCount(String keyword, String category) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryTitleContentCount(keyword, category);
	}
	public int searchCategoryWriterCount(String keyword, String category) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryWriterCount(keyword, category);
	}
	public BoardVO select(int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.select(board_num);
	}
	public List<BoardVO> selectList(int startRow, int count) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectList(startRow, count);
	}
	public List<BoardVO> searchTitle(int startRow, int count, String keyword) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchTitle(startRow, count, keyword);
	}
	public List<BoardVO> searchContent(int startRow, int count, String keyword){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchContent(startRow, count, keyword);
	}
	public List<BoardVO> searchTitleContent(int startRow, int count, String keyword) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchTitleContent(startRow, count, keyword);
	}
	public List<BoardVO> searchWriter(int startRow, int count, String keyword){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchWriter(startRow, count, keyword);
	}
	public List<BoardVO> searchCategory(int startRow, int count, String keyword){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategory(startRow, count, keyword);
	}
	public List<BoardVO> searchCategoryTitle(int startRow, int count, String keyword, String category) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryTitle(startRow, count, keyword, category);
	}
	public List<BoardVO> searchCategoryContent(int startRow, int count, String keyword, String category){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryContent(startRow, count, keyword, category);
	}
	public List<BoardVO> searchCategoryTitleContent(int startRow, int count, String keyword, String category) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryTitleContent(startRow, count, keyword, category);
	}
	public List<BoardVO> searchCategoryWriter(int startRow, int count, String keyword, String category){
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.searchCategoryWriter(startRow, count, keyword, category);
	}
	public int updateReadCount(int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.updateReadCount(board_num);
	}
	public int update(BoardVO board) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.update(board);
	}
	public int updateOpen(int open, int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.updateOpen(open, board_num);
	}
	public int delete(int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.delete(board_num);
	}
	public int maxList() {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.maxList();
	}
	public int replyList(int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.replyList(board_num);
	}
	public int replyLevel(int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.replyLevel(board_num);
	}
	public int replyRidx(int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.replyRidx(board_num);
	}
	public int replyExistCheck(int list, int level, int ridx) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.replyExistCheck(list, level, ridx);
	}
	public int listCount(int list) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.listCount(list);
	}
	public int countRidx(int list, int level, int ridx) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.countRidx(list, level, ridx);
	}
	public int inputRidx(int list, int level, int ridx) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.inputRidx(list, level, ridx);
	}
	public int inputMaxRidx(int list) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.inputMaxRidx(list);
	}
	public int increaseRidx(int list, int ridx) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.increaseRidx(list, ridx);
	}
}
