package com.probee.waggle.model.service;

import com.probee.waggle.model.dto.HomeDto;

public interface HomeService {

	public HomeDto selectHome(int homecode);
	public HomeDto findHome(HomeDto dto);
	public int insertHome(HomeDto dto);
	
}
