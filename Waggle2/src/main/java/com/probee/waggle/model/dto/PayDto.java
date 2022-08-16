package com.probee.waggle.model.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;

public class PayDto {
	private int pay_No;
	private int pay_Price;
	private LocalDateTime pay_Date;
	private int pay_UCode;
	private String pay_Type;
	
	public PayDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PayDto(int pay_No, int pay_Price, LocalDateTime pay_Date, int pay_UCode, String pay_Type) {
		super();
		this.pay_No = pay_No;
		this.pay_Price = pay_Price;
		this.pay_Date = pay_Date;
		this.pay_UCode = pay_UCode;
		this.pay_Type = pay_Type;
	}

	public int getPay_No() {
		return pay_No;
	}

	public void setPay_No(int pay_No) {
		this.pay_No = pay_No;
	}

	public int getPay_Price() {
		return pay_Price;
	}

	public void setPay_Price(int pay_Price) {
		this.pay_Price = pay_Price;
	}

	public LocalDateTime getPay_Date() {
		return pay_Date;
	}

	public void setPay_Date(LocalDateTime pay_Date) {
		this.pay_Date = pay_Date;
	}

	public int getPay_UCode() {
		return pay_UCode;
	}

	public void setPay_UCode(int pay_UCode) {
		this.pay_UCode = pay_UCode;
	}

	public String getPay_Type() {
		return pay_Type;
	}

	public void setPay_Type(String pay_Type) {
		this.pay_Type = pay_Type;
	}

	@Override
	public String toString() {
		return "PayDto [pay_No=" + pay_No + ", pay_Price=" + pay_Price + ", pay_Date=" + pay_Date + ", pay_UCode="
				+ pay_UCode + ", pay_Type=" + pay_Type + "]";
	}

	

	
	
}
