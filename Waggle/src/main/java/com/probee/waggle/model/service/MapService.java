package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.MapDto;

public interface MapService {
	public List<MapDto> selectList();
	
	public List<MapDto> selectSearchList(String search_post);
}
