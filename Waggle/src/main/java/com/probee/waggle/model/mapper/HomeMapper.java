package com.probee.waggle.model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.HomeDto;

@Mapper
public interface HomeMapper {

	@Select(" select * from Home where (home_Post, home_DAddr)=(#{home_Post}, #{home_DAddr}) ")
	public HomeDto findHome(HomeDto dto);
	
	@Insert(" insert into Home(home_Post,home_Addr,home_DAddr) values(#{home_Post},#{home_Addr},#{home_DAddr}) ")
	public int insertHome(HomeDto dto);
}
