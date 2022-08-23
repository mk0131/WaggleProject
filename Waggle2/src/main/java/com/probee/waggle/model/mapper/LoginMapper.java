package com.probee.waggle.model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.UsersDto;

@Mapper
public interface LoginMapper {

    @Select(" SELECT * FROM Users WHERE user_Email = #{user_Email} ")
    UsersDto Naver(UsersDto dto);

    @Select(" SELECT * FROM Users WHERE user_Id = #{user_Id} ")
    UsersDto UserId(UsersDto dto);

    @Insert(" INSERT INTO Users (user_Code, user_Email, user_Nm, user_Gender, user_Naver) VALUES(null,#{user_Email},#{user_Nm},#{user_Gender},#{user_Naver}) ")
    int NaverRegist(UsersDto dto);

    @Insert(" INSERT INTO Users (user_Code, user_Email, user_Nm, user_Gender, user_Kakao) VALUES(null,#{user_Email},#{user_Nm},#{user_Gender},#{user_Kakao}) ")
    int KakaoRegist(UsersDto dto);


}
