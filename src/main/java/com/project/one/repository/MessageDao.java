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
	
	public int receiveIdCheck(String receiveId) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.receiveIdCheck(receiveId);
	}
	
	public int writeMessage(MessageVO message) {
		MessageMapper mapper = session.getMapper(MessageMapper.class);
		return mapper.writeMessage(message);	
	}
}
