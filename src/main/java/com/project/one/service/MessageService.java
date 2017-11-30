package com.project.one.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.MessageDao;
import com.project.one.vo.MessagePageVO;
import com.project.one.vo.MessageVO;

@Component
public class MessageService {
	@Autowired
	private MessageDao dao;

	private static final int COUNT_PER_PAGE = 10;

	public MessagePageVO makeMessagePage(int currentPage, String loginId, int check) {
		int totalCount;
		if(check==1) {
			totalCount = dao.selectReceiveMessageCount(loginId);
		}else {
			totalCount = dao.selectSendMessageCount(loginId);
		}
		int totalPage = totalCount / COUNT_PER_PAGE;
		if (totalCount % COUNT_PER_PAGE != 0) {
			totalPage++;
		}

		int startPage = (currentPage - 1) / 10 * 10 + 1;
		int endPage = startPage + 9;
		if (totalPage < endPage) {
			endPage = totalPage;
		}

		int startRow = (currentPage - 1) * COUNT_PER_PAGE;

		if (check == 1) {
			List<MessageVO> messageList = dao.selectReceiveMessageList(startRow, COUNT_PER_PAGE, loginId);
			return new MessagePageVO(messageList, currentPage, startPage, endPage, totalPage);
		}else {
			List<MessageVO> messageList = dao.selectSendMessageList(startRow, COUNT_PER_PAGE, loginId);
			return new MessagePageVO(messageList, currentPage, startPage, endPage, totalPage);
		}
	}
	
	public boolean receiveIdCheck(String receiveId) {
		if(dao.receiveIdCheck(receiveId)==1) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean writeMessage(MessageVO message,String loginId) {
		message.setWrite_date(new Date());
		message.setSend_id(loginId);
		message.setReadCheck("off");
		
		if(dao.writeMessage(message)==1){
			return true;
		}else {
			return false;
		}
	}
}
