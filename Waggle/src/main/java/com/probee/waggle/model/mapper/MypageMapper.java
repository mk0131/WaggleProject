package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

@Mapper
public interface MypageMapper {
	
	//유저정보 가져오기
	@Select( "SELECT * FROM USERS WHERE USER_CODE = #{ucode}")
	public UsersDto SelectUsersInfo(int ucode);
	
	//자기소개 수정
	@Update(" UPDATE USERS SET USER_INTRO = #{description} WHERE USER_CODE = #{code}")
	public int DescUpdate(String description, int code);
	
	//자기소개 가져오기
	@Select(" SELECT USER_INTRO FROM USERS WHERE USER_CODE = #{code}")
	public String SelectDesc(int code); 
	
	//완료된 리스트 가져오기
	@Select(" select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, RES_UCODE from request join HOME on REQUEST.REQ_HCODE = HOME.home_Code join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE JOIN RESULT ON REQUEST.REQ_NO = RESULT.RES_NO JOIN USERS ON RESULT.RES_UCODE = USERS.USER_CODE WHERE REQ_STAT = #{stat} AND RES_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode);
	
	@Select(" SELECT * FROM USERADDRESS WHERE ua_UCode = #{ua_UCode} ")
	public UserAddressDto SelectAddr(int ua_Ucode);

	//이용내역페이지 나의 요청 sql
	@Select("select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, RES_UCODE from request join HOME on REQUEST.REQ_HCODE = HOME.home_Code join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE JOIN RESULT ON REQUEST.REQ_NO = RESULT.RES_NO JOIN USERS ON RESULT.RES_UCODE = USERS.USER_CODE WHERE REQ_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectMyRequest(int ucode);
	
	//이용내역페이지 나의 수행 sql
	@Select("select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, RES_UCODE from request join HOME on REQUEST.REQ_HCODE = HOME.home_Code join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE JOIN RESULT ON REQUEST.REQ_NO = RESULT.RES_NO JOIN USERS ON RESULT.RES_UCODE = USERS.USER_CODE WHERE RES_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectMyPerform(int ucode);

	@Update(" UPDATE USERS SET User_PW = #{user_Pw} WHERE user_Code = #{user_Code} ")
	public int PwChange(String user_Pw, int user_Code);
	
	@Update(" UPDATE USERS SET User_Email = #{user_Email} WHERE user_Code = #{user_Code} ")
	public int EmailChange(String user_Email, int user_Code);
	
	@Update(" UPDATE USERS SET User_Nm = #{user_Nm} WHERE user_Code = #{user_Code} ")
	public int NmChange(String user_Nm, int user_Code);
	
	@Update(" UPDATE USERS SET User_Age = #{user_Age} WHERE user_Code = #{user_Code} ")
	public int AgeChange(int user_Age, int user_Code);
	
	@Update(" UPDATE UserAddress SET ua_Post = #{ua_Post}, ua_Addr =#{ua_Addr}, ua_DAddr =#{ua_DAddr} WHERE ua_UCode = #{ua_UCode} ")
	public int AddrChange(String ua_Post, String ua_Addr, String ua_DAddr, int ua_UCode);
	
	@Update(" UPDATE USERS SET User_Gender = #{user_Gender} WHERE user_Code = #{user_Code} ")
	public int GenderChange(String user_Gender, int user_Code);
	
	@Select("SELECT * FROM file ORDER BY fi_Code DESC LIMIT 1")
	public List<FileDto> SelectLastFiCode();
	
	@Insert("INSERT INTO FILE VALUES(NULL, 'img', CONCAT('/images/profile/profile_',#{fi_Code},'.jpg'))")
	public int ImageFileInsert(int fi_Code);
	
	@Update("UPDATE USERS SET USER_PRO = #{fi_Code} WHERE USER_CODE = #{ucode}")
	public int UserProChange(int fi_Code, int ucode);
	
	
	
}
