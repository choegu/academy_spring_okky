package com.project.one.vo;

import java.util.List;

/**
 * @author student
 *
 */
public class CommunityCommentPageVO {
	private List<CommunityCommentVO> commentList;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	private int totalCount;
	
	public CommunityCommentPageVO() {
	}

	public CommunityCommentPageVO(List<CommunityCommentVO> commentList, int currentPage, int startPage, int endPage, int totalPage, int totalCount) {
		this.commentList = commentList;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
		this.totalCount = totalCount;
	}
	public List<CommunityCommentVO> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<CommunityCommentVO> commentList) {
		this.commentList = commentList;
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
		return "CommentPageVO [commentList=" + commentList + ", currentPage=" + currentPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", totalPage=" + totalPage + ", totalCount="+totalCount+"]";
	}

	
}
