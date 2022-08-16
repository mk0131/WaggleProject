package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.HomeDto;
import com.probee.waggle.model.dto.NoticeDto;
import com.probee.waggle.model.dto.RequestDto;
import com.probee.waggle.model.mapper.HomeMapper;
import com.probee.waggle.model.mapper.NoticeMapper;

@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	HomeMapper homeMapper;
	
	@Autowired
	NoticeMapper noticeMapper;

	@Override
	public HomeDto selectHome(int home_Code) {
		return homeMapper.selectHome(home_Code);
	}

	@Override
	public HomeDto findHome(String home_Addr, String ji_Addr, String road_Addr, String home_DAddr) {
		return homeMapper.findHome(home_Addr, ji_Addr, road_Addr, home_DAddr);
	}

	@Override
	public int insertHome(HomeDto dto) {
		return homeMapper.insertHome(dto);
	}

	@Override
	public List<RequestDto> selectFinishReq() {
		return homeMapper.selectFinishReq();
	}
}
