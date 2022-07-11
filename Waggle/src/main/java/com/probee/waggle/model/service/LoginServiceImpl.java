package com.probee.waggle.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.mapper.LoginMapper;
@Service
public class LoginServiceImpl  implements LoginService{
	
	@Autowired
	LoginMapper loginMapper;

	@Override
	public UsersDto UserLogin(UsersDto dto) {
		return loginMapper.UserLogin(dto);
	}

}
