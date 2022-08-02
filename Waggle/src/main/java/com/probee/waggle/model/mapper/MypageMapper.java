package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.ConfirmDto;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.MypageOtherDto;
import com.probee.waggle.model.dto.MypageUsageDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

@Mapper
public interface MypageMapper {
	
	//유저정보 가져오기
	@Select( "SELECT * FROM USERS LEFT OUTER JOIN CONFIRM ON USERS.USER_CODE=CONFIRM.CO_UCODE WHERE USER_CODE = #{ucode}")
	public MypageOtherDto SelectUsersInfo(int ucode);
	
	//자기소개 수정
	@Update(" UPDATE USERS SET USER_INTRO = #{description} WHERE USER_CODE = #{code}")
	public int DescUpdate(String description, int code);
	
	//자기소개 가져오기
	@Select(" SELECT USER_INTRO FROM USERS WHERE USER_CODE = #{code}")
	public String SelectDesc(int code); 
	
	//완료된 리스트 가져오기
	@Select(" select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, RES_UCODE from request left outer join HOME on REQUEST.REQ_HCODE = HOME.home_Code left outer join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE left outer JOIN RESULT ON REQUEST.REQ_NO = RESULT.RES_NO left outer JOIN USERS ON RESULT.RES_UCODE = USERS.USER_CODE WHERE REQ_STAT = #{stat} AND RES_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode);
	
	@Select(" SELECT * FROM USERADDRESS WHERE ua_UCode = #{ua_UCode} ")
	public UserAddressDto SelectAddr(int ua_Ucode);

	//이용내역페이지 나의 요청 sql
	@Select("select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm from request left outer join HOME on REQUEST.REQ_HCODE = HOME.home_Code left outer join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE WHERE REQ_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectMyRequest(int ucode);
	
	//이용내역페이지 나의 수행 sql
	@Select("select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, RES_UCODE from request left outer join HOME on REQUEST.REQ_HCODE = HOME.home_Code left outer join FILE on REQUEST.REQ_FCODE = FILE.FI_CODE left outer JOIN RESULT ON REQUEST.REQ_NO = RESULT.RES_NO left outer JOIN USERS ON RESULT.RES_UCODE = USERS.USER_CODE WHERE RES_UCODE = #{ucode} ")
	public List<MypageFinishlistDto> SelectMyPerform(int ucode);

	@Update(" UPDATE USERS SET User_PW = #{user_Pw} WHERE user_Code = #{user_Code} ")
	public int PwChange(String user_Pw, int user_Code);
	
	@Update(" UPDATE USERS SET User_Email = #{user_Email} WHERE user_Code = #{user_Code} ")
	public int EmailChange(String user_Email, int user_Code);
	
	@Update(" UPDATE USERS SET User_Nm = #{user_Nm} WHERE user_Code = #{user_Code} ")
	public int NmChange(String user_Nm, int user_Code);
	
	@Update(" UPDATE USERS SET User_Age = #{user_Age} WHERE user_Code = #{user_Code} ")
	public int AgeChange(int user_Age, int user_Code);
	
	@Update(" UPDATE UserAddress SET ua_Post = #{ua_Post}, ua_Addr =#{ua_Addr}, ua_DAddr =#{ua_DAddr}, ua_Lat = #{ua_Lat}, ua_Lng = #{ua_Lng} WHERE ua_UCode = #{ua_UCode} ")
	public int AddrChange(String ua_Post, String ua_Addr, String ua_DAddr, int ua_UCode, double ua_Lat, double ua_Lng);
	
	@Update(" UPDATE USERS SET User_Gender = #{user_Gender} WHERE user_Code = #{user_Code} ")
	public int GenderChange(String user_Gender, int user_Code);
	
	@Select("SELECT * FROM file ORDER BY fi_Code DESC LIMIT 1")
	public List<FileDto> SelectLastFiCode();
	
	@Insert("INSERT INTO FILE VALUES(NULL, 'img', CONCAT('/images/profile/profile_',#{fi_Code},'.',#{ext}))")
	public int ImageFileInsert(int fi_Code, String ext);
	
	@Update("UPDATE USERS SET USER_PRO = #{fi_Code} WHERE USER_CODE = #{ucode}")
	public int UserProChange(int fi_Code, int ucode);
	
	//이용횟수 모든 기간
	@Select("select count(*) as reqCancel from request where req_ucode=#{ucode} and req_stat='취소'")
	public MypageUsageDto reqCancel(int ucode);
	
	@Select("select count(*) as reqFinish from request where req_ucode=#{ucode} and req_stat='완료'")
	public MypageUsageDto reqFinish(int ucode);
	
	@Select("select count(*) as reqTotal from request where req_UCode = #{ucode}")
	public MypageUsageDto reqTotal(int ucode);
	
	@Select("select count(*) as resCancel from result where res_ucode=#{ucode} and res_stat='취소'")
	public MypageUsageDto resCancel(int ucode);
	
	@Select("select count(*) as resFinish from result where res_ucode=#{ucode} and res_stat='완료'")
	public MypageUsageDto resFinish(int ucode);
	
	@Select("select count(*) as resTotal from result where res_ucode=#{ucode}")
	public MypageUsageDto resTotal(int ucode);
	//이용횟수 모든 기간 끝
	
	//이용횟수 3개월 전
	@Select("select count(*) as reqCancel from request where req_ucode=#{ucode} and req_stat='취소' AND (req_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto reqCancel3M(int ucode);
	
	@Select("select count(*) as reqFinish from request where req_ucode=#{ucode} and req_stat='완료' AND (req_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto reqFinish3M(int ucode);
	
	@Select("select count(*) as reqTotal from request where req_UCode = #{ucode} AND (req_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto reqTotal3M(int ucode);
	
	@Select("select count(*) as resCancel from result where res_ucode=#{ucode} and res_stat='취소' AND (res_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto resCancel3M(int ucode);
	
	@Select("select count(*) as resFinish from result where res_ucode=#{ucode} and res_stat='완료' AND (res_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto resFinish3M(int ucode);
	
	@Select("select count(*) as resTotal from result where res_ucode=#{ucode} AND (res_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto resTotal3M(int ucode);
	//이용횟수 3개월 전 끝
	
	@Select("Select * from Confirm where co_UCode = #{ucode}")
	public ConfirmDto SelectMyConfirm(int ucode);
	
	@Update("update FILE set FI_NM = CONCAT('/images/confirm/confirm_',#{ucode},'.',#{ext}) where fi_code=#{fi_code}")
	public int FileUpdate(int ucode, String ext, int fi_code);
	
	@Insert("insert into file values(#{new_fi_Code},'img',concat('/images/confirm/confirm_',#{ucode},'.',#{ext}))")
	public int InsertFileConfirm(int new_fi_Code, int ucode, String ext);
	
	@Insert("insert into confirm values(#{ucode}, #{new_fi_Code}, '미확인', null, null)")
	public int InsertConfirm(int ucode, int new_fi_Code);
	
	@Select("select * from file where fi_code = #{fi_code}")
	public FileDto SelectConfirmFile(int fi_code);
	
	@Select("select * from users where user_Code = #{ucode}")
	public UsersDto SelectMyInfo(int ucode);
	
	@Update("update users set user_Intro = null where user_Code = #{ucode}")
	public int DeleteMyDesc(int ucode);
}
