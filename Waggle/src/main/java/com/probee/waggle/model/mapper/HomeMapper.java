package com.probee.waggle.model.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.HomeDto;

@Mapper
public interface HomeMapper {

	@Select(" select * from Home where (home_Addr=#{home_Addr} or home_Addr=#{ji_Addr} or home_Addr=#{road_Addr}) and home_DAddr=#{home_DAddr} ")
	public HomeDto findHome(String home_Addr, String ji_Addr, String road_Addr, String home_DAddr);
	
	@Insert(" insert into Home(home_Post,home_Addr,home_DAddr,home_Lat, home_Lng) values(#{home_Post},#{home_Addr},#{home_DAddr},#{home_Lat},#{home_Lng}) ")
	public int insertHome(HomeDto dto);
	
	@Select(" select * from Home where home_Code=#{home_Code} ")
	public HomeDto selectHome(int home_Code);
}
