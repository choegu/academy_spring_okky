package com.project.one.vo;

import java.util.Date;

public class MessageVO {
	private int message_num;
	private String title;
	private String content;
	private Date write_date;
	private String send_id;
	private String receive_id;
	private int send_open;
	private int receive_open;
	/////////////////////////////////////////////////////
	public MessageVO(int message_num, String title, String content, Date write_date, String send_id, String receive_id,
			int send_open, int receive_open) {
		super();
		this.message_num = message_num;
		this.title = title;
		this.content = content;
		this.write_date = write_date;
		this.send_id = send_id;
		this.receive_id = receive_id;
		this.send_open = send_open;
		this.receive_open = receive_open;
	}
	public MessageVO() {}
	/////////////////////////////////////////////////////////////
	public int getMessage_num() {
		return message_num;
	}
	public void setMessage_num(int message_num) {
		this.message_num = message_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public String getSend_id() {
		return send_id;
	}
	public void setSend_id(String send_id) {
		this.send_id = send_id;
	}
	public String getReceive_id() {
		return receive_id;
	}
	public void setReceive_id(String receive_id) {
		this.receive_id = receive_id;
	}
	public int getSend_open() {
		return send_open;
	}
	public void setSend_open(int send_open) {
		this.send_open = send_open;
	}
	public int getReceive_open() {
		return receive_open;
	}
	public void setReceive_open(int receive_open) {
		this.receive_open = receive_open;
	}
	@Override
	public String toString() {
		return "MessageVO [message_num=" + message_num + ", title=" + title + ", content=" + content + ", write_date="
				+ write_date + ", send_id=" + send_id + ", receive_id=" + receive_id + ", send_open=" + send_open
				+ ", receive_open=" + receive_open + "]";
	};
	////////////////////////////////////////////////////////
	
	
}
