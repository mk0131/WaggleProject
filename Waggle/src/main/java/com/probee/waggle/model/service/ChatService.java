package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.ChatContentDto;
import com.probee.waggle.model.dto.ChatContentDto2;
import com.probee.waggle.model.dto.ChatRoomDto;
import com.probee.waggle.model.dto.ChatRoomDto2;

public interface ChatService {

	public ChatRoomDto FindChat (int room_UCode1 , int room_UCode2);
	
	public int CreChat(int room_UCode1 , int room_UCode2);
	
	public List<ChatRoomDto2> ChatList(int room_UCode1);
	
	public List<ChatContentDto2> ChatHistory(int room_No);
	
	public int Content(int chat_Num, String chat_Content, int chat_UCode);
	
	public int Chk(int chat_Num, int chat_UCode);
}
