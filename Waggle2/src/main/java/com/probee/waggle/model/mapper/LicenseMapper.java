package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.probee.waggle.model.dto.ConfirmDto2;

@Mapper
public interface LicenseMapper {

	@Select(" select * from Confirm c left outer join File f on c.co_FCode = f.fi_Code ")
	public List<ConfirmDto2> selectAll();
	
	@Update(" update Confirm set co_Confirm='확인' where co_UCode=#{co_UCode} ")
	public int permitConfirm(int co_UCode);
	
	@Update(" update Confirm set co_Confirm='반려' where co_UCode=#{co_UCode} ")
	public int rejectConfirm(int co_UCode);
	
	@Select(" select * from Confirm c left outer join File f on c.co_FCode = f.fi_Code where co_UCode=#{co_UCode} ")
	public ConfirmDto2 selectConfirm(int co_UCode);
	
	@Update(" update Confirm set co_Nm=#{co_Nm}, co_No=#{co_No}, co_Confirm='처리중' where co_UCode=#{co_UCode} ")
	public int updateConfirm(ConfirmDto2 dto);
}
