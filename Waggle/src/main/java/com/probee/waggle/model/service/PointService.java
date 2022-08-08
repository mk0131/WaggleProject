package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.PayDto;
import com.probee.waggle.model.dto.PointsDto;

public interface PointService {
	public int selectUserPoint(int user_Code);
	public List<PointsDto> selectPointUse(int ucode);
	public List<PayDto> selectpay(int pay_UCode);
	public int insertPay(int pay_Price, int pay_UCode, String pay_Type);
	public int updateUserPoint(int user_Point, int user_Code);
	public int insertPoints(int po_Point, int po_UCode, int po_No);
	public int deletePoints(int po_No, int po_UCode);
}
