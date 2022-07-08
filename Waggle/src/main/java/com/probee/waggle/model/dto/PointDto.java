package com.probee.waggle.model.dto;

import java.util.Date;

public class PointDto {
	private int po_No;
	private int po_Code;
	private int po_Point;
	private Date po_Date;
	
	public PointDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointDto(int po_No, int po_Code, int po_Point, Date po_Date) {
		super();
		this.po_No = po_No;
		this.po_Code = po_Code;
		this.po_Point = po_Point;
		this.po_Date = po_Date;
	}

	public int getPo_No() {
		return po_No;
	}

	public void setPo_No(int po_No) {
		this.po_No = po_No;
	}

	public int getPo_Code() {
		return po_Code;
	}

	public void setPo_Code(int po_Code) {
		this.po_Code = po_Code;
	}

	public int getPo_Point() {
		return po_Point;
	}

	public void setPo_Point(int po_Point) {
		this.po_Point = po_Point;
	}

	public Date getPo_Date() {
		return po_Date;
	}

	public void setPo_Date(Date po_Date) {
		this.po_Date = po_Date;
	}

	@Override
	public String toString() {
		return "PointDto [po_No=" + po_No + ", po_Code=" + po_Code + ", po_Point=" + po_Point + ", po_Date=" + po_Date
				+ "]";
	}
	
	
}
