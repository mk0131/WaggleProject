package com.probee.waggle.model.dto;

import java.time.LocalDate;

public class PayDto {
	private int pay_No;
	private int pay_Price;
	private LocalDate pay_Date;
	private int pay_UCode;
	
	public PayDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PayDto(int pay_No, int pay_Price, LocalDate pay_Date, int pay_UCode) {
		super();
		this.pay_No = pay_No;
		this.pay_Price = pay_Price;
		this.pay_Date = pay_Date;
		this.pay_UCode = pay_UCode;
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

	public LocalDate getPay_Date() {
		return pay_Date;
	}

	public void setPay_Date(LocalDate pay_Date) {
		this.pay_Date = pay_Date;
	}

	public int getPay_UCode() {
		return pay_UCode;
	}

	public void setPay_UCode(int pay_UCode) {
		this.pay_UCode = pay_UCode;
	}

	@Override
	public String toString() {
		return "PayDto [pay_No=" + pay_No + ", pay_Price=" + pay_Price + ", pay_Date=" + pay_Date + ", pay_UCode="
				+ pay_UCode + "]";
	}

	
	
}
