package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.PayDto;
import com.probee.waggle.model.dto.PointsDto;
import com.probee.waggle.model.mapper.PointMapper;

@Service
public class PointServiceImpl implements PointService{
	
	@Autowired
	PointMapper pointMapper;
	
	@Override
	public int selectUserPoint(int user_Code) {
		return pointMapper.selectUserPoint(user_Code);
	}

	@Override
	public List<PointsDto> selectPointUse(int ucode) {
		return pointMapper.SelectPointUse(ucode);
	}

	@Override
	public List<PayDto> selectpay(int pay_UCode) {
		return pointMapper.selectPay(pay_UCode);
	}

	@Override
	public int insertPay(int pay_Price, int pay_UCode) {
		return pointMapper.insertPay(pay_Price, pay_UCode);
	}

	@Override
	public int updateUserPoint(int user_Point, int user_Code) {
		return pointMapper.updateUserPoint(user_Point, user_Code);
	}
	
	

}
