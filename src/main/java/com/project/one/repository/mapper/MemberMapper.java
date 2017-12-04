package com.project.one.repository.mapper;

import org.apache.ibatis.annotations.Param;

import com.project.one.vo.MemberVO;

public interface MemberMapper {
	public int selectMemberCount(@Param("id")String id,@Param("pw")String pw);
	public int receiveIdCheck(String receiveId);
	public int selectIdCheck(String id);
	public int joinInsert(MemberVO member);
}


