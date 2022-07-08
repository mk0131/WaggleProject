package com.probee.waggle.model.dto;

public class VolunteerDto {
	private int vo_Code;
	private int vo_No;
	private Boolean vo_Block;
	
	public VolunteerDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public VolunteerDto(int vo_Code, int vo_No, Boolean vo_Block) {
		super();
		this.vo_Code = vo_Code;
		this.vo_No = vo_No;
		this.vo_Block = vo_Block;
	}

	public int getVo_Code() {
		return vo_Code;
	}

	public void setVo_Code(int vo_Code) {
		this.vo_Code = vo_Code;
	}

	public int getVo_No() {
		return vo_No;
	}

	public void setVo_No(int vo_No) {
		this.vo_No = vo_No;
	}

	public Boolean getVo_Block() {
		return vo_Block;
	}

	public void setVo_Block(Boolean vo_Block) {
		this.vo_Block = vo_Block;
	}

	@Override
	public String toString() {
		return "VolunteerDto [vo_Code=" + vo_Code + ", vo_No=" + vo_No + ", vo_Block=" + vo_Block + "]";
	}
	
	
}
