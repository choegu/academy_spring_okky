package com.project.one.vo;

import java.util.Date;

public class MemberVO {
	private int member_num;
	private String id;
	private String pw;
	private String name;
	private String eMail;
	private String question;
	private String questionAnswer;
	private Date join_date;
	/////////////////////////////////////////////////
	public MemberVO(int member_num, String id, String pw, String name, String eMail, String question,
			String questionAnswer, Date join_date) {
		super();
		this.member_num = member_num;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.eMail = eMail;
		this.question = question;
		this.questionAnswer = questionAnswer;
		this.join_date = join_date;
	}
	public MemberVO() {}

	//////////////////////////////////////////////////////////////////////////
	public int getMember_num() {
		return member_num;
	}
	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public String getQuestionAnswer() {
		return questionAnswer;
	}
	public void setQuestionAnswer(String questionAnswer) {
		this.questionAnswer = questionAnswer;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	@Override
	public String toString() {
		return "MemberVO [member_num=" + member_num + ", id=" + id + ", pw=" + pw + ", name=" + name + ", eMail="
				+ eMail + ", question=" + question + ", questionAnswer=" + questionAnswer + ", join_date=" + join_date
				+ "]";
	}
	/////////////////////////////////////////////////////////
}