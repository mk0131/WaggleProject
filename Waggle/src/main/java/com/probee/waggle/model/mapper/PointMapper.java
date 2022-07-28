package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.PayDto;
import com.probee.waggle.model.dto.PointsDto;

@Mapper
public interface PointMapper {
	
	// 유저코드로 포인트 조회
	@Select(" select user_Point from Users where user_Code=#{user_Code} ")
	public int selectUserPoint(int user_Code);
	
	// 유저코드로 포인트 사용내역 조회
	@Select(" SELECT * FROM POINTS WHERE PO_UCODE=#{ucode} ")
	public List<PointsDto> SelectPointUse(int ucode);
	
	// 유저코드로 포인트 충전내역 조회
	@Select(" select * from Pay where pay_UCode=#{pay_UCode} ")
	public List<PayDto> selectPay(int pay_UCode);
	
}
