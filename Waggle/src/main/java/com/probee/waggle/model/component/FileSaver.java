package com.probee.waggle.model.component;

import java.awt.image.BufferedImage;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
	
	
	public List<String> saveLocal(List<MultipartFile> files, int req_No, HttpServletRequest request) throws IOException {
		// 파일 각각 저장하고 path list를 리턴
		List<String> answer = new ArrayList<String>();
		
		
		int cnt = 1;
		
		String staticpath1 = Path.of(resourceLoader.getResource("classpath:static").getURI()).toString().replace("\\", "/");
		String staticpath2 = request.getSession().getServletContext().getRealPath("/").replace("\\", "/");

		staticpath2 = staticpath2.substring(0, staticpath2.lastIndexOf("/"));
		staticpath2 = staticpath2.substring(0, staticpath2.lastIndexOf("/"));
		staticpath2 += "/resources/static";

		for (MultipartFile file: files) {

			String fileName = file.getOriginalFilename();
			// 파일 경로생성
			int pos = fileName.lastIndexOf(".");
			String ext = fileName.substring(pos + 1);
			String path = "/images/result/result"+req_No+"_"+cnt+"."+ext;
			// 파일 생성
			File realFile2 = new File(staticpath2 + path);

			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!realFile2.exists()) {
				realFile2.createNewFile();
			} 
			file.transferTo(realFile2);
			
			// target 위치에 파일 복사
			File realFile1 = new File(staticpath1 + path);

			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!realFile1.exists()) {
				realFile1.createNewFile();
			}
			
			FileCopyUtils.copy(realFile2, realFile1);
			
			// 성공하면 경로명 저장
			answer.add(path);
			
			cnt += 1;
		}
		
		
		return answer;
	}
	
	public String saveLocalProfile(MultipartFile file, int new_Fi_Code, HttpServletRequest request) throws IOException {
		// 파일 각각 저장하고 path list를 리턴
		String answer;
		
		String staticpath1 = Path.of(resourceLoader.getResource("classpath:static").getURI()).toString().replace("\\", "/");
		String staticpath2 = request.getSession().getServletContext().getRealPath("/").replace("\\", "/");

		staticpath2 = staticpath2.substring(0, staticpath2.lastIndexOf("/"));
		staticpath2 = staticpath2.substring(0, staticpath2.lastIndexOf("/"));
		staticpath2 += "/resources/static";


			String fileName = file.getOriginalFilename();
			// 파일 경로생성
			int pos = fileName.lastIndexOf(".");
			String ext = fileName.substring(pos + 1);
			String path = "/images/profile/profile_"+new_Fi_Code+"."+ext;
			// 파일 생성
			File realFile2 = new File(staticpath2 + path);

			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!realFile2.exists()) {
				realFile2.createNewFile();
			} 
			file.transferTo(realFile2);
			
			// target 위치에 파일 복사
			File realFile1 = new File(staticpath1 + path);

			// 경로가 있는지 확인해서 없으면 경로 생성
			if(!realFile1.exists()) {
				realFile1.createNewFile();
			}
			
			FileCopyUtils.copy(realFile2, realFile1);
			
			// 성공하면 경로명 저장
			answer = path;
			
		
		
		return answer;
	}
	
	public String saveLocalConfirm(MultipartFile file, int user_Code, HttpServletRequest request) throws IOException {
		// 파일 각각 저장하고 path list를 리턴
		String answer;
		
		String staticpath1 = Path.of(resourceLoader.getResource("classpath:static").getURI()).toString().replace("\\", "/");
		String staticpath2 = request.getSession().getServletContext().getRealPath("/").replace("\\", "/");

		staticpath2 = staticpath2.substring(0, staticpath2.lastIndexOf("/"));
		staticpath2 = staticpath2.substring(0, staticpath2.lastIndexOf("/"));
		staticpath2 += "/resources/static";


			String fileName = file.getOriginalFilename();
			// 파일 경로생성
			int pos = fileName.lastIndexOf(".");
			String ext = fileName.substring(pos + 1);
			String path = "/images/confirm/confirm_"+user_Code+"."+ext;
			// 파일 생성
			File realFile2 = new File(staticpath2 + path);

			// 경로 있으면 삭제하고 생성, 없으면 생성
			if(realFile2.exists()) {
				realFile2.delete();
				realFile2.createNewFile();
			} else {
				realFile2.createNewFile();
			}
			
			//파일을 경로에 저장시킴.
			file.transferTo(realFile2);
			
			// target 위치에 파일 복사
			File realFile1 = new File(staticpath1 + path);

			// 경로가 있는지 확인해서 없으면 경로 생성
			if(realFile1.exists()) {
				realFile1.delete();
				realFile1.createNewFile();
			}else {
				realFile1.createNewFile();
			}
			
			FileCopyUtils.copy(realFile2, realFile1);
			
			// 성공하면 경로명 저장
			answer = path;
			
		
		
		return answer;
	}
	
	public int makeCSV(List<String> name_list, List<String> numb_list, HttpServletRequest request) throws IOException {
		BufferedWriter bw = null;
		String NEWLINE = System.lineSeparator();
		
		// 이름, 공인중개사 번호 CSV 파일 생성
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyMMddHHmm");        
		String formatedNow = now.format(formatter);
		
		String path = request.getSession().getServletContext().getRealPath("/").replace("\\", "/");
		path = path.substring(0, path.lastIndexOf("/"));
		path = path.substring(0, path.lastIndexOf("/"));
		path += "/resources/static";
		
		String file_name = "/csv/진위확인신청서_"+formatedNow+".csv";
		
		File file = new File(path + file_name);
		// 경로가 있는지 확인해서 없으면 경로 생성
		if(!file.exists()) {
			file.createNewFile();
		}
		
		bw = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "MS949"));
		
		bw.write("성명,자격증번호");
		bw.write(NEWLINE);
		
		for(int i=0; i<name_list.size(); i++) {
			bw.write(name_list.get(i) + "," + numb_list.get(i));
			bw.write(NEWLINE);
		}
		
		bw.flush();
		bw.close();
		
		return 1;
	}
	
}
