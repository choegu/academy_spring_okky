package com.project.one.vo;

import java.util.Date;
import java.util.List;

public class CommunityBoardVO {
	private int boardNum;
	private String title;
	private String writer;
	private String content;
	private int readCount;
	private Date writeDate;
	private String ip;
	private int sweet;
	private int dislike;
	private int blame;
	private int secret;
	private String device;
	private int list;
	private int level;
	private int ridx;
	private int del;

	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
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
	public int getSecret() {
		return secret;
	}
	public void setSecret(int secret) {
		this.secret = secret;
	}
	public String getDevice() {
		return device;
	}
	public void setDevice(String device) {
		this.device = device;
	}
	public int getList() {
		return list;
	}
	public void setList(int list) {
		this.list = list;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	
	public int getDel() {
		return del;
	}
	public void setDel(int del) {
		this.del = del;
	}
	
	@Override
	public String toString() {
		return "BoardVO [boardNum=" + boardNum + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", readCount=" + readCount + ", writeDate=" + writeDate + ", ip=" + ip + ", sweet=" + sweet
				+ ", dislike=" + dislike + ", blame=" + blame + ", secret=" + secret + ", device=" + device + ", list="
				+ list + ", level=" + level + ", ridx=" + ridx + ", del="+del+"]";
	}
}
