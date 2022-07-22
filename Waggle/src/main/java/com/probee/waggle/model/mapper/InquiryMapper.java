package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.InquiryDto;
import com.probee.waggle.model.dto.UsersDto;

@Mapper
public interface InquiryMapper {
	
	@Select(" SELECT IN_CODE, IN_UCODE, IN_TYPE, IN_TITLE, IN_DATE, IN_CONTENT, IN_STAT, IN_ANSWER, in_CHK FROM INQUIRY left join USERS on IN_UCODE = USER_CODE where IN_UCODE = #{user_Code} order by IN_CODE desc ")
	public List<InquiryDto> selectList(int user_Code);
	
//	@Select(" SELECT IN_CODE, IN_UCODE, IN_TYPE, IN_TITLE, IN_DATE, IN_CONTENT, IN_STAT, IN_ANSWER, in_CHK FROM INQUIRY join USERS on(IN_UCODE = USER_CODE) order by IN_CODE DESC ")
//	public List<InquiryDto> selectuserList();
	
	@Select(" SELECT IN_CODE, IN_UCODE, IN_TYPE, IN_TITLE, IN_DATE , IN_CONTENT, IN_STAT, IN_ANSWER, IN_CHK FROM INQUIRY join USERS on(IN_UCODE = USER_CODE) WHERE IN_CODE = #{in_Code} ")
	public InquiryDto selectOne(int in_Code);
	
	@Insert(" INSERT INTO INQUIRY(in_UCode, in_Type, in_Title, in_Date, in_Content) VALUES(#{in_UCode}, #{in_Type}, #{in_Title}, NOW(), #{in_Content}) ")
	public int insert(InquiryDto dto);
	
	@Update(" UPDATE INQUIRY SET IN_TITLE = #{in_Title}, IN_CONTENT = #{in_Content} WHERE IN_CODE = #{in_Code} ")
	public int update(InquiryDto dto);
	
	@Delete(" DELETE FROM INQUIRY WHERE IN_CODE = #{in_Code} ")
	public int delete(int in_Code);
	
	@Select(" select * from Users where user_Code in (#{user_Code}) ")
	public UsersDto selectUser(int user_Code);
	
}
