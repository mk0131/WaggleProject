package com.probee.waggle.model.dto;

import java.util.Date;

public class ChatRoomDto2 {
	private int room_No;
	private String chat_Content;
	private Date chat_Date;
	private long chat_Chk;
	private String fi_Nm;
	private String user_Nm;
	
	
	public ChatRoomDto2(int room_No, String chat_Content, Date chat_Date, long chat_Chk, String fi_Nm, String user_Nm) {
		super();
		this.room_No = room_No;
		this.chat_Content = chat_Content;
		this.chat_Date = chat_Date;
		this.chat_Chk = chat_Chk;
		this.fi_Nm = fi_Nm;
		this.user_Nm = user_Nm;
	}


	public int getRoom_No() {
		return room_No;
	}


	public void setRoom_No(int room_No) {
		this.room_No = room_No;
	}


	public String getChat_Content() {
		return chat_Content;
	}


	public void setChat_Content(String chat_Content) {
		this.chat_Content = chat_Content;
	}


	public Date getChat_Date() {
		return chat_Date;
	}


	public void setChat_Date(Date chat_Date) {
		this.chat_Date = chat_Date;
	}


	public long getChat_Chk() {
		return chat_Chk;
	}


	public void setChat_Chk(long chat_Chk) {
		this.chat_Chk = chat_Chk;
	}


	public String getFi_Nm() {
		return fi_Nm;
	}


	public void setFi_Nm(String fi_Nm) {
		this.fi_Nm = fi_Nm;
	}


	public String getUser_Nm() {
		return user_Nm;
	}


	public void setUser_Nm(String user_Nm) {
		this.user_Nm = user_Nm;
	}


	@Override
	public String toString() {
		return "ChatRoomDto2 [room_No=" + room_No + ", chat_Content=" + chat_Content + ", chat_Date=" + chat_Date
				+ ", chat_Chk=" + chat_Chk + ", fi_Nm=" + fi_Nm + ", user_Nm=" + user_Nm + ", getRoom_No()="
				+ getRoom_No() + ", getChat_Content()=" + getChat_Content() + ", getChat_Date()=" + getChat_Date()
				+ ", getChat_Chk()=" + getChat_Chk() + ", getFi_Nm()=" + getFi_Nm() + ", getUser_Nm()=" + getUser_Nm()
				+ ", getClass()=" + getClass() + ", hashCode()=" + hashCode() + ", toString()=" + super.toString()
				+ "]";
	}
	
	

	
	

	
}
