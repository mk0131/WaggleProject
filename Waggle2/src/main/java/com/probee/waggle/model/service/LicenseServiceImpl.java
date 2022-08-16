package com.probee.waggle.model.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.probee.waggle.model.component.FileSaver;
import com.probee.waggle.model.component.OCR;
import com.probee.waggle.model.dto.ConfirmDto2;
import com.probee.waggle.model.mapper.LicenseMapper;

@Service
public class LicenseServiceImpl implements LicenseService{
	
	@Autowired
	LicenseMapper licenseMapper;
	
	@Autowired
	OCR ocr;
	
	@Autowired
	FileSaver fileSavaer;

	@Override
	public List<ConfirmDto2> selectAll() {
		return licenseMapper.selectAll();
	}

	@Override
	public int permitConfirm(int co_UCode) {
		return licenseMapper.permitConfirm(co_UCode);
	}

	@Override
	public int rejectConfirm(int co_UCode) {
		return licenseMapper.rejectConfirm(co_UCode);
	}

	@Override
	public int process(String list, HttpServletRequest request) {
		List<String> name_list = new ArrayList<String>();
		List<String> numb_list = new ArrayList<String>();
		
		String[] code_arr = list.split(",");
		for(String val: code_arr) {
			ConfirmDto2 tmp_dto = new ConfirmDto2();
			ConfirmDto2 conf_dto = licenseMapper.selectConfirm(Integer.parseInt(val));
			String fi_nm = conf_dto.getFi_Nm();
			try {
				// 각 사용자 코드에 대해 이미지 OCR 진행(이름, 자격증번호 받아옴)
				tmp_dto = ocr.imgToString(fi_nm);
			} catch (IOException | ParseException e) {
				e.printStackTrace();
				System.out.println("OCR 실패");
				return 0;
			}
			String name = tmp_dto.getCo_Nm();
			String numb = tmp_dto.getCo_No();
			conf_dto.setCo_Nm(name);
			conf_dto.setCo_No(numb);
			// Confirm DB 처리중으로 업데이트
			licenseMapper.updateConfirm(conf_dto);
			
			name_list.add(name);
			numb_list.add(numb);
		}
		
		// CSV 파일 생성
		try {
			fileSavaer.makeCSV(name_list, numb_list, request);
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("파일저장실패");
			return 0;
		}
		
		return 1;
	}

}
