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
	
	public int searchIdCount(String name,String eMail) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.searchIdCount(name,eMail);
	}
	
	public String selectId(String name,String eMail) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.selectId(name,eMail);
	}
	
	public String questionSelect(String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.questionSelect(id);
	}
	
	public int checkQuestionAnswer(String answer,String id) {
		MemberMapper mapper =session.getMapper(MemberMapper.class);
		return mapper.checkQuestionAnswer(answer,id);
	}
	
	public String selectPw(String answer,String id) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.selectPw(answer,id);
	}
	
	public MemberVO selectMemberInfo(String loginId) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.selectMemberInfo(loginId);
	}
	
	public int checkPassword(String loginId,String pw) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.checkPassword(loginId,pw);
	}
	
	public int updateMemberInfo(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		return mapper.updateMemberInfo(member);
	}
}
