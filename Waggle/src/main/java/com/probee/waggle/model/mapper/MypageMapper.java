package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.ConfirmDto;
import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.dto.MypageOtherDto;
import com.probee.waggle.model.dto.MypageUsageDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

@Mapper
public interface MypageMapper {
	
	//유저정보 가져오기
	@Select( "SELECT * FROM Users LEFT OUTER JOIN Confirm ON Users.user_Code=Confirm.co_UCode WHERE user_Code = #{ucode}")
	public MypageOtherDto SelectUsersInfo(int ucode);
	
	//자기소개 수정
	@Update(" UPDATE Users SET user_Intro = #{description} WHERE user_Code = #{code}")
	public int DescUpdate(String description, int code);
	
	//자기소개 가져오기
	@Select(" SELECT user_Intro FROM Users WHERE user_Code = #{code}")
	public String SelectDesc(int code); 
	
	//완료된 리스트 가져오기
	@Select(" select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm, res_UCode from Request left outer join Home on Request.req_HCode = Home.home_Code left outer join File on Request.req_FCode = File.fi_Code left outer JOIN Result ON Request.req_No = Result.res_No left outer JOIN Users ON Result.res_UCode = Users.user_Code WHERE req_Stat = #{stat} AND res_UCode = #{ucode} ")
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode);
	
	@Select(" SELECT * FROM UserAddress WHERE ua_UCode = #{ua_UCode} ")
	public UserAddressDto SelectAddr(int ua_Ucode);
	
	// 페이징 카운트
	@Select(" select COUNT(*) from Request left outer join Home on Request.req_HCode = Home.home_Code left outer join File on Request.req_FCode = File.fi_Code WHERE req_UCode = #{ucode} ")
	public int historyReqListCnt(int ucode);
	
	@Select(" select COUNT(*) from Request left outer join Home on Request.req_HCode = Home.home_Code left outer join File on Request.req_FCode = File.fi_Code left outer JOIN Result ON Request.req_No = Result.res_No left outer JOIN Users ON Result.res_UCode = Users.user_Code WHERE res_UCode = #{ucode} ")
	public int historyPerListCnt(int ucode);
	
	//이용내역페이지 나의 요청 sql
	@Select("select req_No, req_Title, req_EDate, req_Point, req_Stat, home_Addr, fi_Nm from Request left outer join Home on Request.req_HCode = Home.home_Code left outer join File on Request.req_FCode = File.fi_Code WHERE req_UCode = #{ucode} order by req_No desc LIMIT #{cri.pageStart}, #{cri.perPageNum} ")
	public List<MypageFinishlistDto> SelectMyRequest(int ucode, @Param("cri") Criteria cri);
	
	//이용내역페이지 나의 수행 sql
	@Select("select req_No, req_Title, req_EDate, req_Point, res_Stat, home_Addr, fi_Nm, res_UCode from Request left outer join Home on Request.req_HCode = Home.home_Code left outer join File on Request.req_FCode = File.fi_Code left outer JOIN Result ON Request.req_No = Result.res_No left outer JOIN Users ON Result.res_UCode = Users.user_Code WHERE res_UCode = #{ucode} order by req_No desc LIMIT #{cri.pageStart}, #{cri.perPageNum} ")
	public List<MypageFinishlistDto> SelectMyPerform(int ucode, @Param("cri") Criteria cri);

	@Update(" UPDATE Users SET user_Pw = #{user_Pw} WHERE user_Code = #{user_Code} ")
	public int PwChange(String user_Pw, int user_Code);
	
	@Update(" UPDATE Users SET user_Email = #{user_Email} WHERE user_Code = #{user_Code} ")
	public int EmailChange(String user_Email, int user_Code);
	
	@Update(" UPDATE Users SET user_Nm = #{user_Nm} WHERE user_Code = #{user_Code} ")
	public int NmChange(String user_Nm, int user_Code);
	
	@Update(" UPDATE Users SET user_Age = #{user_Age} WHERE user_Code = #{user_Code} ")
	public int AgeChange(int user_Age, int user_Code);
	
	@Update(" UPDATE UserAddress SET ua_Post = #{ua_Post}, ua_Addr =#{ua_Addr}, ua_DAddr =#{ua_DAddr}, ua_Lat = #{ua_Lat}, ua_Lng = #{ua_Lng} WHERE ua_UCode = #{ua_UCode} ")
	public int AddrChange(String ua_Post, String ua_Addr, String ua_DAddr, int ua_UCode, double ua_Lat, double ua_Lng);
	
	@Update(" UPDATE Users SET user_Gender = #{user_Gender} WHERE user_Code = #{user_Code} ")
	public int GenderChange(String user_Gender, int user_Code);
	
	@Select("SELECT * FROM File ORDER BY fi_Code DESC LIMIT 1")
	public List<FileDto> SelectLastFiCode();
	
	@Insert("INSERT INTO File VALUES(NULL, 'img', CONCAT('/images/proFile/proFile_',#{fi_Code},'.',#{ext}))")
	public int ImageFileInsert(int fi_Code, String ext);
	
	@Update("UPDATE Users SET user_Pro = #{fi_Code} WHERE user_Code = #{ucode}")
	public int UserProChange(int fi_Code, int ucode);
	
	//이용횟수 모든 기간
	@Select("select count(*) as reqCancel from Request where req_UCode=#{ucode} and req_Stat='취소'")
	public MypageUsageDto reqCancel(int ucode);
	
	@Select("select count(*) as reqFinish from Request where req_UCode=#{ucode} and req_Stat='완료'")
	public MypageUsageDto reqFinish(int ucode);
	
	@Select("select count(*) as reqTotal from Request where req_UCode = #{ucode}")
	public MypageUsageDto reqTotal(int ucode);
	
	@Select("select count(*) as resCancel from Result where res_UCode=#{ucode} and res_Stat='취소'")
	public MypageUsageDto resCancel(int ucode);
	
	@Select("select count(*) as resCancelZero from Result where res_UCode=#{ucode} and res_Stat='취소(0)'")
	public MypageUsageDto resCancelZero(int ucode);
	
	@Select("select count(*) as resFinish from Result where res_UCode=#{ucode} and res_Stat='완료'")
	public MypageUsageDto resFinish(int ucode);
	
	@Select("select count(*) as resTotal from Result where res_UCode=#{ucode}")
	public MypageUsageDto resTotal(int ucode);
	//이용횟수 모든 기간 끝
	
	//이용횟수 3개월 전
	@Select("select count(*) as reqCancel from Request where req_UCode=#{ucode} and req_Stat='취소' AND (req_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto reqCancel3M(int ucode);
	
	@Select("select count(*) as reqFinish from Request where req_UCode=#{ucode} and req_Stat='완료' AND (req_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto reqFinish3M(int ucode);
	
	@Select("select count(*) as reqTotal from Request where req_UCode = #{ucode} AND (req_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto reqTotal3M(int ucode);
	
	@Select("select count(*) as resCancel from Result where res_UCode=#{ucode} and res_Stat='취소' AND (res_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto resCancel3M(int ucode);
	
	@Select("select count(*) as resCancelZero from Result where res_UCode=#{ucode} and res_Stat='취소(0)' AND (res_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto resCancelZero3M(int ucode);
	
	@Select("select count(*) as resFinish from Result where res_UCode=#{ucode} and res_Stat='완료' AND (res_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto resFinish3M(int ucode);
	
	@Select("select count(*) as resTotal from Result where res_UCode=#{ucode} AND (res_WDate BETWEEN DATE_ADD(NOW(), INTERVAL -3 MONTH) AND NOW())")
	public MypageUsageDto resTotal3M(int ucode);
	//이용횟수 3개월 전 끝
	
	@Select("Select * from Confirm where co_UCode = #{ucode}")
	public ConfirmDto SelectMyConfirm(int ucode);
	
	@Update("update File set fi_Nm = CONCAT('/images/Confirm/Confirm_',#{ucode},'.',#{ext}) where fi_Code=#{fi_Code}")
	public int FileUpdate(int ucode, String ext, int fi_Code);
	
	@Insert("insert into File values(#{new_fi_Code},'img',concat('/images/Confirm/Confirm_',#{ucode},'.',#{ext}))")
	public int InsertFileConfirm(int new_fi_Code, int ucode, String ext);
	
	@Insert("insert into Confirm values(#{ucode}, #{new_fi_Code}, '미확인', null, null)")
	public int InsertConfirm(int ucode, int new_fi_Code);
	
	@Select("select * from File where fi_Code = #{fi_Code}")
	public FileDto SelectConfirmFile(int fi_Code);
	
	@Select("select * from Users where user_Code = #{ucode}")
	public UsersDto SelectMyInfo(int ucode);
	
	@Update("update Users set user_Intro = null where user_Code = #{ucode}")
	public int DeleteMyDesc(int ucode);
}
