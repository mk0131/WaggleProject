package com.probee.waggle.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.UsersDto;

@Mapper
public interface LoginMapper {
	
	@Select(" SELECT user_Id , user_Code FROM Users WHERE user_Id=#{user_Id} AND user_Pw=#{user_Pw} ")
	UsersDto UserLogin(UsersDto dto);

}
