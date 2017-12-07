package com.project.one.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.CommunityDao;
import com.project.one.vo.CommunityBoardPageVO;
import com.project.one.vo.CommunityBoardVO;
import com.project.one.vo.CommunityCommentPageVO;
import com.project.one.vo.CommunityCommentVO;

@Component
public class CommunityService {
	@Autowired
	private CommunityDao dao;

	private static final int COUNT_PER_PAGE = 10;
	private static final int COUNT_COMMENT_PAGE = 10;

	public CommunityBoardPageVO makeBoardPage(int currentPage) {
		// �Խñ� �� ����
		int totalCount = dao.selectCount();

		// �� �������� ���
		int totalPage = 0;
		try {
			totalPage = totalCount / COUNT_PER_PAGE;
			if (totalCount % COUNT_PER_PAGE != 0) {
				totalPage++;
			}
		} catch (ArithmeticException e) {
			e.printStackTrace();
		}

		// ȭ�� �ϴ��� ������ ��ũ(����)
		int startPage = (currentPage - 1) / 10 * 10 + 1;

		// ȭ�� �ϴ��� ������ ��ũ(��)
		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		// �� ��ȸ �� ���� ��ȣ ���
		int startRow = (currentPage - 1) * COUNT_PER_PAGE;
		// DB���� ������ �Խñ� �����ȸ
		List<CommunityBoardVO> boardList = dao.selectList(startRow, COUNT_PER_PAGE);

		// ��� ������ BoardPageVO ��ü�� ��Ƽ� ����
		CommunityBoardPageVO page = new CommunityBoardPageVO(boardList, currentPage, startPage, endPage, totalPage, totalCount);
		System.out.println("totalCount:" + totalCount + ",currentPage : " + currentPage + ", startPage : " + startPage
				+ ",endPage:" + endPage + ",totalPage:" + totalPage);
		return page;
	}

	// �� �Է�
	public int write(CommunityBoardVO board, String loginId) {
		board.setWriteDate(new Date());
		board.setWriter(loginId);

		System.out.println("write vo : " + board.toString());

		if (board.getList() == 0) {// ����
			dao.insert(board);
			dao.updateInsertList(board.getBoardNum());
		} else {// ���
			board.setLevel(board.getLevel() + 1);
			dao.insert(board);
			dao.updateReplyRidx(board.getList(), board.getRidx());
			dao.updateInsertRidx(board.getBoardNum(), board.getRidx() + 1);
		}
		return board.getBoardNum();
	}

	// �� ��������
	public CommunityBoardVO read(int boardNum, String loginId) {
		CommunityBoardVO board = dao.select(boardNum);

		if (loginId.equals(board.getWriter())) {
			// ���� �α��ε� ����ڿ� ���� �ۼ��ڿ� ������ ��ȸ�� ���� ����
			return board;
		} else {
			// ��ȸ�� ������Ű�� �ٽ� ��ȸ�ؼ� ��ȸ�ϱ�
			dao.updateReadCount(boardNum);
			return dao.select(boardNum);
		}
	}

	public CommunityBoardVO readNoCount(int boardNum) {
		CommunityBoardVO vo = dao.select(boardNum);
		return vo;
	}

	public boolean update(CommunityBoardVO board, String loginId) {
		CommunityBoardVO original = dao.select(board.getBoardNum());

		// ���� �α��ε� ����ڿ� ������ �� �ۼ��� ��ġ�ϸ�
		if (loginId != null && loginId.length() > 0) {
			// �����ϴ� ���� �ð� ���
			board.setWriteDate(new Date());
			dao.update(board);
			return true;
		} else {
			return false;
		}
	}

	public boolean delete(String loginId, int boardNum) {
		CommunityBoardVO board = dao.select(boardNum);

		if (loginId != null && loginId.equals(board.getWriter())) {
			if(board.getLevel() == 0) {				
				dao.delete(board.getList());
			}else {
				System.out.println("service deleteReplyBoardNum : "+boardNum);
				dao.deleteReply(boardNum);
			}
			return true;
		} else {
			return false;
		}
	}

	public CommunityBoardPageVO makeSearchBoardPage(int currentPage, int searchSelect, String searchWord) {

		int totalCount = 1;
		// �Խñ� �� ����
		switch (searchSelect) {
		case 1:
			totalCount = dao.selectWholeSearchCount(searchWord);
			break;
		case 2:
			totalCount = dao.selectTitleSearchCount(searchWord);
			break;
		case 3:
			totalCount = dao.selectContentSearchCount(searchWord);
			break;
		case 4:
			totalCount = dao.selectWriterSearchCount(searchWord);
			break;
		}

		// �� �������� ���
		int totalPage = 0;
		try {
			totalPage = totalCount / COUNT_PER_PAGE;
			if (totalCount % COUNT_PER_PAGE != 0) {
				totalPage++;
			}
		} catch (ArithmeticException e) {
			e.printStackTrace();
		}

		// ȭ�� �ϴ��� ������ ��ũ(����)
		int startPage = (currentPage - 1) / 10 * 10 + 1;

		// ȭ�� �ϴ��� ������ ��ũ(��)
		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		// �� ��ȸ �� ���� ��ȣ ���
		int startRow = (currentPage - 1) * COUNT_PER_PAGE;
		// DB���� ������ �Խñ� �����ȸ
		List<CommunityBoardVO> boardList = null;
		switch (searchSelect) {
		case 1:
			boardList = dao.selectWholeList(startRow, COUNT_PER_PAGE, searchWord);
			break;
		case 2:
			boardList = dao.selectTitleList(startRow, COUNT_PER_PAGE, searchWord);
			break;
		case 3:
			boardList = dao.selectContentList(startRow, COUNT_PER_PAGE, searchWord);
			break;
		case 4:
			boardList = dao.selectWriterList(startRow, COUNT_PER_PAGE, searchWord);
			break;
		default:
			boardList = dao.selectWholeList(startRow, COUNT_PER_PAGE, searchWord);
			break;
		}

		System.out.println("startRow : " + startRow);
		// ��� ������ BoardPageVO ��ü�� ��Ƽ� ����
		CommunityBoardPageVO page = new CommunityBoardPageVO(boardList, searchSelect, searchWord, currentPage, startPage, endPage,
				totalPage, totalCount);

		return page;
	}

	// �ڸ�Ʈ ����Ʈ
	public CommunityCommentPageVO selectCommentList(int boardNum, int currentPage) {
		// �� �ڸ�Ʈ ��
		int totalCount = dao.selectCommentCount(boardNum);

		// �� ������ �� ���
		int totalPage = 0;
		totalPage = totalCount / COUNT_COMMENT_PAGE;
		if (totalCount % COUNT_COMMENT_PAGE != 0) {
			totalPage++;
		}

		// ȭ�� �ϴ��� ������ ��ũ(����)
		int startPage = (currentPage - 1) / 10 * 10 + 1;

		// ȭ�� �ϴ��� ������ ��ũ(��)
		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		// �� ��ȸ �� ���� ��ȣ ���
		int startRow = (currentPage - 1) * COUNT_COMMENT_PAGE;
		// DB���� ������ �Խñ� �����ȸ
		List<CommunityCommentVO> commentList = dao.selectCommentList(boardNum, startRow, COUNT_COMMENT_PAGE);
		// ��� ������ BoardPageVO ��ü�� ��Ƽ� ����
		CommunityCommentPageVO page = new CommunityCommentPageVO(commentList, currentPage, startPage, endPage, totalPage, totalCount);
		System.out.println(page);
		return page;
	}

	public CommunityCommentVO insertComment(int boardNum, String content, String writer) {
		CommunityCommentVO vo = new CommunityCommentVO(boardNum, content, writer, new Date());
		dao.insertComment(vo);
		CommunityCommentVO comment = dao.selectComment(vo.getCommentNum());
		return comment;
	}

	public boolean deleteComment(int commentNum) {
		if(dao.deleteComment(commentNum) > 0) return true;
		else return false;
	}
	
	public boolean updateComment(int commentNum, String content) {
		CommunityCommentVO comment = new CommunityCommentVO();
		comment.setRegDate(new Date());
		comment.setCommentNum(commentNum);
		comment.setContent(content);
		if(dao.updateComment(comment) > 0) return true;
		else return false;
	}
}
