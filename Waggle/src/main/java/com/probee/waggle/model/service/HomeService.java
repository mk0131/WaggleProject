package com.probee.waggle.model.service;

import com.probee.waggle.model.dto.HomeDto;

public interface HomeService {

	public HomeDto selectHome(int home_Code);
	public HomeDto findHome(String home_Addr, String ji_Addr, String road_Addr, String home_DAddr);
	public int insertHome(HomeDto dto);
	
	
}
