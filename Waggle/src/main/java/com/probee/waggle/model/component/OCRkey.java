package com.probee.waggle.model.component;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class OCRkey {
	
	@Value("${secretkey}")
	private String secretkey;
	
	@Value("${invokeURL}")
	private String invokeURL;

	public OCRkey() {
		super();
	}

	public String getSecretkey() {
		return secretkey;
	}

	public String getInvokeURL() {
		return invokeURL;
	}
	
	
	
}
