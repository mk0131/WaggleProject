package com.probee.waggle.model.dto;

import java.time.LocalDateTime;

public class ResultDto {
	private int res_Code;
	private int res_No;
	private int res_UCode;
	private String res_Attr1;
	private String res_Attr2;
	private String res_Attr3;
	private String res_Attr4;
	private String res_Attr5;
	private String res_Attr6;
	private String res_Detail;
	private Double res_Rate;
	private LocalDateTime res_WDate;
	private String res_Stat;
	
	public ResultDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ResultDto(int res_Code, int res_No, int res_UCode, String res_Attr1, String res_Attr2, String res_Attr3,
			String res_Attr4, String res_Attr5, String res_Attr6, String res_Detail, Double res_Rate,
			LocalDateTime res_WDate, String res_Stat) {
		super();
		this.res_Code = res_Code;
		this.res_No = res_No;
		this.res_UCode = res_UCode;
		this.res_Attr1 = res_Attr1;
		this.res_Attr2 = res_Attr2;
		this.res_Attr3 = res_Attr3;
		this.res_Attr4 = res_Attr4;
		this.res_Attr5 = res_Attr5;
		this.res_Attr6 = res_Attr6;
		this.res_Detail = res_Detail;
		this.res_Rate = res_Rate;
		this.res_WDate = res_WDate;
		this.res_Stat = res_Stat;
	}

	public int getRes_Code() {
		return res_Code;
	}

	public void setRes_Code(int res_Code) {
		this.res_Code = res_Code;
	}

	public int getRes_No() {
		return res_No;
	}

	public void setRes_No(int res_No) {
		this.res_No = res_No;
	}

	public int getRes_UCode() {
		return res_UCode;
	}

	public void setRes_UCode(int res_UCode) {
		this.res_UCode = res_UCode;
	}

	public String getRes_Attr1() {
		return res_Attr1;
	}

	public void setRes_Attr1(String res_Attr1) {
		this.res_Attr1 = res_Attr1;
	}

	public String getRes_Attr2() {
		return res_Attr2;
	}

	public void setRes_Attr2(String res_Attr2) {
		this.res_Attr2 = res_Attr2;
	}

	public String getRes_Attr3() {
		return res_Attr3;
	}

	public void setRes_Attr3(String res_Attr3) {
		this.res_Attr3 = res_Attr3;
	}

	public String getRes_Attr4() {
		return res_Attr4;
	}

	public void setRes_Attr4(String res_Attr4) {
		this.res_Attr4 = res_Attr4;
	}

	public String getRes_Attr5() {
		return res_Attr5;
	}

	public void setRes_Attr5(String res_Attr5) {
		this.res_Attr5 = res_Attr5;
	}

	public String getRes_Attr6() {
		return res_Attr6;
	}

	public void setRes_Attr6(String res_Attr6) {
		this.res_Attr6 = res_Attr6;
	}

	public String getRes_Detail() {
		return res_Detail;
	}

	public void setRes_Detail(String res_Detail) {
		this.res_Detail = res_Detail;
	}

	public Double getRes_Rate() {
		return res_Rate;
	}

	public void setRes_Rate(Double res_Rate) {
		this.res_Rate = res_Rate;
	}

	public LocalDateTime getRes_WDate() {
		return res_WDate;
	}

	public void setRes_WDate(LocalDateTime res_WDate) {
		this.res_WDate = res_WDate;
	}

	public String getRes_Stat() {
		return res_Stat;
	}

	public void setRes_Stat(String res_Stat) {
		this.res_Stat = res_Stat;
	}

	@Override
	public String toString() {
		return "ResultDto [res_Code=" + res_Code + ", res_No=" + res_No + ", res_UCode=" + res_UCode + ", res_Attr1="
				+ res_Attr1 + ", res_Attr2=" + res_Attr2 + ", res_Attr3=" + res_Attr3 + ", res_Attr4=" + res_Attr4
				+ ", res_Attr5=" + res_Attr5 + ", res_Attr6=" + res_Attr6 + ", res_Detail=" + res_Detail + ", res_Rate="
				+ res_Rate + ", res_WDate=" + res_WDate + ", res_Stat=" + res_Stat + "]";
	}
	

}
