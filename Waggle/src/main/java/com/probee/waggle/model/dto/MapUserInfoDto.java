package com.probee.waggle.model.dto;

public class MapUserInfoDto {
	private int user_Code;
	private String ua_Addr;
	private String fi_Nm;
	
	public MapUserInfoDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MapUserInfoDto(int user_Code, String ua_Addr, String fi_Nm) {
		super();
		this.user_Code = user_Code;
		this.ua_Addr = ua_Addr;
		this.fi_Nm = fi_Nm;
	}

	public int getUser_Code() {
		return user_Code;
	}

	public void setUser_Code(int user_Code) {
		this.user_Code = user_Code;
	}

	public String getUa_Addr() {
		return ua_Addr;
	}

	public void setUa_Addr(String ua_Addr) {
		this.ua_Addr = ua_Addr;
	}

	public String getFi_Nm() {
		return fi_Nm;
	}

	public void setFi_Nm(String fi_Nm) {
		this.fi_Nm = fi_Nm;
	}

	@Override
	public String toString() {
		return "MapUserInfoDto [user_Code=" + user_Code + ", ua_Addr=" + ua_Addr + ", fi_Nm=" + fi_Nm + "]";
	}
	
	
}
