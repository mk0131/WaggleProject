package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.ChatContentDto;
import com.probee.waggle.model.dto.ChatRoomDto;

public interface ChatService {

	public ChatRoomDto FindChat (int room_UCode1 , int room_UCode2);
	
	public int CreChat(int room_UCode1 , int room_UCode2);
	
	public List<ChatRoomDto> ChatList(int room_UCode1);
	
	public List<ChatContentDto> ChatHistory(int room_No);
}
