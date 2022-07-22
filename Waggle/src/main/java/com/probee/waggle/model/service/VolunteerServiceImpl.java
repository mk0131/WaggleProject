package com.probee.waggle.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.VolunteerDto;
import com.probee.waggle.model.mapper.VolunteerMapper;

@Service
public class VolunteerServiceImpl implements VolunteerService{
	
	@Autowired
	VolunteerMapper volunteerMapper;
	
	@Override
	public int Submit(int user_Code, int vo_No) {
		return volunteerMapper.Submit(user_Code, vo_No);
	}

	@Override
	public VolunteerDto SelectOne(int vo_No, int vo_UCode) {
		return volunteerMapper.SelectOne(vo_No, vo_UCode);
	}

	@Override
	public int Cancel(int vo_No, int vo_UCode) {
		return volunteerMapper.Cancel(vo_No, vo_UCode);
	}

	@Override
	public int delete(int vo_No) {
		return volunteerMapper.delete(vo_No);
	}

	@Override
	public int Block(int vo_No, int vo_UCode) {
		return volunteerMapper.Block(vo_No, vo_UCode);
	}

	@Override
	public int ResCancel(int vo_No, int vo_UCode) {
		return volunteerMapper.ResCancel(vo_No, vo_UCode);
	}

	@Override
	public int Revoke(int req_No) {
		return volunteerMapper.Revoke(req_No);
	}

}
