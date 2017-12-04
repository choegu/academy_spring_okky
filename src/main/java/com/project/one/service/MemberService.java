package com.project.one.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.MemberDao;
import com.project.one.vo.MemberVO;


@Component
public class MemberService {
	@Autowired
	private MemberDao dao;

	public boolean loginCheck(String id,String pw) {
		if(dao.selectMemberCount(id,pw) > 0) {
			return true;
		}else {
			return false;
		}
	}
	
	public boolean receiveIdCheck(String receiveId) {
		if(dao.receiveIdCheck(receiveId)==1) {
			return true;
		}else {
			return false;
		}
	}
	
	public int selectIdCheck(String id) {
		int count = dao.selectIdCheck(id);
		return count;
	}
	
	public boolean joinInsert(MemberVO member) {
		member.setJoin_date(new Date());
		if(dao.joinInsert(member)>0) {
			return true;
		}else {
			return false;
		}
	}
}
