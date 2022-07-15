package com.probee.waggle.model.dto;

public class ResultFileDto {
	private int rf_FCode;
	private int rf_RCode;
	
	public ResultFileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResultFileDto(int rf_FCode, int rf_RCode) {
		super();
		this.rf_FCode = rf_FCode;
		this.rf_RCode = rf_RCode;
	}

	public int getRf_FCode() {
		return rf_FCode;
	}

	public void setRf_FCode(int rf_FCode) {
		this.rf_FCode = rf_FCode;
	}

	public int getRf_RCode() {
		return rf_RCode;
	}

	public void setRf_RCode(int rf_RCode) {
		this.rf_RCode = rf_RCode;
	}

	@Override
	public String toString() {
		return "ResultFileDto [rf_FCode=" + rf_FCode + ", rf_RCode=" + rf_RCode + "]";
	}

	
	
	
	
}
