package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.NoticeDto;

@Mapper
public interface NoticeMapper {

	
	@Insert(" insert into notice values(null, #{no_Type}, #{no_Title}, #{no_Content}, now() )")
	int insert(String no_Type, String no_Title, String no_Content);
	
	@Select(" select * from notice order by no_No desc ")
	List<NoticeDto> list();
}
