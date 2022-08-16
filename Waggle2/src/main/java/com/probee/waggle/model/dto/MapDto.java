package com.probee.waggle.model.dto;

import java.util.Date;

public class MapDto {
	private int home_Post;
	private String home_Addr;
	private String home_DAddr;
	private int req_No;
	private String fi_Nm;
	private Date res_WDate;
	private int res_UCode;
	private int po_UCode;
	
	public MapDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MapDto(int home_Post, String home_Addr, String home_DAddr, int req_No, String fi_Nm, Date res_WDate,
			int res_UCode, int po_UCode) {
		super();
		this.home_Post = home_Post;
		this.home_Addr = home_Addr;
		this.home_DAddr = home_DAddr;
		this.req_No = req_No;
		this.fi_Nm = fi_Nm;
		this.res_WDate = res_WDate;
		this.res_UCode = res_UCode;
		this.po_UCode = po_UCode;
	}

	public int getHome_Post() {
		return home_Post;
	}

	public void setHome_Post(int home_Post) {
		this.home_Post = home_Post;
	}

	public String getHome_Addr() {
		return home_Addr;
	}

	public void setHome_Addr(String home_Addr) {
		this.home_Addr = home_Addr;
	}

	public String getHome_DAddr() {
		return home_DAddr;
	}

	public void setHome_DAddr(String home_DAddr) {
		this.home_DAddr = home_DAddr;
	}

	public int getReq_No() {
		return req_No;
	}

	public void setReq_No(int req_No) {
		this.req_No = req_No;
	}

	public String getFi_Nm() {
		return fi_Nm;
	}

	public void setFi_Nm(String fi_Nm) {
		this.fi_Nm = fi_Nm;
	}

	public Date getRes_WDate() {
		return res_WDate;
	}

	public void setRes_WDate(Date res_WDate) {
		this.res_WDate = res_WDate;
	}

	public int getRes_UCode() {
		return res_UCode;
	}

	public void setRes_UCode(int res_UCode) {
		this.res_UCode = res_UCode;
	}

	public int getPo_UCode() {
		return po_UCode;
	}

	public void setPo_UCode(int po_UCode) {
		this.po_UCode = po_UCode;
	}

	@Override
	public String toString() {
		return "MapDto [home_Post=" + home_Post + ", home_Addr=" + home_Addr + ", home_DAddr=" + home_DAddr
				+ ", req_No=" + req_No + ", fi_Nm=" + fi_Nm + ", res_WDate=" + res_WDate + ", res_UCode=" + res_UCode
				+ ", po_UCode=" + po_UCode + "]";
	}

	
	
	

	
	

}
