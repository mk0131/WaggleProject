package com.probee.waggle.model.service;

import com.probee.waggle.model.dto.UserAddressDto;
import com.probee.waggle.model.dto.UsersDto;

public interface RegistService {
	public int idChk(String user_Id);
	
	public int nmChk(String user_Nm);
	
	public int EmailChk(String user_Email);
	
	public int Join(UsersDto dto);
	
	public UsersDto SelectOne(String user_Id);
	
	public int AddressJoin(UserAddressDto dto);
}
