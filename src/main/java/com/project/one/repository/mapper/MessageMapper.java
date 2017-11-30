package com.project.one.repository.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.one.vo.MessageVO;


public interface MessageMapper {
	public int selectMessageCount();
	public int selectReceiveMessageCount(String loginId);
	public int selectSendMessageCount(String loginId);
	public List<MessageVO> selectReceiveMessageList(@Param("startRow")int startRow,@Param("limitBoardCount")int limitBoardCount,@Param("loginId")String loginId);
	public List<MessageVO> selectSendMessageList(@Param("startRow")int startRow,@Param("limitBoardCount")int limitBoardCount,@Param("loginId")String loginId);
	public int receiveIdCheck(String receiveId);
	public int writeMessage(MessageVO message);
	
}
