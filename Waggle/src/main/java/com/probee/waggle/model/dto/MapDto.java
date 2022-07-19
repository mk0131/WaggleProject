package com.probee.waggle.model.dto;


public class MapDto {
	private int home_Post;
	private String home_Addr;
	private String home_DAddr;
	private int rf_No;
	private String fi_Nm;
	
	public MapDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MapDto(int home_Post, String home_Addr, String home_DAddr, int rf_No, String fi_Nm) {
		super();
		this.home_Post = home_Post;
		this.home_Addr = home_Addr;
		this.home_DAddr = home_DAddr;
		this.rf_No = rf_No;
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

	public int getRf_No() {
		return rf_No;
	}

	public void setRf_No(int rf_No) {
		this.rf_No = rf_No;
	}

	public String getFi_Nm() {
		return fi_Nm;
	}

	public void setFi_Nm(String fi_Nm) {
		this.fi_Nm = fi_Nm;
	}

	@Override
	public String toString() {
		return "MapDto [home_Post=" + home_Post + ", home_Addr=" + home_Addr + ", home_DAddr=" + home_DAddr + ", rf_No="
				+ rf_No + ", fi_Nm=" + fi_Nm + "]";
	}
	
	

	
	

}
