package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.ChatContentDto;
import com.probee.waggle.model.dto.ChatContentDto2;
import com.probee.waggle.model.dto.ChatRoomDto;
import com.probee.waggle.model.dto.ChatRoomDto2;
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
	public List<ChatRoomDto2> ChatList(int room_UCode1) {
		return chatMapper.ChatList(room_UCode1);
	}

	@Override
	public List<ChatContentDto2> ChatHistory(int room_No) {
		return chatMapper.ChatHistory(room_No);
	}

	@Override
	public int Content(int chat_Num, String chat_Content, int chat_UCode) {
		return chatMapper.Content(chat_Num, chat_Content, chat_UCode);
	}

	@Override
	public int Chk(int chat_Num, int chat_UCode) {
		return chatMapper.Chk(chat_Num, chat_UCode);
	}

}
