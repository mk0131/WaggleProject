package com.probee.waggle.model.dto;

import java.util.Date;

public class ChatContentDto {
	private int chat_Code;
	private int chat_Num;
	private String chat_Content;
	private Date chat_Date;
	private Boolean chat_Chk;
	private int chat_UCode;
	
	public ChatContentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatContentDto(int chat_Code, int chat_Num, String chat_Content, Date chat_Date, Boolean chat_Chk,
			int chat_UCode) {
		super();
		this.chat_Code = chat_Code;
		this.chat_Num = chat_Num;
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

	public int getChat_Num() {
		return chat_Num;
	}

	public void setChat_Num(int chat_Num) {
		this.chat_Num = chat_Num;
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
		return "ChatContentDto [chat_Code=" + chat_Code + ", chat_Num=" + chat_Num + ", chat_Content=" + chat_Content
				+ ", chat_Date=" + chat_Date + ", chat_Chk=" + chat_Chk + ", chat_UCode=" + chat_UCode + "]";
	}

	
	

}
