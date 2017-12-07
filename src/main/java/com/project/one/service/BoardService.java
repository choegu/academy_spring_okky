package com.project.one.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.BoardDao;
import com.project.one.vo.BoardPageVO;
import com.project.one.vo.BoardVO;

@Component
public class BoardService {

	@Autowired
	private BoardDao dao;
	
	private static final int COUNT_PER_PAGE = 12;
	
	// 게시판 페이지 작성
	public BoardPageVO makeBoardPage(int currentPage) {
		int totalCount = dao.selectTotalCount();
		int totalPage = totalCount/COUNT_PER_PAGE;
		if (totalCount%COUNT_PER_PAGE!=0) {
			totalPage++;
		}
		
		int startPage = (currentPage-1)/10*10+1;
		int endPage = startPage+9;
		
		if (totalPage<endPage) {
			endPage = totalPage;
		}
		
		int startRow = (currentPage-1)*COUNT_PER_PAGE;
		
		List<BoardVO> boardList = dao.selectList(startRow, COUNT_PER_PAGE);
		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPage);
	}
	
	// 게시판 페이지 검색
	public BoardPageVO searchBoardPage(int currentPage, String searchOption ,String searchText, String category) {
		int totalCount;
		
		if (category==null || category.isEmpty()) {
			if (searchOption.equals("title")) {
				totalCount = dao.searchTitleCount(searchText);
			} else if (searchOption.equals("content")) {
				totalCount = dao.searchContentCount(searchText);
			} else if (searchOption.equals("titleContent")) {
				totalCount = dao.searchTitleContentCount(searchText);
			} else if (searchOption.equals("writer")) {
				totalCount = dao.searchWriterCount(searchText);
			} else if (searchOption.equals("category")) {
				totalCount = dao.searchCategoryCount(category);
			} else {
				totalCount = dao.selectTotalCount();
			}
		} else {
			if (searchOption.equals("title")) {
				totalCount = dao.searchCategoryTitleCount(searchText, category);
			} else if (searchOption.equals("content")) {
				totalCount = dao.searchCategoryContentCount(searchText, category);
			} else if (searchOption.equals("titleContent")) {
				totalCount = dao.searchCategoryTitleContentCount(searchText, category);
			} else if (searchOption.equals("writer")) {
				totalCount = dao.searchCategoryWriterCount(searchText, category);
			} else if (searchOption.equals("category")) {
				totalCount = dao.searchCategoryCount(category);
			} else {
				totalCount = dao.selectTotalCount();
			}
		}

		
		
		int totalPage = totalCount/COUNT_PER_PAGE;
		if (totalCount%COUNT_PER_PAGE!=0) {
			totalPage++;
		}
		
		int startPage = (currentPage-1)/10*10+1;
		int endPage = startPage+9;
		
		if (totalPage<endPage) {
			endPage = totalPage;
		}
		
		int startRow = (currentPage-1)*COUNT_PER_PAGE;
		
		List<BoardVO> boardList;
		
		if (category==null || category.isEmpty()) {
			if (searchOption.equals("title")) {
				boardList = dao.searchTitle(startRow, COUNT_PER_PAGE, searchText);
			} else if (searchOption.equals("content")) {
				boardList = dao.searchContent(startRow, COUNT_PER_PAGE, searchText);
			} else if (searchOption.equals("titleContent")) {
				boardList = dao.searchTitleContent(startRow, COUNT_PER_PAGE, searchText);
			} else if (searchOption.equals("writer")) {
				boardList = dao.searchWriter(startRow, COUNT_PER_PAGE, searchText);
			} else if (searchOption.equals("category")) {
				boardList = dao.searchCategory(startRow, COUNT_PER_PAGE, category);
			} else {
				boardList = dao.selectList(startRow, COUNT_PER_PAGE);
			}
		} else {
			if (searchOption.equals("title")) {
				boardList = dao.searchCategoryTitle(startRow, COUNT_PER_PAGE, searchText, category);
			} else if (searchOption.equals("content")) {
				boardList = dao.searchCategoryContent(startRow, COUNT_PER_PAGE, searchText, category);
			} else if (searchOption.equals("titleContent")) {
				boardList = dao.searchCategoryTitleContent(startRow, COUNT_PER_PAGE, searchText, category);
			} else if (searchOption.equals("writer")) {
				boardList = dao.searchCategoryWriter(startRow, COUNT_PER_PAGE, searchText, category);
			} else if (searchOption.equals("category")) {
				boardList = dao.searchCategory(startRow, COUNT_PER_PAGE, category);
			} else {
				boardList = dao.selectList(startRow, COUNT_PER_PAGE);
			}
		}

		
		return new BoardPageVO(boardList, currentPage, startPage, endPage, totalPage);
	}
	
	// 글쓰기
	public int write(BoardVO board, String loginId) {
		board.setRead_count(0);
		board.setWrite_date(new Date());
		board.setWriter(loginId);
		if (dao.selectTotalCount()==0) {
			board.setList(1);
		} else {
			board.setList(dao.maxList()+1);
		}
		return dao.insert(board);
	}
	
	// 답글쓰기
	public int reply(BoardVO board, String loginId, int ref_num) {
		int list = dao.replyList(ref_num);
		int level = dao.replyLevel(ref_num);
		board.setRead_count(0);
		board.setWrite_date(new Date());
		board.setWriter(loginId);
		board.setList(list);
		board.setLevel(level+1);
		
		if (dao.listCount(list)==1) {
			board.setRidx(1);
		} else {
			int ridx = dao.replyRidx(ref_num);
			
			if (dao.countRidx(list, level, ridx)==0) {
				board.setRidx(dao.inputMaxRidx(list));
			} else {
				int updateRidx = dao.inputRidx(list, level, ridx);
				dao.increaseRidx(list, updateRidx);
				board.setRidx(updateRidx);
			}
			
		}
		
		return dao.insert(board);
	}
	
	// 글 읽기
	public BoardVO read(int board_num, String loginId) {
		BoardVO board = dao.select(board_num);
		
		if (loginId!=null && loginId.equals(board.getWriter())) {
			return board;
		} else {
			dao.updateReadCount(board_num);
			return dao.select(board_num);
		}
	}
	
	// 글읽기 조회수 NOCOUNT
	public BoardVO readNoCount(int board_num) {
		return dao.select(board_num);
	}
	
	// 수정
	public boolean update(BoardVO board, String loginId) {
		BoardVO original = dao.select(board.getBoard_num());
		if (loginId!=null && loginId.equals(original.getWriter())) {
			board.setWrite_date(new Date());
			dao.update(board);
			return true;
		} else {
			return false;
		}
	}
	
	// 삭제
	public boolean delete(int board_num, String loginId) {
		BoardVO board = dao.select(board_num);
		
		if (loginId!=null && loginId.equals(board.getWriter())) {
			if (dao.replyExistCheck(board.getList(), board.getLevel()+1, board.getRidx()+1)==1) {
				dao.updateOpen(3, board_num);
			} else {
				dao.updateOpen(2, board_num);
//				dao.delete(board_num);
			}
			return true;
		} else {
			return false;
		}
	}
	
	public int writingCount(String loginId) {
		return dao.writingCount(loginId);
	}
	
}
