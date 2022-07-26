package com.probee.waggle.model.dto;

public class MypageUsageDto {
	private int reqCancel;
	private int reqTotal;
	private int resCancel;
	private int resTotal;
	public MypageUsageDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MypageUsageDto(int reqCancel, int reqTotal, int resCancel, int resTotal) {
		super();
		this.reqCancel = reqCancel;
		this.reqTotal = reqTotal;
		this.resCancel = resCancel;
		this.resTotal = resTotal;
	}
	public int getReqCancel() {
		return reqCancel;
	}
	public void setReqCancel(int reqCancel) {
		this.reqCancel = reqCancel;
	}
	public int getReqTotal() {
		return reqTotal;
	}
	public void setReqTotal(int reqTotal) {
		this.reqTotal = reqTotal;
	}
	public int getResCancel() {
		return resCancel;
	}
	public void setResCancel(int resCancel) {
		this.resCancel = resCancel;
	}
	public int getResTotal() {
		return resTotal;
	}
	public void setResTotal(int resTotal) {
		this.resTotal = resTotal;
	}
	@Override
	public String toString() {
		return "MypageUsageDto [reqCancel=" + reqCancel + ", reqTotal=" + reqTotal + ", resCancel=" + resCancel
				+ ", resTotal=" + resTotal + "]";
	}
	
	
	
}
