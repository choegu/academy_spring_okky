package com.project.one.vo;

import java.util.List;

public class CommunityBoardPageVO {
	private List<CommunityBoardVO> boardList;
	private int searchSelect;
	private String searchWord;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int totalCount;
	
	public CommunityBoardPageVO() {
	}
	
	public CommunityBoardPageVO(List<CommunityBoardVO> boardList, int searchSelect, String searchWord, int currentPage, int startPage,
			int endPage, int totalPage, int totalCount) {
		super();
		this.boardList = boardList;
		this.searchSelect = searchSelect;
		this.searchWord = searchWord;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
	}

	public CommunityBoardPageVO(List<CommunityBoardVO> boardList, int currentPage, int startPage, int endPage, int totalPage, int totalCount) {
		this.boardList = boardList;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
	}
	public List<CommunityBoardVO> getBoardList() {
		return boardList;
	}
	public void setBoardList(List<CommunityBoardVO> boardList) {
		this.boardList = boardList;
	}
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public int getSearchSelect() {
		return searchSelect;
	}
	public void setSearchSelect(int searchSelect) {
		this.searchSelect = searchSelect;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "BoardPageVO [boardList=" + boardList + ", searchSelect=" + searchSelect + ", searchWord=" + searchWord
				+ ", currentPage=" + currentPage + ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage="
				+ totalPage + ", totalCount=" + totalCount + "]";
	}
}
