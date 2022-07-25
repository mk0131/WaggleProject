package com.probee.waggle.model.service;

import com.probee.waggle.model.dto.VolunteerDto;

public interface VolunteerService {
	
	public int Submit(int user_Code, int vo_No);
	
	VolunteerDto SelectOne(int vo_No, int vo_UCode);
	
	public int Cancel(int vo_No, int vo_UCode);
	
	public int delete(int vo_No);
	
	public int Block(int vo_No, int vo_UCode);
	
	public int ResCancel(int vo_No, int vo_UCode);
	
	public int Revoke(int req_No);

}
