package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.MypageFinishlistDto;

@Mapper
public interface MypageMapper {

	@Update(" UPDATE USERS SET USER_INTRO = #{description} WHERE USER_CODE = #{code}")
	public int DescUpdate(String description, int code);
	
	@Select(" SELECT USER_INTRO FROM USERS WHERE USER_CODE = #{code}")
	public String SelectDesc(int code); 
	
	@Select(" select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, RES_UCODE from request join HOME on REQUEST.REQ_HCODE = HOME.home_Code join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE JOIN RESULT ON REQUEST.REQ_NO = RESULT.RES_NO JOIN USERS ON RESULT.RES_UCODE = USERS.USER_CODE WHERE REQ_STAT = #{stat} AND RES_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode);
	
	//이용내역페이지 나의 요청 sql
	@Select("select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, RES_UCODE from request join HOME on REQUEST.REQ_HCODE = HOME.home_Code join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE JOIN RESULT ON REQUEST.REQ_NO = RESULT.RES_NO JOIN USERS ON RESULT.RES_UCODE = USERS.USER_CODE WHERE REQ_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectMyRequest(int ucode);
	
	//이용내역페이지 나의 수행 sql
	@Select("select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, RES_UCODE from request join HOME on REQUEST.REQ_HCODE = HOME.home_Code join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE JOIN RESULT ON REQUEST.REQ_NO = RESULT.RES_NO JOIN USERS ON RESULT.RES_UCODE = USERS.USER_CODE WHERE RES_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectMyPerform(int ucode);
	
}
