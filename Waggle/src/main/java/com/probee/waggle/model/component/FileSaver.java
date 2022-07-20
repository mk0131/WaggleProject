package com.probee.waggle.model.component;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Path;

import javax.imageio.ImageIO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;

@Component
public class FileSaver {
	
	@Autowired
	ResourceLoader resourceLoader;

	public int saveCrawlImg(String IMAGE_URL, String path) {
		int res = 0;
		
		try {
			URL url = new URL(IMAGE_URL);
//			String extension = IMAGE_URL.substring(IMAGE_URL.indexOf('.') + 1);
			
			BufferedImage image = ImageIO.read(url);
			
			String staticpath = Path.of(resourceLoader.getResource("classpath:static").getURI()).toString().replace("\\", "/");
			String new_path = staticpath + path;
			
//			System.out.println("IMAGE_URL :" + IMAGE_URL);
//			System.out.println(extension);
//			System.out.println("[staticpath] : " + staticpath);
//			System.out.println("[path] : " + path);
//			System.out.println("[new_path] : " + new_path);
			
			File file = new File(new_path);
			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!file.exists()) {
				file.createNewFile();
			}
			
			ImageIO.write(image, "jpg", file);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
		
		return res;
	}
	
}
