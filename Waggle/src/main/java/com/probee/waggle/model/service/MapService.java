package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.MapDto;
import com.probee.waggle.model.dto.MapUserInfoDto;

public interface MapService {
	public List<MapUserInfoDto> selectUserAddress();
	
	public List<MapDto> selectSearchList(String search_post);
}
