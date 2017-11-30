package com.project.one.vo;

import java.util.List;

public class MessagePageVO {
	private List<MessageVO> messageList;
	private int currentPage;
	private int startPage;
	private int endPage;
	private int totalPage;
	/////////////////////////////////////////////////////////////////////////////////////////
	public MessagePageVO(List<MessageVO> messageList, int currentPage, int startPage, int endPage, int totalPage) {
		super();
		this.messageList = messageList;
		this.currentPage = currentPage;
		this.startPage = startPage;
		this.endPage = endPage;
		this.totalPage = totalPage;
	}
	public MessagePageVO() {}
    ////////////////////////////////////////////////////////////////////////////////////////
	public List<MessageVO> getMessageList() {
		return messageList;
	}
	public void setMessageList(List<MessageVO> messageList) {
		this.messageList = messageList;
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
	@Override
	public String toString() {
		return "MessagePageVO [messageList=" + messageList + ", currentPage=" + currentPage + ", startPage=" + startPage
				+ ", endPage=" + endPage + ", totalPage=" + totalPage + "]";
	};
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
}
