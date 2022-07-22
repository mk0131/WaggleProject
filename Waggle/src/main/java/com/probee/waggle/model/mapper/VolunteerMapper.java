package com.probee.waggle.model.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.VolunteerDto;

@Mapper
public interface VolunteerMapper {
	
	@Insert(" insert into volunteer values(#{user_Code},#{vo_No},false) ")
	int Submit(int user_Code, int vo_No);
	
	@Select(" select * from volunteer v where vo_No = #{vo_No} and vo_UCode = #{vo_UCode} ")
	VolunteerDto SelectOne(int vo_No, int vo_UCode);
	
	@Delete(" delete from volunteer where vo_No = #{vo_No} and vo_UCode = #{vo_UCode}")
	int Cancel(int vo_No, int vo_UCode);
	
	@Delete(" delete from volunteer where  vo_No = #{req_No} ")
	int delete(int vo_No);
	
	@Update(" update volunteer set vo_Block = true where vo_No = #{vo_No} and vo_UCode = #{vo_UCode} ")
	int Block(int vo_No, int vo_UCode);
	
	@Update(" update Result set res_Stat = '취소(0)' where res_No = #{vo_No} and res_UCode = #{vo_UCode} ")
	int ResCancel(int vo_No, int vo_UCode);
	
	@Update(" update Result set res_Stat = '취소(0)' where res_No = #{req_No}  ")
	int Revoke(int req_No);
	
}
