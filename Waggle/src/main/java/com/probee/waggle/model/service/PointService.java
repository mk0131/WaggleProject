package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.PayDto;
import com.probee.waggle.model.dto.PointsDto;

public interface PointService {
	public int selectUserPoint(int user_Code);
	public List<PointsDto> selectPointUse(int ucode);
	public List<PayDto> selectpay(int pay_UCode);
}
