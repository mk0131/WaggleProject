package com.probee.waggle.model.dto;

import java.util.Date;

public class ChatRoomDto {
	private int room_No;
	private int room_ReqNo;
	private Date room_Birth;
	
	public ChatRoomDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ChatRoomDto(int room_No, int room_ReqNo, Date room_Birth) {
		super();
		this.room_No = room_No;
		this.room_ReqNo = room_ReqNo;
		this.room_Birth = room_Birth;
	}

	public int getRoom_No() {
		return room_No;
	}

	public void setRoom_No(int room_No) {
		this.room_No = room_No;
	}

	public int getRoom_ReqNo() {
		return room_ReqNo;
	}

	public void setRoom_ReqNo(int room_ReqNo) {
		this.room_ReqNo = room_ReqNo;
	}

	public Date getRoom_Birth() {
		return room_Birth;
	}

	public void setRoom_Birth(Date room_Birth) {
		this.room_Birth = room_Birth;
	}

	@Override
	public String toString() {
		return "ChatRoomDto [room_No=" + room_No + ", room_ReqNo=" + room_ReqNo + ", room_Birth=" + room_Birth + "]";
	}
	
	
}
