package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.MapDto;

@Mapper
public interface MapMapper {

	@Select("select home_Post, home_Addr, home_DAddr, rf_No, fi_Nm from RESULTFILE join REQUEST on RESULTFILE.RF_NO = REQUEST.REQ_NO join HOME on REQUEST.REQ_HCODE = HOME.home_Code join FILE on RESULTFILE.rf_FCode = FILE.fi_Code ")
	public List<MapDto> selectList();
}
