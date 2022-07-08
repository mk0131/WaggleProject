package com.probee.waggle.model.dto;

public class ConfirmDto {
	private int co_UCode;
	private int co_FCode;
	private String co_Confirm;
	private String co_Nm;
	private String co_No;
	
	public ConfirmDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ConfirmDto(int co_UCode, int co_FCode, String co_Confirm, String co_Nm, String co_No) {
		super();
		this.co_UCode = co_UCode;
		this.co_FCode = co_FCode;
		this.co_Confirm = co_Confirm;
		this.co_Nm = co_Nm;
		this.co_No = co_No;
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

	@Override
	public String toString() {
		return "ConfirmDto [co_UCode=" + co_UCode + ", co_FCode=" + co_FCode + ", co_Confirm=" + co_Confirm + ", co_Nm="
				+ co_Nm + ", co_No=" + co_No + "]";
	}
	
	

}
