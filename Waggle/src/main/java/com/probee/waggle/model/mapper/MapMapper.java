package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.MapDto;
import com.probee.waggle.model.dto.MapUserInfoDto;

@Mapper
public interface MapMapper {

	@Select("select user_Code, ua_Addr, fi_Nm from UserAddress left outer join users on user_Code = ua_UCode left outer join File on user_Pro = fi_Code")
	public List<MapUserInfoDto> selectUserAddress();
	
	@Select("select home_Post, home_Addr, home_DAddr, req_No, fi_Nm, res_WDate, res_UCode, po_UCode from ResultFile join Result on ResultFile.rf_RCode = Result.res_Code join File on ResultFile.rf_FCode = File.fi_Code join Request on Result.res_No = Request.req_No join Home on Request.req_HCode = Home.home_Code left outer join Points on Request.req_No = Points.po_No where (home_Addr = #{jibunAddr} OR home_Addr = #{roadAddr}) and res_Stat = '완료' ")
	public List<MapDto> selectSearchList(String jibunAddr, String roadAddr);
	
	@Select("select home_Post, home_Addr, home_DAddr, req_No, fi_Nm, res_WDate, res_UCode, po_UCode from RESULTFILE join Result on ResultFile.rf_RCode = Result.res_Code join File on ResultFile.rf_FCode = File.fi_Code join Request on Result.res_No = Request.req_No join Home on Request.req_HCode = Home.home_Code left outer join Points on Request.req_No = Points.po_No  where (home_Addr = #{jibunAddr} OR home_Addr = #{roadAddr}) and home_DAddr = #{DAddr} and res_Stat='완료'")
	public List<MapDto> selectClickList(String jibunAddr, String roadAddr, String DAddr);
	
	
}
