package com.probee.waggle.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.probee.waggle.model.dto.ConfirmDto2;

public interface LicenseService {
	
	public List<ConfirmDto2> selectAll();
	public int permitConfirm(int co_UCode);
	public int rejectConfirm(int co_UCode);
	public int process(String list, HttpServletRequest request);

}
