package com.probee.waggle.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.probee.waggle.model.dto.FileDto;
import com.probee.waggle.model.dto.ResultFileDto;

@Mapper
public interface FileMapper {

	@Insert(" INSERT INTO File values (null, #{fi_Type}, #{fi_Nm}) ")
	public int insertFile(FileDto dto);
	
	@Select(" SELECT * FROM File WHERE fi_Nm = #{fi_Nm} ")
	public List<FileDto> selectFile(String fi_Nm);
	
	// resultFile 데이터 추가
	@Insert(" INSERT INTO ResultFile values (#{rf_FCode}, #{rf_RCode}) ")
	public int insertResultFile(ResultFileDto dto);
	
	// resultFile 데이터 삭제
	@Delete(" DELETE FROM ResultFile where rf_RCode=#{rf_RCode} ")
	public int deleteResultFile(int rf_RCode);
	
}
