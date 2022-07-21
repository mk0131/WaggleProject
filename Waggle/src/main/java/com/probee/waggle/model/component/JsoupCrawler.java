package com.probee.waggle.model.component;

import java.io.IOException;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

@Component
public class JsoupCrawler {

	public String GetImgUrl(String url) {
		String page_img = "";
		String selector = "#__next > div.sc-fTACoA.jWnyrV > div > div.sc-gVgoRu.kagfUL > div > div:nth-child(2) > div:nth-child(2) > div > div.css-1dbjc4n.r-150rngu.r-eqz5dr.r-16y2uox.r-1wbh5a2.r-11yh6sk.r-1rnoaur.r-1sncvnh > div > div:nth-child(1) > div > div > div:nth-child(1) > div:nth-child(2) > div > img";
		
		Connection conn = Jsoup.connect(url);
		
		Document doc = null;

		try {
			Document document = conn.get();
			doc = Jsoup.connect(url).timeout(50000).get();
			System.out.println(doc);
			Elements imageUrlElements = document.select(selector);
			page_img = imageUrlElements.attr("src");
			System.out.println(page_img);
			System.out.println("1");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return page_img;
	}
}
