package com.project.one.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.mapper.MemberMapper;



@Component
public class MemberDao {

	@Autowired
	private SqlSessionTemplate session;
	
	public int selectMemberCount(String id,String pw) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.selectMemberCount(id,pw);
	}
	
	public int receiveIdCheck(String receiveId) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.receiveIdCheck(receiveId);
	}
}
