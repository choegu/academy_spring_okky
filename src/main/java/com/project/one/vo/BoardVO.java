package com.project.one.vo;

import java.util.Date;

public class BoardVO {
	private int board_num;
	private String title;
	private String writer;
	private String content;
	private int read_count;
	private Date write_date;
	private int list;
	private int level;
	private int ridx;
	private String category;
	private int open;
	
	public BoardVO(int board_num, String title, String writer, String content, int read_count, Date write_date,
			int list, int level, int ridx, String category, int open) {
		this.board_num = board_num;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.read_count = read_count;
		this.write_date = write_date;
		this.list = list;
		this.level = level;
		this.ridx = ridx;
		this.category = category;
		this.open = open;
	}
	
	public BoardVO(String title, String writer, String content, int read_count, Date write_date,
			int list, int level, int ridx, String category, int open) {
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.read_count = read_count;
		this.write_date = write_date;
		this.list = list;
		this.level = level;
		this.ridx = ridx;
		this.category = category;
		this.open = open;
	}

	public BoardVO() {}
	
	public int getBoard_num() {
		return board_num;
	}

	public void setBoard_num(int board_num) {
		this.board_num = board_num;
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

	public int getRead_count() {
		return read_count;
	}

	public void setRead_count(int read_count) {
		this.read_count = read_count;
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

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public int getOpen() {
		return open;
	}

	public void setOpen(int open) {
		this.open = open;
	}

	@Override
	public String toString() {
		return "BoardVO [board_num=" + board_num + ", title=" + title + ", writer=" + writer + ", content=" + content
				+ ", read_count=" + read_count + ", write_date=" + write_date + ", list=" + list + ", level=" + level
				+ ", ridx=" + ridx + ", category=" + category + ", open=" + open + "]";
	}
	
}
