package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.dto.VolunteerDto;

@Mapper
public interface BoardMapper {
	
	@Select(" select req_No,req_Title,req_Link,date_format(req_WDate,'%Y/%m/%d') req_WDate,date_format(req_EDate,'%Y/%m/%d') req_EDate,req_Phone,req_Detail,req_Point,req_Stat,req_UCode,req_FCode,req_HCode from Request order by req_No desc ")
	public List<RequestDto2> selectList();
	
	@Select(" select * from Request where req_No=#{req_No} ")
	public RequestDto selectRequest(int req_NO);
	
	@Insert(" INSERT INTO Request values (null,#{req_Title},#{req_Link},NOW(),#{req_EDate},#{req_Phone},#{req_Detail},#{req_Point},'모집중',#{req_UCode},null,#{req_HCode}) ")
	public int insertRequest(RequestDto2 dto);
	
	@Select(" select * from Result where res_No=#{res_No} and res_Stat in ('진행중','완료') ")
	public ResultDto selectResult(int res_No);
	
	@Select(" select * from Volunteer where vo_No=#{req_No} ")
	public List<VolunteerDto> selectVolunteer(int req_No);
	
	@Select(" select * from Users where user_Code in (#{user_Code}) ")
	public List<UsersDto> selectUsers(String user_Code);
	
	
}
