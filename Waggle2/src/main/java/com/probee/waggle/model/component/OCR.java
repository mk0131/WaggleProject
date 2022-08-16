package com.probee.waggle.model.component;

import java.io.IOException;
import java.nio.file.Path;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

import com.probee.waggle.model.dto.ConfirmDto2;

@Component
public class OCR {
	
	@Autowired
	OCRGeneralAPIDemo ocrGeneral;
	
	@Autowired
	ResourceLoader resourceLoader;
	
	public ConfirmDto2 imgToString(String fi_Nm) throws IOException, ParseException {
		String path = Path.of(resourceLoader.getResource("classpath:static").getURI()).toString().replace("\\", "/");
		String jsonStr = ocrGeneral.doOCR(path + fi_Nm);
		String longStr = jsonToString(jsonStr);
		// 자격증번호, 이름
		String numb = longStr.substring(longStr.indexOf("호")+1, longStr.indexOf("공"));
		String name = longStr.substring(longStr.indexOf("명")+1, longStr.indexOf("생년월일"));
		// dto 작성 및 리턴
		ConfirmDto2 tmp = new ConfirmDto2();
		tmp.setCo_Nm(name);
		tmp.setCo_No(numb);
		return tmp;
	}
	
	public String jsonToString(String jsonStr) throws ParseException {
		String res = "";
		
		JSONParser parser = new JSONParser();
		JSONObject jsonObj = (JSONObject)parser.parse(jsonStr);
		JSONArray imageArr = (JSONArray)jsonObj.get("images");
		JSONObject jsonObj2 = (JSONObject)imageArr.get(0);
		JSONArray fieldsArr = (JSONArray)jsonObj2.get("fields");
		
		for(int i=0; i<fieldsArr.size(); i++) {
			JSONObject tmp = (JSONObject)fieldsArr.get(i);
			String tmpStr = (String)tmp.get("inferText");
			res += tmpStr;
		}
		res = res.replaceAll(" ", "").replaceAll(":", "").replaceAll("-", "");
		return res;
	}

}
