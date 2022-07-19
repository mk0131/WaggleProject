package com.probee.waggle.model.service;

import java.util.List;

import com.probee.waggle.model.dto.MypageFinishlistDto;

public interface MypageService {
	
	public int DescUpdate(String description, int code);
	
	public String SelectDesc(int code);
	
	public List<MypageFinishlistDto> SelectReqRoom(String stat, int ucode);
}
