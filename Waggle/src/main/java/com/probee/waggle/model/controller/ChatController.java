package com.probee.waggle.model.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.ChatRoomDto;
import com.probee.waggle.model.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService chatService;
	
	@GetMapping("/create") // 채팅하기 클릭시
	public String ChatCreate(int room_UCode1 , int room_UCode2 , Model model) {
		
		ChatRoomDto dto = chatService.FindChat(room_UCode1, room_UCode2); // 나의 유저코드, 상대방 유저코드로 둘이속한 채팅방 검사
		
		if(dto == null) {
			chatService.CreChat(room_UCode1, room_UCode2); // 없으면 새로 만들기
		}
		
		model.addAttribute("dto",chatService.ChatList(room_UCode1)); // 내가속한 채팅방 리스트 구하기
		
		
		return "ChatList";
	}
	
	@GetMapping("/list") // 채팅 클릭시 
	public String ChatList(int room_UCode1, Model model) {
		
		
		model.addAttribute("dto",chatService.ChatList(room_UCode1)); // 내가속한 채팅방 리스트 구하기
		
		
		return "ChatList";
	}
	
	@GetMapping("/chatting")
	public String Chat(int room_No , Model model) {
		
		model.addAttribute("chat",chatService.ChatHistory(room_No)); // 해당 채팅방의 채팅내역 불러오기
		
		
		return "Chatting";
	}

}
