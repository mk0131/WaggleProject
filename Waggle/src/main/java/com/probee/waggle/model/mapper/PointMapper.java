package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.PointsDto;

@Mapper
public interface PointMapper {

	@Select("SELECT * FROM POINTS WHERE PO_UCODE = #{ucode}")
	public List<PointsDto> SelectPointUse(int ucode);
	
}
