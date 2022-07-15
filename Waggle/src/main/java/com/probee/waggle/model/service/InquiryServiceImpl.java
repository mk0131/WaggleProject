package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.InquiryDto;
import com.probee.waggle.model.mapper.InquiryMapper;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryMapper inquiryMapper;
	
	@Override
	public List<InquiryDto> selectList() {
		return inquiryMapper.selectList();
	}
	
	@Override
	public List<InquiryDto> selectuserList() {
		return inquiryMapper.selectuserList();
	}
	
	@Override
	public InquiryDto selectOne(int in_Code) {
		return inquiryMapper.selectOne(in_Code);
	}

	@Override
	public int insert(InquiryDto dto) {
		return inquiryMapper.insert(dto);
	}

	@Override
	public int update(InquiryDto dto) {
		return inquiryMapper.update(dto);
	}

	@Override
	public int delete(int in_Code) {
		return inquiryMapper.delete(in_Code);
	}

}
