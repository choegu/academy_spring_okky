package com.project.one.repository.mapper;

import org.apache.ibatis.annotations.Param;

import com.project.one.vo.MemberVO;

public interface MemberMapper {
	public int selectMemberCount(@Param("id")String id,@Param("pw")String pw);
	public int receiveIdCheck(String receiveId);
	public int selectIdCheck(String id);
	public int joinInsert(MemberVO member);
	public int searchIdCount(@Param("name")String name,@Param("eMail")String eMail);
	public String selectId(@Param("name")String name,@Param("eMail")String eMail);
	public String questionSelect(String id);
	public int checkQuestionAnswer(@Param("answer")String answer,@Param("id")String id);
	public String selectPw(@Param("answer")String answer,@Param("id")String id);
	public MemberVO selectMemberInfo(String loginId);
}


