package com.probee.waggle.model.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.probee.waggle.model.dto.Criteria;
import com.probee.waggle.model.dto.Paging;
import com.probee.waggle.model.dto.PayDto;
import com.probee.waggle.model.dto.PointsDto;
import com.probee.waggle.model.dto.PointsDto2;
import com.probee.waggle.model.service.PointService;

@Controller
@RequestMapping("/point")
public class PointController {
	
	@Autowired
	PointService pointService;
	
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
		pointService.updateUserPoint(pay_Price, user_code);
		// session에 user point 정보 업데이트
		int point = (int)session.getAttribute("user_Point");
		session.setAttribute("user_Point", point + pay_Price);
		
		return "redirect:/point/use";
	}
	

}
