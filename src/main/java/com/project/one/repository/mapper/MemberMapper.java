package com.project.one.repository.mapper;

import org.apache.ibatis.annotations.Param;

public interface MemberMapper {
	public int selectMemberCount(@Param("id")String id,@Param("pw")String pw);
	public int receiveIdCheck(String receiveId);
}


