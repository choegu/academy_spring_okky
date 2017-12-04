package com.project.one.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.mapper.MemberMapper;
import com.project.one.vo.MemberVO;




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
	
	public int selectIdCheck(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.selectIdCheck(id);
	}
	
	public int joinInsert(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.joinInsert(member);
	}
}
