package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.PointsDto;
import com.probee.waggle.model.mapper.PointMapper;

@Service
public class PointServiceImpl implements PointService{
	
	@Autowired
	PointMapper pointMapper;

	@Override
	public List<PointsDto> selectPointUse(int ucode) {
		return pointMapper.SelectPointUse(ucode);
	}
	
	

}
