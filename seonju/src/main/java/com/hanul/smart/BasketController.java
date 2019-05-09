package com.hanul.smart;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import basket.service.BasketService;
import basket.vo.BasketVO;

@Controller
@SessionAttributes({ "appTitle", "category" })
public class BasketController {
	@Autowired
	private BasketService service;

	// 장바구니 물품 제거
	@RequestMapping("/Basketdel")
	public String basket(@RequestParam String orderid, @RequestParam int product_id,HttpSession session){
	
		BasketVO vo = new BasketVO();
		vo.setProduct_id(product_id);
		vo.setUserid((String)session.getAttribute("orderid"));
		service.delete(vo);
		return "redirect:basketList.bs";
	}
	
	// 장바구니 수정
	@ResponseBody @RequestMapping("/basketset.do/{id}/{orderid}/{su}")
	public HashMap<String, Object> basketset(@PathVariable int id, @PathVariable String orderid, @PathVariable int su) {
		BasketVO vo = new BasketVO();
		vo.setProduct_id(id);
		vo.setUserid(orderid);
		vo.setSu(su);
		
		service.update(vo);
		HashMap<String, Object> map = new HashMap<String, Object>();
		int db_su = service.select_product(vo).getSu();
		if ( db_su == su ){
			map.put("su", su);
			map.put("update", true);
		}else{
			map.put("update", false);
			map.put("su", db_su);
		}
		return map;
	}

	// 장바구니 추가
	@RequestMapping("/basketadd.do")
	public String basketadd(BasketVO vo, HttpSession session, Model model) {
		vo.setUserid((String) session.getAttribute("orderid"));
		/*
		 * model.addAttribute("product_id", product_id);
		 * model.addAttribute("product_name", product_name);
		 * model.addAttribute("su", su); model.addAttribute("price", price);
		 */
		service.update(vo);
		model.addAttribute("basket", service.select(vo));
		return "redirect:basketList.bs";
	}

	// 장바구니 리스트 화면 불러오기
	@RequestMapping("/basketList.bs")
	public String basketList(HttpSession session, Model model) {
		BasketVO vo = new BasketVO();
		vo.setUserid((String) session.getAttribute("orderid"));
		model.addAttribute("basket", service.select(vo));
		return "basket/basketList";
	}
	@RequestMapping("payment.bs")
	public String payList(BasketVO vo, Model model, HttpSession session){
		vo.setUserid((String) session.getAttribute("orderid"));
		model.addAttribute("basket", service.select(vo));
		model.addAttribute("orderid", session.getAttribute("orderid"));
		return "pay/payment";
	}

}