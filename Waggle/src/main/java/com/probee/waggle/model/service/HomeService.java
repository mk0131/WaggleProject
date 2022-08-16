package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.HomeDto;
import com.probee.waggle.model.dto.NoticeDto;
import com.probee.waggle.model.dto.RequestDto;

public interface HomeService {

	public HomeDto selectHome(int home_Code);
	public HomeDto findHome(String home_Addr, String ji_Addr, String road_Addr, String home_DAddr);
	public int insertHome(HomeDto dto);
	public List<RequestDto> selectFinishReq();
	
}
