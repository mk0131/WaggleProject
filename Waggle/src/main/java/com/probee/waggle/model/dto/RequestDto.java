package com.probee.waggle.model.dto;

import java.util.Date;

public class RequestDto {
	private int req_No;
	private String req_Title;
	private String req_Link;
	private Date req_WDate;
	private Date req_EDate;
	private String req_Phone;
	private String req_Detail;
	private int req_Point;
	private String req_Stat;
	private int req_UCode;
	private int req_FCode;
	private int req_HCode;
	
	public RequestDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RequestDto(int req_No, String req_Title, String req_Link, Date req_WDate, Date req_EDate, String req_Phone,
			String req_Detail, int req_Point, String req_Stat, int req_UCode, int req_FCode, int req_HCode) {
		super();
		this.req_No = req_No;
		this.req_Title = req_Title;
		this.req_Link = req_Link;
		this.req_WDate = req_WDate;
		this.req_EDate = req_EDate;
		this.req_Phone = req_Phone;
		this.req_Detail = req_Detail;
		this.req_Point = req_Point;
		this.req_Stat = req_Stat;
		this.req_UCode = req_UCode;
		this.req_FCode = req_FCode;
		this.req_HCode = req_HCode;
	}

	public int getReq_No() {
		return req_No;
	}

	public void setReq_No(int req_No) {
		this.req_No = req_No;
	}

	public String getReq_Title() {
		return req_Title;
	}

	public void setReq_Title(String req_Title) {
		this.req_Title = req_Title;
	}

	public String getReq_Link() {
		return req_Link;
	}

	public void setReq_Link(String req_Link) {
		this.req_Link = req_Link;
	}

	public Date getReq_WDate() {
		return req_WDate;
	}

	public void setReq_WDate(Date req_WDate) {
		this.req_WDate = req_WDate;
	}

	public Date getReq_EDate() {
		return req_EDate;
	}

	public void setReq_EDate(Date req_EDate) {
		this.req_EDate = req_EDate;
	}

	public String getReq_Phone() {
		return req_Phone;
	}

	public void setReq_Phone(String req_Phone) {
		this.req_Phone = req_Phone;
	}

	public String getReq_Detail() {
		return req_Detail;
	}

	public void setReq_Detail(String req_Detail) {
		this.req_Detail = req_Detail;
	}

	public int getReq_Point() {
		return req_Point;
	}

	public void setReq_Point(int req_Point) {
		this.req_Point = req_Point;
	}

	public String getReq_Stat() {
		return req_Stat;
	}

	public void setReq_Stat(String req_Stat) {
		this.req_Stat = req_Stat;
	}

	public int getReq_UCode() {
		return req_UCode;
	}

	public void setReq_UCode(int req_UCode) {
		this.req_UCode = req_UCode;
	}

	public int getReq_FCode() {
		return req_FCode;
	}

	public void setReq_FCode(int req_FCode) {
		this.req_FCode = req_FCode;
	}

	public int getReq_HCode() {
		return req_HCode;
	}

	public void setReq_HCode(int req_HCode) {
		this.req_HCode = req_HCode;
	}

	@Override
	public String toString() {
		return "RequestDto [req_No=" + req_No + ", req_Title=" + req_Title + ", req_Link=" + req_Link + ", req_WDate="
				+ req_WDate + ", req_EDate=" + req_EDate + ", req_Phone=" + req_Phone + ", req_Detail=" + req_Detail
				+ ", req_Point=" + req_Point + ", req_Stat=" + req_Stat + ", req_UCode=" + req_UCode + ", req_FCode="
				+ req_FCode + ", req_HCode=" + req_HCode + "]";
	}

	

	
	
}
