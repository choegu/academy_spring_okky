package com.project.one.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.mapper.MessageMapper;
import com.project.one.vo.MessageVO;



@Component
public class MessageDao {
	@Autowired
	private SqlSessionTemplate session;
	
	public int selectMessageCount() {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.selectMessageCount();
	}
	
	public int selectReceiveMessageCount(String loginId) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.selectReceiveMessageCount(loginId);
	}
	
	public int selectSendMessageCount(String loginId) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.selectSendMessageCount(loginId);
	}
	
	public List<MessageVO> selectReceiveMessageList(int startRow,int limitBoardCount,String loginId){
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.selectReceiveMessageList(startRow,limitBoardCount,loginId);
	}
	
	public List<MessageVO> selectSendMessageList(int startRow,int limitBoardCount,String loginId){
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.selectSendMessageList(startRow,limitBoardCount,loginId);
	}
	

	
	public int writeMessage(MessageVO message) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.writeMessage(message);	
	}
	
	public void sendMessageReadCheck(int message_num) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		mapper.sendMessageReadCheck(message_num);
	}
	
	public MessageVO sendMessageRead(int message_num) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.sendMessageRead(message_num);
	}
	
	public void receiveMessageReadCheck(int message_num) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		mapper.receiveMessageReadCheck(message_num);
	}
	
	public MessageVO receiveMessageRead(int message_num) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.receiveMessageRead(message_num);
	}
	
	public int deleteReceiveAll(String loginId) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.deleteReceiveAll(loginId);
	}
	
	public int deleteSendAll(String loginId) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.deleteSendAll(loginId);
	}
	
	public int noCheckMessageCount(String loginId) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.noCheckMessageCount(loginId);
	}
}
