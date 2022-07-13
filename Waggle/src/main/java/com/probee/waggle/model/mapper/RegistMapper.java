package com.probee.waggle.model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

@Mapper
public interface RegistMapper {

	
	@Select(" SELECT count(*) FROM USERS Where user_Id = #{user_Id} ")
	 int idChk(String user_Id);
	
	@Select(" SELECT count(*) FROM USERS Where user_Nm = #{user_Nm} ")
	 int nmChk(String user_Nm);
	
	@Select(" SELECT count(*) FROM USERS where user_Email = #{user_Email} ")
	 int emailChk(String user_Email);
	
	@Insert(" INSERT INTO USERS (user_Code, user_Pw,user_Email, user_Nm, user_Gender,user_Age,user_Id) VALUES(null,"
			+ "#{user_Pw},#{user_Email},#{user_Nm},#{user_Gender},#{user_Age},#{user_Id} ) ")
	 int Join(UsersDto dto);
	
	@Select(" SELECT * FROM USERS WHERE user_Id = #{user_Id}")
	 UsersDto SelectOne(String user_Id);
	
	@Insert(" INSERT INTO USERADDRESS (ua_UCode, ua_Post, ua_Addr, ua_DAddr) VALUES(#{ua_UCode},#{ua_Post},#{ua_Addr},#{ua_DAddr} )")
	 int AdressJoin(UserAddressDto dto);
}
