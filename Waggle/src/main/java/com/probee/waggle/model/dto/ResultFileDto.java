package com.probee.waggle.model.dto;

public class ResultFileDto {
	private int rf_No;
	private int rf_UCode;
	private int rf_FCode;
	
	public ResultFileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	public ResultFileDto(int rf_No, int rf_UCode, int rf_FCode) {
		super();
		this.rf_No = rf_No;
		this.rf_UCode = rf_UCode;
		this.rf_FCode = rf_FCode;
	}

	public int getRf_No() {
		return rf_No;
	}

	public void setRf_No(int rf_No) {
		this.rf_No = rf_No;
	}

	public int getRf_FCode() {
		return rf_FCode;
	}

	public void setRf_FCode(int rf_FCode) {
		this.rf_FCode = rf_FCode;
	}

	public int getRf_UCode() {
		return rf_UCode;
	}

	public void setRf_UCode(int rf_UCode) {
		this.rf_UCode = rf_UCode;
	}

	@Override
	public String toString() {
		return "ResultFileDto [rf_No=" + rf_No + ", rf_FCode=" + rf_FCode + ", rf_UCode=" + rf_UCode + "]";
	}
	
	
	
}
