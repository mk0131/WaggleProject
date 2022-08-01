package com.probee.waggle.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.dto.ConfirmDto2;
import com.probee.waggle.model.mapper.LicenseMapper;

@Service
public class LicenseServiceImpl implements LicenseService{
	
	@Autowired
	LicenseMapper licenseMapper;

	@Override
	public List<ConfirmDto2> selectAll() {
		return licenseMapper.selectAll();
	}

}
