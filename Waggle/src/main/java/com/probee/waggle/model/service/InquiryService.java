package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.InquiryDto;
import com.probee.waggle.model.dto.UsersDto;

public interface InquiryService {

	public List<InquiryDto> selectList(int user_Code, Criteria cri);
	public List<InquiryDto> adminList(String user_Nm, Criteria cri);
	public UsersDto selectuser(int user_Code);
	public InquiryDto selectOne(int in_Code);
	public int insert(InquiryDto dto);
	public int update(InquiryDto dto);
	public int delete(int in_Code);
	public int inquiryListCnt(int user_Code);
	public int inquiryallListCnt(String user_Nm);
	public int updateOriginNo(InquiryDto dto);
	public int admininsert(InquiryDto dto);
	public int inquiryListStat();
	
}
