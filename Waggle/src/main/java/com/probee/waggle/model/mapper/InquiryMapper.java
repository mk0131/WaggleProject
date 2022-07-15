package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.InquiryDto;

@Mapper
public interface InquiryMapper {
	
	@Select(" SELECT IN_CODE, IN_UCODE, IN_TYPE, IN_TITLE, IN_DATE, IN_CONTENT, IN_STAT, IN_ANSWER, in_CHK FROM INQUIRY join USERS on(IN_UCODE = USER_CODE) order by IN_CODE DESC ")
	public List<InquiryDto> selectList();
	
	@Select(" SELECT IN_CODE, IN_UCODE, IN_TYPE, IN_TITLE, IN_DATE, IN_CONTENT, IN_STAT, IN_ANSWER, in_CHK FROM INQUIRY join USERS on(IN_UCODE = USER_CODE) order by IN_CODE DESC ")
	public List<InquiryDto> selectuserList();
	
	@Select(" SELECT IN_CODE, IN_UCODE, IN_TYPE, IN_TITLE, IN_DATE , IN_CONTENT, IN_STAT, IN_ANSWER, IN_CHK FROM INQUIRY join USERS on(IN_UCODE = USER_CODE) WHERE IN_CODE = #{in_code} ")
	public InquiryDto selectOne(int in_Code);
	
	@Insert(" INSERT INTO INQUIRY VALUES(NULL, #{in_ucode}, #{in_type}, #{in_title), NOW(), #{in_content), null, null, false ")
	public int insert(InquiryDto dto);
	
	@Update(" UPDATE INQUIRY SET IN_TITLE = #{in_title}, IN_CONTENT = #{in_content} WHERE IN_CODE = #{in_code} ")
	public int update(InquiryDto dto);
	
	@Delete(" DELETE FROM INQUIRY WHERE IN_CODE = #{in_code} ")
	public int delete(int in_Code);
	
}
