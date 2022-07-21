package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.MapDto;
import com.probee.waggle.model.dto.MapUserInfoDto;

@Mapper
public interface MapMapper {

	@Select("select user_Code, ua_addr, fi_Nm from userAddress left outer join users on user_Code = ua_ucode left outer join file on user_Pro = fi_code")
	public List<MapUserInfoDto> selectUserAddress();
	
	@Select("select home_Post, home_DAddr, req_No, fi_Nm from RESULTFILE join result on RESULTFILE.RF_RCODE = result.RES_CODE join FILE on RESULTFILE.rf_FCode = FILE.fi_Code join REQUEST on RESULT.RES_NO = REQUEST.REQ_NO join HOME on REQUEST.REQ_HCODE = HOME.home_Code where home_Post = #{search_post} ")
	public List<MapDto> selectSearchList(String search_post);
	
	
}
