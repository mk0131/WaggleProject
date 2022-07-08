package com.probee.waggle.model.dto;

import java.util.Date;

public class NoticeDto {
	private int no_No;
	private String no_Type;
	private String no_Title;
	private String no_Content;
	private Date no_Date;
	
	public NoticeDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeDto(int no_No, String no_Type, String no_Title, String no_Content, Date no_Date) {
		super();
		this.no_No = no_No;
		this.no_Type = no_Type;
		this.no_Title = no_Title;
		this.no_Content = no_Content;
		this.no_Date = no_Date;
	}

	public int getNo_No() {
		return no_No;
	}

	public void setNo_No(int no_No) {
		this.no_No = no_No;
	}

	public String getNo_Type() {
		return no_Type;
	}

	public void setNo_Type(String no_Type) {
		this.no_Type = no_Type;
	}

	public String getNo_Title() {
		return no_Title;
	}

	public void setNo_Title(String no_Title) {
		this.no_Title = no_Title;
	}

	public String getNo_Content() {
		return no_Content;
	}

	public void setNo_Content(String no_Content) {
		this.no_Content = no_Content;
	}

	public Date getNo_Date() {
		return no_Date;
	}

	public void setNo_Date(Date no_Date) {
		this.no_Date = no_Date;
	}

	@Override
	public String toString() {
		return "NoticeDto [no_No=" + no_No + ", no_Type=" + no_Type + ", no_Title=" + no_Title + ", no_Content="
				+ no_Content + ", no_Date=" + no_Date + "]";
	}
	
	
}
