package com.probee.waggle.model.dto;

import java.util.Date;

public class MypageUsageDto {
	private int reqCancel;
	private int reqTotal;
	private int resCancel;
	private int resCancelZero;
	private int resTotal;
	private int reqFinish;
	private int resFinish;
	private Date req_WDate;
	public MypageUsageDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MypageUsageDto(int reqCancel, int reqTotal, int resCancel, int resCancelZero, int resTotal, int reqFinish,
			int resFinish, Date req_WDate) {
		super();
		this.reqCancel = reqCancel;
		this.reqTotal = reqTotal;
		this.resCancel = resCancel;
		this.resCancelZero = resCancelZero;
		this.resTotal = resTotal;
		this.reqFinish = reqFinish;
		this.resFinish = resFinish;
		this.req_WDate = req_WDate;
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
	public int getResCancelZero() {
		return resCancelZero;
	}
	public void setResCancelZero(int resCancelZero) {
		this.resCancelZero = resCancelZero;
	}
	public int getResTotal() {
		return resTotal;
	}
	public void setResTotal(int resTotal) {
		this.resTotal = resTotal;
	}
	public int getReqFinish() {
		return reqFinish;
	}
	public void setReqFinish(int reqFinish) {
		this.reqFinish = reqFinish;
	}
	public int getResFinish() {
		return resFinish;
	}
	public void setResFinish(int resFinish) {
		this.resFinish = resFinish;
	}
	public Date getReq_WDate() {
		return req_WDate;
	}
	public void setReq_WDate(Date req_WDate) {
		this.req_WDate = req_WDate;
	}
	@Override
	public String toString() {
		return "MypageUsageDto [reqCancel=" + reqCancel + ", reqTotal=" + reqTotal + ", resCancel=" + resCancel
				+ ", resCancelZero=" + resCancelZero + ", resTotal=" + resTotal + ", reqFinish=" + reqFinish
				+ ", resFinish=" + resFinish + ", req_WDate=" + req_WDate + "]";
	}
	
	
	
}