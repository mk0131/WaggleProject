package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.MapDto;

@Mapper
public interface MapMapper {

	@Select("select home_Post, home_DAddr, req_No, fi_Nm from RESULTFILE join result on RESULTFILE.RF_RCODE = result.RES_CODE join FILE on RESULTFILE.rf_FCode = FILE.fi_Code join REQUEST on RESULT.RES_NO = REQUEST.REQ_NO join HOME on REQUEST.REQ_HCODE = HOME.home_Code")
	public List<MapDto> selectList();
	
	@Select("select home_Post, home_DAddr, req_No, fi_Nm from RESULTFILE join result on RESULTFILE.RF_RCODE = result.RES_CODE join FILE on RESULTFILE.rf_FCode = FILE.fi_Code join REQUEST on RESULT.RES_NO = REQUEST.REQ_NO join HOME on REQUEST.REQ_HCODE = HOME.home_Code where home_Post = #{search_post} ")
	public List<MapDto> selectSearchList(String search_post);
	
	
}
