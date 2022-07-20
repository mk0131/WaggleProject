package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.PointsDto;

public interface PointService {
	public List<PointsDto> selectPointUse(int ucode);
}
