package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.MapDto;
import com.probee.waggle.model.dto.MapUserInfoDto;

@Mapper
public interface MapMapper {

	@Select("select user_Code, ua_addr, fi_Nm from userAddress left outer join users on user_Code = ua_ucode left outer join file on user_Pro = fi_code")
	public List<MapUserInfoDto> selectUserAddress();
	
	@Select("select home_Post, home_Addr, home_DAddr, req_No, fi_Nm, res_WDate, res_UCode, po_UCode from RESULTFILE join result on RESULTFILE.RF_RCODE = result.RES_CODE join FILE on RESULTFILE.rf_FCode = FILE.fi_Code join REQUEST on RESULT.RES_NO = REQUEST.REQ_NO join HOME on REQUEST.REQ_HCODE = HOME.home_Code left outer join points on request.req_No = points.po_No where (home_Addr = #{jibunAddr} OR home_Addr = #{roadAddr}) and res_Stat = '완료' ")
	public List<MapDto> selectSearchList(String jibunAddr, String roadAddr);
	
	@Select("select home_Post, home_Addr, home_DAddr, req_No, fi_Nm, res_WDate, res_UCode, po_UCode from RESULTFILE join result on RESULTFILE.RF_RCODE = result.RES_CODE join FILE on RESULTFILE.rf_FCode = FILE.fi_Code join REQUEST on RESULT.RES_NO = REQUEST.REQ_NO join HOME on REQUEST.REQ_HCODE = HOME.home_Code left outer join points on request.req_No = points.po_No  where (home_Addr = #{jibunAddr} OR home_Addr = #{roadAddr}) and home_DAddr = #{DAddr} and res_Stat='완료'")
	public List<MapDto> selectClickList(String jibunAddr, String roadAddr, String DAddr);
	
	
}
