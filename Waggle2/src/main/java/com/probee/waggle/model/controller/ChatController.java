package com.probee.waggle.model.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.probee.waggle.model.dto.ChatContentDto;
import com.probee.waggle.model.dto.ChatContentDto2;
import com.probee.waggle.model.dto.ChatRoomDto;
import com.probee.waggle.model.dto.ChatRoomDto2;
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
		
		
		return "ChatList";
	}
	
	@GetMapping("/list") // 채팅 클릭시 
	public String ChatList(int room_UCode1, Model model) {
	
		
		return "ChatList";
	}
	
	@PostMapping("show")
	@ResponseBody
	public List<ChatRoomDto2> Show(int room_UCode1){
		
		List<ChatRoomDto2> list = chatService.ChatList(room_UCode1);
		
		return list;
	}
	
	@PostMapping("/chatting")
	@ResponseBody
	public List<ChatContentDto2> Chat(int room_No , int chat_UCode) {
		
		chatService.Chk(room_No,chat_UCode ); // 상대 채팅 읽음 표시
		
		List<ChatContentDto2> list = chatService.ChatHistory(room_No); // 해당 채팅방의 채팅내역 불러오기
		
		return list;
	}
	
	@PostMapping("/content")
	@ResponseBody
	public String Content(int chat_Num, String chat_Content, int chat_UCode) {
		
		chatService.Chk(chat_Num,chat_UCode ); // 상대 채팅 읽음 표시
		
		int res = chatService.Content(chat_Num, chat_Content, chat_UCode); // 채팅입력 하기
		if(res != 0) {
			return "success";
		} else {
			return "fail";	
		}
		
		
	}

}
