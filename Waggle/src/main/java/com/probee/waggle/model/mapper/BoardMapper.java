package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.RequestDto;

@Mapper
public interface BoardMapper {
@Select(" select req_No,req_Title,req_Link,date_format(req_WDate,'%Y/%m/%d') req_WDate,date_format(req_EDate,'%Y/%m/%d') req_EDate,req_Phone,req_Detail,req_Point,req_Stat,req_UCode,req_FCode,req_HCode from Request ")
	public List<RequestDto> selectList();
}
