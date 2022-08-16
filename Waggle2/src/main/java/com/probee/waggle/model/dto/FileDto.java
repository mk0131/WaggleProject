package com.probee.waggle.model.dto;

public class FileDto {
	private int fi_Code;
	private String fi_Type;
	private String fi_Nm;
	
	public FileDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FileDto(int fi_Code, String fi_Type, String fi_Nm) {
		super();
		this.fi_Code = fi_Code;
		this.fi_Type = fi_Type;
		this.fi_Nm = fi_Nm;
	}

	public int getFi_Code() {
		return fi_Code;
	}

	public void setFi_Code(int fi_Code) {
		this.fi_Code = fi_Code;
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
		return "FileDto [fi_Code=" + fi_Code + ", fi_Type=" + fi_Type + ", fi_Nm=" + fi_Nm + "]";
	}
	
	
	
}
