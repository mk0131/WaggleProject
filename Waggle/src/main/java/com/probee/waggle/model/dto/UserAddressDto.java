package com.probee.waggle.model.dto;

public class UserAddressDto {
	private int ua_Code;
	private int ua_Post;
	private String ua_Addr;
	private String ua_DAddr;
	private Double ua_Lat;
	private Double ua_Lng;
	
	public UserAddressDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserAddressDto(int ua_Code, int ua_Post, String ua_Addr, String ua_DAddr, Double ua_Lat, Double ua_Lng) {
		super();
		this.ua_Code = ua_Code;
		this.ua_Post = ua_Post;
		this.ua_Addr = ua_Addr;
		this.ua_DAddr = ua_DAddr;
		this.ua_Lat = ua_Lat;
		this.ua_Lng = ua_Lng;
	}

	public int getUa_Code() {
		return ua_Code;
	}

	public void setUa_Code(int ua_Code) {
		this.ua_Code = ua_Code;
	}

	public int getUa_Post() {
		return ua_Post;
	}

	public void setUa_Post(int ua_Post) {
		this.ua_Post = ua_Post;
	}

	public String getUa_Addr() {
		return ua_Addr;
	}

	public void setUa_Addr(String ua_Addr) {
		this.ua_Addr = ua_Addr;
	}

	public String getUa_DAddr() {
		return ua_DAddr;
	}

	public void setUa_DAddr(String ua_DAddr) {
		this.ua_DAddr = ua_DAddr;
	}

	public Double getUa_Lat() {
		return ua_Lat;
	}

	public void setUa_Lat(Double ua_Lat) {
		this.ua_Lat = ua_Lat;
	}

	public Double getUa_Lng() {
		return ua_Lng;
	}

	public void setUa_Lng(Double ua_Lng) {
		this.ua_Lng = ua_Lng;
	}

	@Override
	public String toString() {
		return "UserAddressDto [ua_Code=" + ua_Code + ", ua_Post=" + ua_Post + ", ua_Addr=" + ua_Addr + ", ua_DAddr="
				+ ua_DAddr + ", ua_Lat=" + ua_Lat + ", ua_Lng=" + ua_Lng + "]";
	}
	
	
}
