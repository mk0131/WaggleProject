package com.probee.waggle.model.service;

import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

public interface RegistService {
	public int idChk(String user_Id);
	
	public int nmChk(String user_Nm);
	
	public int EmailChk(String user_Email);
	
	public int Join(UsersDto dto);
	
	public UsersDto SelectOne(String user_Email);
	
	public int AddressJoin(UserAddressDto dto);
	
	public UsersDto naverChk(String user_Email);
	
	public UsersDto kakaoChk(String user_Email);
}
