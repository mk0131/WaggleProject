package com.probee.waggle.model.service;

import com.probee.waggle.model.dto.UsersDto;

public interface LoginService {
	
	public UsersDto UserLogin(UsersDto dto);
	
	public UsersDto Naver(UsersDto dto);
	
	public int NaverRegist(UsersDto dto);
	
	public int KakaoRegist(UsersDto dto);

}
