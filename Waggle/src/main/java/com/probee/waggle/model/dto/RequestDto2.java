package com.probee.waggle.model.dto;

public class RequestDto2 {
	private int req_No;
	private String req_Title;
	private String req_Link;
	private String req_WDate;
	private String req_EDate;
	private String req_Phone;
	private String req_Detail;
	private int req_Point;
	private String req_Stat;
	private int req_UCode;
	private int req_FCode;
	private int req_HCode;
	private String fi_Nm;
	private String home_Addr;
	private String home_DAddr;
	private double home_Lat;
	private double home_Lng;
		
	public RequestDto2() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RequestDto2(int req_No, String req_Title, String req_Link, String req_WDate, String req_EDate,
			String req_Phone, String req_Detail, int req_Point, String req_Stat, int req_UCode, int req_FCode,
			int req_HCode, String fi_Nm, String home_Addr, String home_DAddr, double home_Lat, double home_Lng) {
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
		this.fi_Nm = fi_Nm;
		this.home_Addr = home_Addr;
		this.home_DAddr = home_DAddr;
		this.home_Lat = home_Lat;
		this.home_Lng = home_Lng;
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

	public String getReq_WDate() {
		return req_WDate;
	}

	public void setReq_WDate(String req_WDate) {
		this.req_WDate = req_WDate;
	}

	public String getReq_EDate() {
		return req_EDate;
	}

	public void setReq_EDate(String req_EDate) {
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

	public String getFi_Nm() {
		return fi_Nm;
	}

	public void setFi_Nm(String fi_Nm) {
		this.fi_Nm = fi_Nm;
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

	public double getHome_Lat() {
		return home_Lat;
	}

	public void setHome_Lat(double home_Lat) {
		this.home_Lat = home_Lat;
	}

	public double getHome_Lng() {
		return home_Lng;
	}

	public void setHome_Lng(double home_Lng) {
		this.home_Lng = home_Lng;
	}

	@Override
	public String toString() {
		return "RequestDto2 [req_No=" + req_No + ", req_Title=" + req_Title + ", req_Link=" + req_Link + ", req_WDate="
				+ req_WDate + ", req_EDate=" + req_EDate + ", req_Phone=" + req_Phone + ", req_Detail=" + req_Detail
				+ ", req_Point=" + req_Point + ", req_Stat=" + req_Stat + ", req_UCode=" + req_UCode + ", req_FCode="
				+ req_FCode + ", req_HCode=" + req_HCode + ", fi_Nm=" + fi_Nm + ", home_Addr=" + home_Addr
				+ ", home_DAddr=" + home_DAddr + ", home_Lat=" + home_Lat + ", home_Lng=" + home_Lng + "]";
	}
	
	
	
}
