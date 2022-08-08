package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.PointsDto;
import com.probee.waggle.model.dto.RequestDto2;
import com.probee.waggle.model.dto.ResultDto;
import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UserRatingDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.dto.UsersDto2;

@Mapper
public interface BoardMapper {
	
	// 전체 request 가져오기
	@Select(" select req_No,req_Title,req_Link, req_WDate,date_format(req_EDate,'%Y-%m-%d') req_EDate,req_Phone,req_Detail,req_Point,req_Stat,req_UCode,req_FCode,req_HCode,fi_Nm,home_Addr,home_DAddr,home_Lat,home_Lng "
			+ "from request r left outer join file f on r.req_FCode = f.fi_Code left outer join home h on r.req_HCode = h.home_Code "
			+ "order by req_No desc LIMIT #{pageStart}, #{perPageNum} ")
	public List<RequestDto2> selectList(Criteria cri);
	
	// 글번호로 request 모든 정보 불러오기
	@Select(" select req_No,req_Title,req_Link, req_WDate,date_format(req_EDate,'%Y-%m-%d') req_EDate,req_Phone,req_Detail,req_Point,req_Stat,req_UCode,req_FCode,req_HCode,fi_Nm,home_Addr,home_DAddr,home_Lat,home_Lng "
			+ "from request r left outer join file f on r.req_FCode = f.fi_Code left outer join home h on r.req_HCode = h.home_Code "
			+ "where req_No=#{req_No} ")
	public RequestDto2 selectRequest(int req_No);
	
	// 글번호로 요청글에 등록된 파일코드 업데이트 하기
	@Update(" update request set req_FCode=#{req_FCode} where req_No=#{req_No} ")
	public int updateFCode(int req_No, int req_FCode);
	
	// 요청글 등록하기
	@Insert(" INSERT INTO Request values (null,#{req_Title},#{req_Link},NOW(),#{req_EDate},#{req_Phone},#{req_Detail},#{req_Point},'모집중',#{req_UCode},null,#{req_HCode}) ")
	public int insertRequest(RequestDto2 dto);
	
	// 글번호로 취소상태가 아닌 result 가져오기(진행중과 완료는 둘중 하나만 존재)
	@Select(" select * from Result where res_No=#{req_No} and res_Stat in ('진행중','확인중','완료') ")
	public ResultDto selectResult(int req_No);
	
	@Select(" select user_Code, user_Pro, user_Grade, user_Intro, user_Nm, fi_Nm from Users u inner join volunteer v on u.user_Code = v.vo_Ucode left outer join File f on u.user_Pro=f.fi_Code where v.vo_No = #{vo_No} and v.vo_Block = false")
	public List<UsersDto2> FindVol(int vo_No);
	
	// 유저정보 가져오기
	@Select(" select * from Users where user_Code = #{user_Code} ")
	public UsersDto selectUser(int user_Code);
	
	// 글번호로 UserRating 가져오기
	@Select(" select * from UserRating where ur_Code = #{req_No} ")
	public List<UserRatingDto> selectUserRating(int req_No);
	
	// 탐색결과 코드로 File에서 기록된 파일경로 모두 가져오기
	@Select(" select fi_Code ,fi_Type, fi_Nm from Result r left outer join ResultFile rf on r.res_Code = rf.rf_RCode left outer join File fi on rf.rf_FCode = fi.fi_Code where res_Code=#{res_Code} ")
	public List<FileDto> selectResultFile(int res_Code);
	
	@Insert(" insert into Result (res_Code, res_No, res_UCode, res_Stat , res_WDate ) values (null, #{res_No}, #{res_UCode}, '진행중', now()) ")
	int CreateRes(int res_No, int res_UCode);
	
	@Update(" update Request set req_Stat = '진행중' where req_No = #{req_No} ")
	int Progress(int req_No);

	@Update(" update Request set req_Stat = '모집중' where req_No = #{req_No} ")
	int Recruit(int req_No);
	
	@Update(" update Request set req_Stat = '취소' where req_No = #{req_No} ")
	int Revoke(int req_No);
	
	@Delete(" delete from request where req_No = #{req_No} ")
	int Cancel(int req_No);
	
	@Update(" update Request set req_Stat = '완료' where req_No = #{req_No} ")
	int complete(int req_No);
	
	@Update(" update Request set req_Stat = '확인중' where req_No = #{req_No} ")
	public int confirm(int req_No);

	@Update(" update Request set req_Title=#{req_Title}, req_Link=#{req_Link}, req_EDate=#{req_EDate}, req_Phone=#{req_Phone}, req_Detail=#{req_Detail}, req_Point=#{req_Point}, req_HCode=#{req_HCode} where req_No=#{req_No} ")
	public int updateRequest(RequestDto2 dto);
	
	@Select(" select max(req_No) from request r ")
	public int selectLastRequestNo();
	
	// 꿀벌 평가 DB 삽입
	@Insert(" insert into UserRating values (#{ur_Code}, #{ur_Rate}, #{ur_Attr1}, #{ur_Attr2}, #{ur_Attr3}, 'false') ")
	public int insertRatingBee(UserRatingDto userRating_dto);
	
	// 꿀벌 재평가 DB 삽입
	@Insert(" insert into UserRating values (#{ur_Code}, #{ur_Rate}, #{ur_Attr1}, #{ur_Attr2}, #{ur_Attr3}, 'true') ")
	public int insertReRatingBee(UserRatingDto userRating_dto);
	
	// 포인트 사용여부 검사
	@Select(" select * from points p where po_No = #{req_No} and po_UCode = #{user_Code} ")
	List<PointsDto> selectPoint(int req_No, int user_Code);
	
	// result 업데이트(확인중)
	@Update(" update Result set "
			+ "res_Attr1=#{res_Attr1}, res_Attr2=#{res_Attr2}, res_Attr3=#{res_Attr3}, "
			+ "res_Attr4=#{res_Attr4}, res_Attr5=#{res_Attr5}, res_Attr6=#{res_Attr6}, "
			+ "res_Detail=#{res_Detail}, res_Rate=#{res_Rate}, res_WDate=NOW(), res_Stat='확인중' "
			+ "where res_Code=#{res_Code} ")
	public int updateResult(ResultDto dto);

	@Select(" select count(*) from request order by req_No desc ")
	public int boardListCnt();
	
	// 유저코드로 사용자 주소 가져오기
	@Select(" SELECT * FROM USERADDRESS WHERE ua_UCode = #{ua_UCode} ")
	public UserAddressDto selectUserAddr(int ua_Ucode);
	
	// 요청글 완료 전환시 Result DB 시간 업데이트
	@Update(" update Result set res_Stat='완료', res_WDate=NOW() where res_Code=#{res_Code} ")
	public int updateResultWDate(int res_Code);
	
	// 유저코드로 사용자 꿀 수확량 수정
	@Update(" update Users set user_Grade=#{user_Grade} where user_Code=#{user_Code} ")
	public int updateUserGrade(int user_Code, int user_Grade);
	
}
