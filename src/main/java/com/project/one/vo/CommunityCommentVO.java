package com.project.one.vo;

import java.util.Date;

public class CommunityCommentVO {
	private int commentNum;
	private int brdNum;
	private String content;
	private String name;
	private Date regDate;
	private int secret;
	private String ip;
	private int sweet;
	private int dislike;
	private int blame;
	private String device;
	
	public CommunityCommentVO() {
		
	}
	
	public CommunityCommentVO(int brdNum, String content, String name, Date regDate) {
		this.brdNum = brdNum;
		this.content = content;
		this.name = name;
		this.regDate = regDate;
	}

	public int getCommentNum() {
		return commentNum;
	}

	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}

	public int getBrdNum() {
		return brdNum;
	}

	public void setBrdNum(int brdNum) {
		this.brdNum = brdNum;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getSecret() {
		return secret;
	}

	public void setSecret(int secret) {
		this.secret = secret;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getSweet() {
		return sweet;
	}

	public void setSweet(int sweet) {
		this.sweet = sweet;
	}

	public int getDislike() {
		return dislike;
	}

	public void setDislike(int dislike) {
		this.dislike = dislike;
	}

	public int getBlame() {
		return blame;
	}

	public void setBlame(int blame) {
		this.blame = blame;
	}

	public String getDevice() {
		return device;
	}

	public void setDevice(String device) {
		this.device = device;
	}

	@Override
	public String toString() {
		return "CommentVO [commentNum=" + commentNum + ", brdNum=" + brdNum + ", content=" + content + ", name=" + name
				+ ", regDate=" + regDate + ", secret=" + secret + ", ip=" + ip + ", sweet=" + sweet + ", dislike="
				+ dislike + ", blame=" + blame + ", device=" + device + "]";
	}
	

	
	
}
