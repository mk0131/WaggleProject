package com.probee.waggle.model.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.InquiryDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.mapper.InquiryMapper;

@Service
public class InquiryServiceImpl implements InquiryService {
	
	@Autowired
	private InquiryMapper inquiryMapper;
	
	@Override
	public List<InquiryDto> selectList(int user_Code, Criteria cri) {
		return inquiryMapper.selectList(user_Code, cri);
	}
	
	@Override
	public int inquiryListCnt(int user_Code) {
		return inquiryMapper.inquiryListCnt(user_Code);
	}
	
	@Override
	public UsersDto selectuser(int user_Code) {
		return inquiryMapper.selectUser(user_Code);
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

	@Override
	public List<InquiryDto> adminList(String user_Nm, Criteria cri) {
		return inquiryMapper.adminList(user_Nm, cri);
	}

	@Override
	public int inquiryallListCnt(String user_Nm) {
		return inquiryMapper.inquiryallListCnt(user_Nm);
	}

	@Override
	public int updateOriginNo(InquiryDto dto) {
		return inquiryMapper.updateOriginNo(dto);
		
	}

	@Override
	public int admininsert(InquiryDto dto) {
		return inquiryMapper.adminInsert(dto);
	}

	@Override
	public int inquiryListStat() {
		return inquiryMapper.inquiryListStat();
	}


}
