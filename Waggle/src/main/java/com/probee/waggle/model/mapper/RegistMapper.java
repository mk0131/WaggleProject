package com.probee.waggle.model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

@Mapper
public interface RegistMapper {

	
	@Select(" SELECT count(*) FROM Users Where user_Id = #{user_Id} ")
	 int idChk(String user_Id);
	
	@Select(" SELECT count(*) FROM Users Where user_Nm = #{user_Nm} ")
	 int nmChk(String user_Nm);
	
	@Select(" SELECT count(*) FROM Users where user_Email = #{user_Email} ")
	 int emailChk(String user_Email);
	
	@Insert(" INSERT INTO Users (user_Code, user_Pw,user_Email, user_Nm, user_Gender,user_Age,user_Id) VALUES(null,"
			+ "#{user_Pw},#{user_Email},#{user_Nm},#{user_Gender},#{user_Age},#{user_Id} ) ")
	 int Join(UsersDto dto);
	
	@Select(" SELECT * FROM Users WHERE user_Email = #{user_Email}")
	 UsersDto SelectOne(String user_Email);
	
	@Insert(" INSERT INTO UserAddress (ua_UCode, ua_Post, ua_Addr, ua_DAddr, ua_Lat, ua_Lng) VALUES(#{ua_UCode},#{ua_Post},#{ua_Addr},#{ua_DAddr},#{ua_Lat},#{ua_Lng} )")
	 int AdressJoin(UserAddressDto dto);
	
	@Select("SELECT user_Naver FROM Users Where user_Email = #{user_Email}")
	UsersDto naverChk(String user_Email);
	
	@Select("SELECT user_Kakao FROM Users Where user_Email = #{user_Email}")
	UsersDto kakaoChk(String user_Email);
}
