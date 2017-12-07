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
	
	public boolean writeMessage(MessageVO message,String loginId) {
		message.setWrite_date(new Date());
		message.setSend_id(loginId);
		message.setSend_open(1);
		message.setReceive_open(1);
		
		if(dao.writeMessage(message)==1){
			return true;
		}else {
			return false;
		}
	}
	
	public MessageVO sendMessageRead(int message_num) {
		dao.sendMessageReadCheck(message_num);
		MessageVO message = dao.sendMessageRead(message_num);
		return message;
	}
	
	public MessageVO receiveMessageRead(int message_num) {
		dao.receiveMessageReadCheck(message_num);
		MessageVO message = dao.receiveMessageRead(message_num);
		return message;
	}
	
	public boolean deleteReceiveAll(String loginId) {
		if(dao.deleteReceiveAll(loginId)==1) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean deleteSendAll(String loginId) {
		if(dao.deleteSendAll(loginId)>0) {
			return true;
		}else {
			return false;
		}
	}
	
	public int noCheckMessageCount(String loginId) {
		return dao.noCheckMessageCount(loginId);
	}
	
	public int deleteReceiveCheck(String checkDel) {
		return dao.deleteReceiveCheck(checkDel);
	}
	
	public int deleteSendCheck(String checkDel) {
		return dao.deleteSendCheck(checkDel);
	}
}
