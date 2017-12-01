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
	public int writeMessage(MessageVO message);
	public int deleteReceiveAll(String loginId);
	public int deleteSendAll(String loginId);
	public void sendMessageReadCheck(int message_num);
	public MessageVO sendMessageRead(int message_num);
	public void receiveMessageReadCheck(int message_num);
	public MessageVO receiveMessageRead(int message_num);
	public int noCheckMessageCount(String loginId);
}
