package com.probee.waggle.model.component;

import java.awt.image.BufferedImage;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URL;
import java.nio.file.Path;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSaver {
	
	@Autowired
	ResourceLoader resourceLoader;

	public int saveCrawlImg(String IMAGE_URL, String path) {
		int res = 0;
		
		try {
			URL url = new URL(IMAGE_URL);
			
			BufferedImage image = ImageIO.read(url);
			
			String staticpath = "./src/main/resources/static";
			String new_path = staticpath + path;
			
			File file = new File(new_path);
			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!file.exists()) {
				file.createNewFile();
			}
			
			ImageIO.write(image, "jpg", file);
			
			BufferedImage image2 = ImageIO.read(url);
			
			String staticpath2 = Path.of(resourceLoader.getResource("classpath:static").getURI()).toString().replace("\\", "/");
			String new_path2 = staticpath2 + path;
			
			File file2 = new File(new_path2);
			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!file2.exists()) {
				file2.createNewFile();
			}
					
			ImageIO.write(image2, "jpg", file2);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
		
		return res;
	}
	
	public int saveProfileImg(String IMAGE_URL, String path) {
		int res = 0;
		
		try {
			FileInputStream f_stream = new FileInputStream(IMAGE_URL);
			BufferedImage image = ImageIO.read(new DataInputStream(f_stream));
			
			String staticpath = "./src/main/resources/static";
			String new_path = staticpath + path;
			
			File file = new File(new_path);
			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!file.exists()) {
				file.createNewFile();
			}
			
			ImageIO.write(image, "jpg", file);
			
			BufferedImage image2 = ImageIO.read(new DataInputStream(f_stream));
			
			String staticpath2 = Path.of(resourceLoader.getResource("classpath:static").getURI()).toString().replace("\\", "/");
			String new_path2 = staticpath2 + path;
			
			File file2 = new File(new_path2);
			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!file2.exists()) {
				file2.createNewFile();
			}
					
			ImageIO.write(image2, "jpg", file2);
			res = 1;
		} catch (IOException e) {
			e.printStackTrace();
			return 0;
		}
		
		return res;
	}
	
	public List<String> saveLocal(List<MultipartFile> files, int req_No, HttpServletRequest request) throws IOException {
		// 파일 각각 저장하고 path list를 리턴
		List<String> answer = new ArrayList<String>();
		
		int cnt = 1;
		// String staticpath = "./src/main/resources/static";
		String path = null;
		String staticpath2 = request.getSession().getServletContext().getRealPath("/");
//		System.out.println(staticpath2.lastIndexOf("\\"));
//		System.out.println(staticpath2);
		staticpath2 = staticpath2.substring(0, staticpath2.lastIndexOf("\\"));
		staticpath2 = staticpath2.substring(0, staticpath2.lastIndexOf("\\"));
		staticpath2 += "\\resources\\static";
//		System.out.println(staticpath2);
		for (MultipartFile file: files) {

			String fileName = file.getOriginalFilename();
//			System.out.println("fileName : " + fileName);
			int pos = fileName.lastIndexOf(".");
			String ext = fileName.substring(pos + 1);
//			System.out.println("ext : " + ext);
			path = "\\images\\result\\result"+req_No+"_"+cnt+"."+ext;
//			System.out.println(staticpath2 + path);
			File realFile = new File(staticpath2 + path);
			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!realFile.exists()) {
				realFile.createNewFile();
			} 
			file.transferTo(realFile);
			
			// 성공하면 경로명 저장
			answer.add(path);
			
			cnt += 1;
		}
		
		return answer;
	}
	
}
