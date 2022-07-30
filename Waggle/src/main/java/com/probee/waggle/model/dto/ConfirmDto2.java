package com.probee.waggle.model.dto;

public class ConfirmDto2 {
	private int co_UCode;
	private int co_FCode;
	private String co_Confirm;
	private String co_Nm;
	private String co_No;
	private String fi_Type;
	private String fi_Nm;
	public ConfirmDto2() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ConfirmDto2(int co_UCode, int co_FCode, String co_Confirm, String co_Nm, String co_No, String fi_Type,
			String fi_Nm) {
		super();
		this.co_UCode = co_UCode;
		this.co_FCode = co_FCode;
		this.co_Confirm = co_Confirm;
		this.co_Nm = co_Nm;
		this.co_No = co_No;
		this.fi_Type = fi_Type;
		this.fi_Nm = fi_Nm;
	}
	public int getCo_UCode() {
		return co_UCode;
	}
	public void setCo_UCode(int co_UCode) {
		this.co_UCode = co_UCode;
	}
	public int getCo_FCode() {
		return co_FCode;
	}
	public void setCo_FCode(int co_FCode) {
		this.co_FCode = co_FCode;
	}
	public String getCo_Confirm() {
		return co_Confirm;
	}
	public void setCo_Confirm(String co_Confirm) {
		this.co_Confirm = co_Confirm;
	}
	public String getCo_Nm() {
		return co_Nm;
	}
	public void setCo_Nm(String co_Nm) {
		this.co_Nm = co_Nm;
	}
	public String getCo_No() {
		return co_No;
	}
	public void setCo_No(String co_No) {
		this.co_No = co_No;
	}
	public String getFi_Type() {
		return fi_Type;
	}
	public void setFi_Type(String fi_Type) {
		this.fi_Type = fi_Type;
	}
	public String getFi_Nm() {
		return fi_Nm;
	}
	public void setFi_Nm(String fi_Nm) {
		this.fi_Nm = fi_Nm;
	}
	@Override
	public String toString() {
		return "ConfirmDto2 [co_UCode=" + co_UCode + ", co_FCode=" + co_FCode + ", co_Confirm=" + co_Confirm
				+ ", co_Nm=" + co_Nm + ", co_No=" + co_No + ", fi_Type=" + fi_Type + ", fi_Nm=" + fi_Nm + "]";
	}
	
	
}
