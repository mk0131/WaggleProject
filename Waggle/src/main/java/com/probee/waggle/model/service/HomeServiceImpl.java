package com.probee.waggle.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.HomeDto;
import com.probee.waggle.model.mapper.HomeMapper;

@Service
public class HomeServiceImpl implements HomeService{
	
	@Autowired
	HomeMapper homeMapper;

	@Override
	public HomeDto selectHome(int homecode) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public HomeDto findHome(HomeDto dto) {
		return homeMapper.findHome(dto);
	}

	@Override
	public int insertHome(HomeDto dto) {
		return homeMapper.insertHome(dto);
	}

}
