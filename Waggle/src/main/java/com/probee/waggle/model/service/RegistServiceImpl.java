package com.probee.waggle.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;
import com.probee.waggle.model.mapper.RegistMapper;

@Service
public class RegistServiceImpl implements RegistService{
	
	@Autowired
	RegistMapper registMapper;
	@Override
	public int idChk(String user_Id) {
		return registMapper.idChk(user_Id);
	}
	@Override
	public int nmChk(String user_Nm) {
		return registMapper.nmChk(user_Nm);
	}
	@Override
	public int EmailChk(String user_Email) {
		return registMapper.emailChk(user_Email);
	}
	@Override
	public int Join(UsersDto dto) {
		return registMapper.Join(dto);
	}
	@Override
	public UsersDto SelectOne(String user_Id) {
		return registMapper.SelectOne(user_Id);
	}
	@Override
	public int AddressJoin(UserAddressDto dto) {
		return registMapper.AdressJoin(dto);
	}

}
