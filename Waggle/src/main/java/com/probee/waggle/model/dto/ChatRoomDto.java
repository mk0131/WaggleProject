package com.probee.waggle.model.dto;

import java.util.Date;

public class ChatRoomDto {
	private int room_No;
	private Date room_Birth;
	private int room_UCode1;
	private int room_UCode2;
	
	
	public ChatRoomDto() {
		super();
		// TODO Auto-generated constructor stub
	}


	public ChatRoomDto(int room_No, Date room_Birth, int room_UCode1, int room_UCode2) {
		super();
		this.room_No = room_No;
		this.room_Birth = room_Birth;
		this.room_UCode1 = room_UCode1;
		this.room_UCode2 = room_UCode2;
	}


	public int getRoom_No() {
		return room_No;
	}


	public void setRoom_No(int room_No) {
		this.room_No = room_No;
	}


	public Date getRoom_Birth() {
		return room_Birth;
	}


	public void setRoom_Birth(Date room_Birth) {
		this.room_Birth = room_Birth;
	}


	public int getRoom_UCode1() {
		return room_UCode1;
	}


	public void setRoom_UCode1(int room_UCode1) {
		this.room_UCode1 = room_UCode1;
	}


	public int getRoom_UCode2() {
		return room_UCode2;
	}


	public void setRoom_UCode2(int room_UCode2) {
		this.room_UCode2 = room_UCode2;
	}


	@Override
	public String toString() {
		return "ChatRoomDto [room_No=" + room_No + ", room_Birth=" + room_Birth + ", room_UCode1=" + room_UCode1
				+ ", room_UCode2=" + room_UCode2 + "]";
	}

	
}
