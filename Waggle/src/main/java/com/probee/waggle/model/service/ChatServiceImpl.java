package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.ChatContentDto;
import com.probee.waggle.model.dto.ChatRoomDto;
import com.probee.waggle.model.mapper.ChatMapper;

@Service
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	ChatMapper chatMapper;

	@Override
	public ChatRoomDto FindChat(int room_UCode1, int room_UCode2) {
		return chatMapper.FindChat(room_UCode1, room_UCode2);
	}

	@Override
	public int CreChat(int room_UCode1, int room_UCode2) {
		return chatMapper.CreChat(room_UCode1, room_UCode2);
	}

	@Override
	public List<ChatRoomDto> ChatList(int room_UCode1) {
		return chatMapper.ChatList(room_UCode1);
	}

	@Override
	public List<ChatContentDto> ChatHistory(int room_No) {
		return chatMapper.ChatHistory(room_No);
	}

}
