package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.InquiryDto;

public interface InquiryService {

	public List<InquiryDto> selectList();
	public List<InquiryDto> selectuserList();
	public InquiryDto selectOne(int in_Code);
	public int insert(InquiryDto dto);
	public int update(InquiryDto dto);
	public int delete(int in_Code);
	
}
