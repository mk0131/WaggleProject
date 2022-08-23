package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.ChatContentDto;
import com.probee.waggle.model.dto.ChatContentDto2;
import com.probee.waggle.model.dto.ChatRoomDto;
import com.probee.waggle.model.dto.ChatRoomDto2;

@Mapper
public interface ChatMapper {


    @Select(" select * from ChatRoom  where room_UCode1 = #{room_UCode1} and room_UCode2 = #{room_UCode2} or room_UCode1 = #{room_UCode2} and room_UCode2 = #{room_UCode1} ")
    ChatRoomDto FindChat(int room_UCode1, int room_UCode2);

    @Insert(" insert into ChatRoom values(null,now(),#{room_UCode1},#{room_UCode2}) ")
    int CreChat(int room_UCode1, int room_UCode2);

    @Select(" select room_No , chat_Content, max(chat_Date) as chat_Date, count(if(chat_Chk = false and chat_UCode != #{room_UCode1} , chat_Chk, null)) as chat_Chk , fi_Nm , user_Nm "
            + "from  (select * from ChatContent  order by chat_Date desc LIMIT 18446744073709551615 ) as chat_Date right join ChatRoom  on room_No  = chat_Num  "
            + "left join Users u on u.user_Code = case when room_UCode1 = #{room_UCode1}  then room_UCode2  when room_UCode2 = #{room_UCode1}  then room_UCode1 end "
            + "left join File f on u.user_Pro = f.fi_Code "
            + "where room_UCode1 = #{room_UCode1} or room_UCode2  = #{room_UCode1} group by room_No order by chat_Date desc")
    List<ChatRoomDto2> ChatList(int room_UCode1);

    @Select(" select chat_Code,user_Nm, fi_Nm, chat_Content, chat_Date, chat_Chk, chat_UCode from Users u inner join ChatContent c on u.user_Code = c.chat_UCode "
            + "left outer join File f on u.user_Pro = f.fi_Code where c.chat_Num = #{room_No} order by chat_Code")
    List<ChatContentDto2> ChatHistory(int room_No);

    @Insert(" insert into ChatContent values (null,#{chat_Num},#{chat_Content},Now(),false,#{chat_UCode}) ")
    int Content(int chat_Num, String chat_Content, int chat_UCode);

    @Update(" update ChatContent set chat_Chk = true where chat_Num = #{chat_Num} and chat_UCode != #{chat_UCode} ")
    int Chk(int chat_Num, int chat_UCode);
}
