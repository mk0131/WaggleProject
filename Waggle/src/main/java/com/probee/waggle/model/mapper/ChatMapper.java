package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.ChatContentDto;
import com.probee.waggle.model.dto.ChatRoomDto;

@Mapper
public interface ChatMapper {

	
	@Select(" select * from chatroom  where room_UCode1 = #{room_UCode1} and room_UCode2 = #{room_UCode2} or room_UCode1 = #{room_UCode2} and room_UCode2 = #{room_UCode1} ")
	ChatRoomDto FindChat (int room_UCode1 , int room_UCode2);
	
	@Insert(" insert into chatroom values(null,now(),#{room_UCode1},#{room_UCode2}) ")
	int CreChat(int room_UCode1 , int room_UCode2);
	
	@Select(" select * from chatroom where room_UCode1 = #{room_UCode1} or room_UCode2  = #{room_UCode2} ")
	List<ChatRoomDto> ChatList(int room_UCode1);
	
	@Select(" select * from chatcontent where chat_Num = #{room_No} ")
	List<ChatContentDto> ChatHistory(int room_No);
	
	@Insert(" insert into chatcontent values (null,#{chat_Num},#{chat_Content},now(),false,#{chat_UCode}) ")
	int Content(int chat_Num, String chat_Content, int chat_UCode);
	
	@Update(" update chatcontent set chat_Chk = true where chat_Num = #{chat_Num} and chat_UCode != #{chat_UCode} ")
	int Chk(int chat_Num, int chat_UCode);
}
