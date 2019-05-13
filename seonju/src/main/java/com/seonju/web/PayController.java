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
	// �ֹ��ϱ� �� �ֹ������� �Է� ȣ��
	@RequestMapping("/payment.do")
	public String payment(Model model, @RequestParam String product_id, @RequestParam String product_name, @RequestParam String su,
			@RequestParam String price, HttpSession session) {
/*		// <-------- �������������� ���� ���̺� ������ �Է��Ͽ� ��ȿ�� �˻�
		// ȸ������/��ǰ��/����/���� ������ model�� ��Ƽ� ��������â���� �����͸� �Ѱ��ִ� �κ�

		// �� DB�� ��ȿ���˻�� ���� ������ �ֱ�
		service.insertdum(vo);
		// ------------> <---------���� */
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
	// ������û�ϰ� ���� ��������
	@RequestMapping("/purchase.do")
	@ResponseBody
	public void purchase(PayVO vo, HttpSession session) {
		// �����Ϸ� �� DB�� �ǵ����� �Է�
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
