package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.RequestDto;

@Mapper
public interface BoardMapper {

	@Select(" SELECT * FROM Request ")
	public List<RequestDto> selectList();
}
