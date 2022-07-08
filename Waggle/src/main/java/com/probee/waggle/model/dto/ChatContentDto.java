package com.probee.waggle.model.dto;

import java.util.Date;

public class ChatContentDto {
	private int chat_Code;
	private int chat_Num;
	private int chat_UCode;
	private String chat_Content;
	private Date chat_Date;
	private Boolean chat_chk;
	
	public ChatContentDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatContentDto(int chat_Code, int chat_Num, int chat_UCode, String chat_Content, Date chat_Date,
			Boolean chat_chk) {
		super();
		this.chat_Code = chat_Code;
		this.chat_Num = chat_Num;
		this.chat_UCode = chat_UCode;
		this.chat_Content = chat_Content;
		this.chat_Date = chat_Date;
		this.chat_chk = chat_chk;
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

	public int getChat_UCode() {
		return chat_UCode;
	}

	public void setChat_UCode(int chat_UCode) {
		this.chat_UCode = chat_UCode;
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

	public Boolean getChat_chk() {
		return chat_chk;
	}

	public void setChat_chk(Boolean chat_chk) {
		this.chat_chk = chat_chk;
	}

	@Override
	public String toString() {
		return "ChatContentDto [chat_Code=" + chat_Code + ", chat_Num=" + chat_Num + ", chat_UCode=" + chat_UCode
				+ ", chat_Content=" + chat_Content + ", chat_Date=" + chat_Date + ", chat_chk=" + chat_chk + "]";
	}
	
	

}
