package com.project.one.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.project.one.repository.MemberDao;

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
}
