package com.probee.waggle.model.component;

import org.openqa.selenium.By;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Component;

import io.github.bonigarcia.wdm.WebDriverManager;

@Component
public class SeleniumCrawler {
	
	public void chromeSession() {
        WebDriverManager.chromedriver().setup();
    }
	
	public String GetImgUrl(String url) {
		// 직방 크롤링만 가능
		if(!url.contains("www.zigbang.com")) {
			return null;
		}
		if(!url.contains("https://")) {
			url = "https://" + url;
		}
		
		String page_img = "";
		
		// WebDriver 옵션 설정
		ChromeOptions options = new ChromeOptions();
		options.addArguments("--disable-default-apps");
		// 창 숨기는 옵션 추가
		options.addArguments("--headless");
		
		// 크롬드라이버 열기
		ChromeDriver driver = null; 
		try {
			driver = new ChromeDriver(options);
		} catch (Exception e) {
			chromeSession();
			driver = new ChromeDriver(options);
		}
		
		try {
			driver.get(url);
			Thread.sleep(1000);
			page_img = driver.findElement(By.xpath("//*[@id=\"__next\"]/div[2]/div/div[2]/div/div/div/div/div/div/div/div/div/div/div[2]/div/img")).getAttribute("src");
		} catch (InterruptedException e1) {
			e1.printStackTrace();
		} finally {
			driver.quit();
		}
		
		return page_img;
	}
	

}
