package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.MapDto;
import com.probee.waggle.model.mapper.MapMapper;

@Service
public class MapServiceImpl implements MapService{
	
	@Autowired
	MapMapper mapMapper;
	
	@Override
	public List<MapDto> selectList(){
		return mapMapper.selectList();
	}
	

}
