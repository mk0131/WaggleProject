package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.MypageFinishlistDto;
import com.probee.waggle.model.mapper.MypageMapper;

@Service
public class MypageServiceImpl implements MypageService{

	@Autowired
	MypageMapper mypageMapper;
	
	@Override
	public int DescUpdate(String description, int code) {
		return mypageMapper.DescUpdate(description, code);
	}

	@Override
	public String SelectDesc(int code) {
		return mypageMapper.SelectDesc(code);
	}

	@Override
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode) {
		return mypageMapper.SelectReqRoom(stat, ucode);
	}

	@Override
	public List<MypageFinishlistDto> SelectMyRequest(int ucode) {
		return mypageMapper.SelectMyRequest(ucode);
	}

	@Override
	public List<MypageFinishlistDto> SelectMyPerform(int ucode) {
		return mypageMapper.SelectMyPerform(ucode);
	}
	
	

}
