package com.project.one.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
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
	public BoardVO select(int board_num) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.select(board_num);
	}
	public List<BoardVO> selectList(@Param("startRow")int startRow, @Param("count")int count) {
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		return mapper.selectList(startRow, count);
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
