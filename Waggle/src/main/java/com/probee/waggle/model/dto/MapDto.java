package com.probee.waggle.model.dto;


public class MapDto {
	private int home_Post;
	private String home_Addr;
	private String home_DAddr;
	private int req_No;
	private String fi_Nm;
	
	public MapDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MapDto(int home_Post, String home_Addr, String home_DAddr, int req_No, String fi_Nm) {
		super();
		this.home_Post = home_Post;
		this.home_Addr = home_Addr;
		this.home_DAddr = home_DAddr;
		this.req_No = req_No;
		this.fi_Nm = fi_Nm;
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

	@Override
	public String toString() {
		return "MapDto [home_Post=" + home_Post + ", home_Addr=" + home_Addr + ", home_DAddr=" + home_DAddr
				+ ", req_No=" + req_No + ", fi_Nm=" + fi_Nm + "]";
	}

	
	
	

	
	

}
