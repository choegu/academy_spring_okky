package com.project.one.vo;

import java.util.Date;

public class CommentVO {
	private int comment_num;
	private int board_num;
	private String writer;
	private String content;
	private Date write_date;
	private int list;
	private int level;
	private int ridx;
	private int open;
	
	public CommentVO(int comment_num, int board_num, String writer, String content, Date write_date, int list,
			int level, int ridx, int open) {
		this.comment_num = comment_num;
		this.board_num = board_num;
		this.writer = writer;
		this.content = content;
		this.write_date = write_date;
		this.list = list;
		this.level = level;
		this.ridx = ridx;
		this.open = open;
	}
	
	public CommentVO(int board_num, String writer, String content, Date write_date, int list,
			int level, int ridx, int open) {
		this.board_num = board_num;
		this.writer = writer;
		this.content = content;
		this.write_date = write_date;
		this.list = list;
		this.level = level;
		this.ridx = ridx;
		this.open = open;
	}
	
	public CommentVO() {
	}

	public int getComment_num() {
		return comment_num;
	}

	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}

	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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

	public Date getWrite_date() {
		return write_date;
	}

	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
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

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	@Override
	public String toString() {
		return "CommentVO [comment_num=" + comment_num + ", board_num=" + board_num + ", writer=" + writer
				+ ", content=" + content + ", write_date=" + write_date + ", list=" + list + ", level=" + level
				+ ", ridx=" + ridx + ", open=" + open + "]";
	}
	
	
	
}
