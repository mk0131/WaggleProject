package com.probee.waggle.model.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.Paging;
import com.probee.waggle.model.dto.PayDto;
import com.probee.waggle.model.dto.PointsDto;
import com.probee.waggle.model.dto.PointsDto2;
import com.probee.waggle.model.service.BoardService;
import com.probee.waggle.model.service.PointService;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	PointService pointService;
	
	@Autowired
	private BoardService boardService;
	
	@GetMapping("/use")
	public String PointUse(Model model, HttpSession session, Criteria cri){
		int ucode = (int)session.getAttribute("user_Code");
		
		List<PointsDto> list1 = pointService.selectPointUse(ucode);
		List<PayDto> list2 = pointService.selectpay(ucode);
		
		List<PointsDto2> list = new ArrayList<PointsDto2>();
		
		for(PointsDto dto: list1) {
			PointsDto2 tmp = new PointsDto2();
			tmp.setDate(dto.getPo_Date());
			tmp.setPrice(dto.getPo_Point());
			tmp.setType("사용");
			list.add(tmp);
		}
		
		for(PayDto dto: list2) {
			PointsDto2 tmp = new PointsDto2();
			tmp.setDate(dto.getPay_Date());
			tmp.setPrice(dto.getPay_Price());
			if(dto.getPay_Type().equals("충전")) {
				tmp.setType("충전");				
			} else {
				tmp.setType("획득");
			}
			list.add(tmp);
		}

		int price_sum = 0;
		Collections.sort(list, Collections.reverseOrder());
		for(PointsDto2 dto: list) {
			if(dto.getType().equals("사용")) {
				price_sum -= dto.getPrice();				
			} else {
				price_sum += dto.getPrice();
			}
			dto.setPrice_Sum(price_sum);
		}
		
		Collections.reverse(list);
		
		cri.setPerPageNum(5);
		// 페이징 객체
		Paging paging = new Paging();
		paging.setCri(cri);
		paging.setTotalCount(list.size());
		
		int end_val = cri.getPageStart()+cri.getPerPageNum();
		if(end_val > paging.getTotalCount()) {
			end_val = paging.getTotalCount();
		}
		
		List<PointsDto2> list_sub = list.subList(cri.getPageStart(), end_val);
		
		model.addAttribute("point", pointService.selectUserPoint(ucode));
		model.addAttribute("list", list_sub);
		model.addAttribute("paging", paging);
		return "point";
	}
	
	@GetMapping("/payment")
	public String sucsessPay(int pay_Price, HttpSession session) {
		int user_code = (int)session.getAttribute("user_Code");
		
		// 유저코드와 금액으로 Pay DB 데이터 추가
		pointService.insertPay(pay_Price, user_code, "충전");
		// Users DB에서 point 업데이트
		int user_Code = (int)session.getAttribute("user_Code");
		int point = boardService.selectUser(user_Code).getUser_Point();
		pointService.updateUserPoint(point + pay_Price, user_code);
		
		return "redirect:/point/use";
	}
	
	@PostMapping("/consume")
	public String consumePoint(int req_No, HttpSession session, HttpServletResponse response) {// 1000포인트 소모하고 blur 해제
		PrintWriter out;
		response.setContentType("text/html; charset=UTF-8");
		
		int user_Code = (int)session.getAttribute("user_Code");
		int point = boardService.selectUser(user_Code).getUser_Point();
		if(point - 1000 < 0) {
			// 포인트 부족하면 충전페이지로 이동
			String redirect1 = "/point/use";
			
			try {
				out = response.getWriter();
				out.println("<script language='javascript'>");
				out.println("alert('결제 포인트가 부족합니다.')");
				out.println("window.location.href='"+redirect1+"';");
				out.println("</script>");
				out.flush();
				return null;
			} catch (IOException e) {
				e.printStackTrace();
				return "redirect:/point/use";
			}
			
		}
		
		int user_code = (int)session.getAttribute("user_Code");
		// 1000 포인트 소모 Points DB 업데이트
		pointService.insertPoints(1000, user_code, req_No);
		// Users DB 업데이트
		pointService.updateUserPoint(point - 1000, user_code);	
	
		// 결제 완료 알려주고 해당 페이지로 이동시켜 주기 
		String redirect2 = "/board/detail?req_No="+req_No;
		
		try {
			out = response.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('결제가 완료되었 습니다.')");
			out.println("window.location.href='"+redirect2+"';");
			out.println("</script>");
			out.flush();
			return null;
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "redirect:/board/detail?req_No="+req_No;
	}
	

}
