package com.seonju.web;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import pay.service.PayService;
import pay.vo.PayVO;

@Controller
public class PayController {

	@Autowired
	private PayService service;
	// 주문하기 전 주문자정보 입력 호출
	@RequestMapping("/payment.do")
	public String payment(Model model, @RequestParam String product_id, @RequestParam String product_name, @RequestParam String su,
			@RequestParam String price, HttpSession session) {
/*		// <-------- 부정결제방지용 더미 테이블에 데이터 입력하여 유효성 검사
		// 회원정보/제품명/수량/가격 정보를 model에 담아서 최종결제창으로 데이터를 넘겨주는 부분

		// ↓ DB에 유효성검사용 더미 데이터 넣기
		service.insertdum(vo);
		// ------------> <---------보류 */
		model.addAttribute("product_id", product_id);
		model.addAttribute("product_name", product_name);
		model.addAttribute("su", su);
		model.addAttribute("price", price);
		model.addAttribute("directbuy", "buy");
		return "pay/payment";
	}
	@RequestMapping("/reset.do")
	public String reset_1(HttpSession session){
		session.invalidate();
		return "redirect:index";
	}
	// 결제요청하고 난뒤 결제종료
	@RequestMapping("/purchase.do")
	@ResponseBody
	public void purchase(PayVO vo, HttpSession session) {
		// 결제완료 후 DB에 실데이터 입력
		vo.setUserid((String) session.getAttribute("orderid"));
		service.insert(vo);
	}

	@ResponseBody
	@RequestMapping("/payback.do")
	public boolean payback(HttpSession session){
/*		String orderid = (String) session.getAttribute("orderid");
		boolean delchk = service.deletedum(orderid);*/
		boolean delchk = true;
		if(delchk){
			delchk = true;
		}else{
			delchk = false;
		}
		return delchk;
	}
}
