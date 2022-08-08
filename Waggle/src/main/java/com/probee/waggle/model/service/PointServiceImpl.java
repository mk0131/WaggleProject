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
	public int insertPay(int pay_Price, int pay_UCode, String pay_Type) {
		return pointMapper.insertPay(pay_Price, pay_UCode, pay_Type);
	}

	@Override
	public int updateUserPoint(int user_Point, int user_Code) {
		return pointMapper.updateUserPoint(user_Point, user_Code);
	}

	@Override
	public int insertPoints(int po_Point, int po_UCode, int po_No) {
		return pointMapper.insertPoints(po_Point, po_UCode, po_No);
	}

	@Override
	public int deletePoints(int po_No, int po_UCode) {
		return pointMapper.deletePoints(po_No, po_UCode);
	}
	
	

}
