package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.ConfirmDto2;

@Mapper
public interface LicenseMapper {

	@Select(" select * from Confirm c left outer join File f on c.co_FCode = f.fi_Code ")
	public List<ConfirmDto2> selectAll();
}
