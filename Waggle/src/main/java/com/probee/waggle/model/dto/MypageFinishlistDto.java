package com.probee.waggle.model.dto;

import java.time.LocalDate;

public class MypageFinishlistDto {
	private int req_No;
	private String req_Title;
	private LocalDate req_EDate;
	private int req_Point;
	private String res_Stat;
	private String req_Stat;
	private String home_Addr;
	private String fi_Nm;
	private int res_UCode;
	
	public MypageFinishlistDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MypageFinishlistDto(int req_No, String req_Title, LocalDate req_EDate, int req_Point, String res_Stat,
			String req_Stat, String home_Addr, String fi_Nm, int res_UCode) {
		super();
		this.req_No = req_No;
		this.req_Title = req_Title;
		this.req_EDate = req_EDate;
		this.req_Point = req_Point;
		this.res_Stat = res_Stat;
		this.req_Stat = req_Stat;
		this.home_Addr = home_Addr;
		this.fi_Nm = fi_Nm;
		this.res_UCode = res_UCode;
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

	public LocalDate getReq_EDate() {
		return req_EDate;
	}

	public void setReq_EDate(LocalDate req_EDate) {
		this.req_EDate = req_EDate;
	}

	public int getReq_Point() {
		return req_Point;
	}

	public void setReq_Point(int req_Point) {
		this.req_Point = req_Point;
	}

	public String getRes_Stat() {
		return res_Stat;
	}

	public void setRes_Stat(String res_Stat) {
		this.res_Stat = res_Stat;
	}

	public String getReq_Stat() {
		return req_Stat;
	}

	public void setReq_Stat(String req_Stat) {
		this.req_Stat = req_Stat;
	}

	public String getHome_Addr() {
		return home_Addr;
	}

	public void setHome_Addr(String home_Addr) {
		this.home_Addr = home_Addr;
	}

	public String getFi_Nm() {
		return fi_Nm;
	}

	public void setFi_Nm(String fi_Nm) {
		this.fi_Nm = fi_Nm;
	}

	public int getRes_UCode() {
		return res_UCode;
	}

	public void setRes_UCode(int res_UCode) {
		this.res_UCode = res_UCode;
	}

	
}
