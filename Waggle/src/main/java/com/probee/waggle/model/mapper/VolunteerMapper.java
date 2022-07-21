package com.probee.waggle.model.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.VolunteerDto;

@Mapper
public interface VolunteerMapper {
	
	@Insert(" insert into volunteer values(#{user_Code},#{vo_No},false) ")
	int Submit(int user_Code, int vo_No);
	
	@Select(" select vo_UCode from volunteer v where vo_No = #{vo_No} and vo_UCode = #{vo_UCode} ")
	VolunteerDto SelectOne(int vo_No, int vo_UCode);
	
	@Delete(" delete from volunteer where vo_No = #{vo_No} and vo_UCode = #{vo_UCode}")
	int Cancel(int vo_No, int vo_UCode);

}
