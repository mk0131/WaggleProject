package com.probee.waggle.model.dto;

import java.util.Date;

public class ChatContentDto2 {
	private int chat_Code;
	private String user_Nm;
	private String fi_Nm;
	private String chat_Content;
	private Date chat_Date;
	private Boolean chat_Chk;
	private int chat_UCode;
	
	public ChatContentDto2(int chat_Code, String user_Nm, String fi_Nm, String chat_Content, Date chat_Date,
			Boolean chat_Chk, int chat_UCode) {
		super();
		this.chat_Code = chat_Code;
		this.user_Nm = user_Nm;
		this.fi_Nm = fi_Nm;
		this.chat_Content = chat_Content;
		this.chat_Date = chat_Date;
		this.chat_Chk = chat_Chk;
		this.chat_UCode = chat_UCode;
	}

	public int getChat_Code() {
		return chat_Code;
	}

	public void setChat_Code(int chat_Code) {
		this.chat_Code = chat_Code;
	}

	public String getUser_Nm() {
		return user_Nm;
	}

	public void setUser_Nm(String user_Nm) {
		this.user_Nm = user_Nm;
	}

	public String getFi_Nm() {
		return fi_Nm;
	}

	public void setFi_Nm(String fi_Nm) {
		this.fi_Nm = fi_Nm;
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

	public Boolean getChat_Chk() {
		return chat_Chk;
	}

	public void setChat_Chk(Boolean chat_Chk) {
		this.chat_Chk = chat_Chk;
	}

	public int getChat_UCode() {
		return chat_UCode;
	}

	public void setChat_UCode(int chat_UCode) {
		this.chat_UCode = chat_UCode;
	}

	@Override
	public String toString() {
		return "ChatContentDto2 [chat_Code=" + chat_Code + ", user_Nm=" + user_Nm + ", fi_Nm=" + fi_Nm
				+ ", chat_Content=" + chat_Content + ", chat_Date=" + chat_Date + ", chat_Chk=" + chat_Chk
				+ ", chat_UCode=" + chat_UCode + "]";
	}
	
	

}
