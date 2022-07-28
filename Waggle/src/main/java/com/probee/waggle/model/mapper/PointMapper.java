package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

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
	
	// 유저코드와 금액으로 Pay DB 데이터 추가
	@Insert(" insert into Pay(pay_Price, pay_Date, pay_UCode, pay_Type) values(#{pay_Price}, NOW(), #{pay_UCode}, #{pay_Type}) ")
	public int insertPay(int pay_Price, int pay_UCode, String pay_Type);
	
	// Users DB에서 point 업데이트
	@Update(" update Users set user_Point=#{user_Point} where user_Code=#{user_Code} ")
	public int updateUserPoint(int user_Point, int user_Code);
	
}
