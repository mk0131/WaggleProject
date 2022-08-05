package com.probee.waggle.model.dto;

import java.time.LocalDateTime;

public class PointsDto2 implements Comparable<PointsDto2>{
	private LocalDateTime date;
	private String type;
	private int price;
	private int price_Sum;
	
	public PointsDto2() {
		super();
	}
	public PointsDto2(LocalDateTime date, String type, int price, int price_Sum) {
		super();
		this.date = date;
		this.type = type;
		this.price = price;
		this.price_Sum = price_Sum;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPrice_Sum() {
		return price_Sum;
	}
	public void setPrice_Sum(int price_Sum) {
		this.price_Sum = price_Sum;
	}
	
	@Override
	public String toString() {
		return "PointsDto2 [date=" + date + ", type=" + type + ", price=" + price + ", price_Sum=" + price_Sum + "]";
	}
	@Override
	public int compareTo(PointsDto2 dto) {
		if(dto.date.isBefore(date)) {
			return -1;
		} else if(dto.date.isAfter(date)) {
			return 1;
		}
		return 0;
	}

}
