package com.probee.waggle.model.dto;

import java.time.LocalDateTime;

public class PointsDto {
	private int po_No;
	private int po_UCode;
	private int po_Point;
	private LocalDateTime po_Date;
	
	public PointsDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public PointsDto(int po_No, int po_UCode, int po_Point, LocalDateTime po_Date) {
		super();
		this.po_No = po_No;
		this.po_UCode = po_UCode;
		this.po_Point = po_Point;
		this.po_Date = po_Date;
	}

	public int getPo_No() {
		return po_No;
	}

	public void setPo_No(int po_No) {
		this.po_No = po_No;
	}

	public int getPo_UCode() {
		return po_UCode;
	}

	public void setPo_UCode(int po_UCode) {
		this.po_UCode = po_UCode;
	}

	public int getPo_Point() {
		return po_Point;
	}

	public void setPo_Point(int po_Point) {
		this.po_Point = po_Point;
	}

	public LocalDateTime getPo_Date() {
		return po_Date;
	}

	public void setPo_Date(LocalDateTime po_Date) {
		this.po_Date = po_Date;
	}

	@Override
	public String toString() {
		return "PointsDto [po_No=" + po_No + ", po_UCode=" + po_UCode + ", po_Point=" + po_Point + "]";
	}

	
	
	
}
