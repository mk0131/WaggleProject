package com.probee.waggle.model.service;

import com.probee.waggle.model.dto.VolunteerDto;

public interface VolunteerService {
	
	public int Submit(int user_Code, int vo_No);
	
	VolunteerDto SelectOne(int vo_No, int vo_UCode);
	
	public int Cancel(int vo_No, int vo_UCode);

}
