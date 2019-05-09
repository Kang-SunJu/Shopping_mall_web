package com.hanul.smart;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import customer.service.CustomerService;
import customer.vo.CustomerVO;

@Controller @SessionAttributes({"appTitle", "category"})
public class CustomerController {
	
	//고객정보삭제처리 요청
	@RequestMapping("/delete.cs")
	public String delete(@RequestParam int id) {
		//선택한 고객정보를 삭제한 후
		service.delete(id);
		//고객목록화면으로 연결
		return "redirect:list.cs";
	}
	
	//고객정보변경저장처리 요청
	@RequestMapping("/update.cs")
	public String update(CustomerVO vo) {
		//화면에서 변경입력한 정보를 DB에 변경저장한 후
		service.update(vo);
		//상세화면으로 연결
		return "redirect:detail.cs?id=" + vo.getId();
	}
	
	//고객정보변경화면 요청
	@RequestMapping("/modify.cs")
	public String modify(Model model, @RequestParam int id) {
		//선택한 고객의 정보를 DB에서 조회해 온 후
		model.addAttribute("vo", service.detail(id) );
		//정보변경화면에 출력
		return "customer/modify";
	}
	
	//고객상세정보화면 요청
	@RequestMapping("/detail.cs")
	public String detail(Model model, @RequestParam int id) {
		//화면에서 선택한 고객의 정보를 DB에서 조회해와
		model.addAttribute("vo", service.detail(id) );
		//고객상세정보화면으로 연결
		return "customer/detail";
	}
	
	//생성된 빈 객체의 주소를 자동주입하기 위한 annotation
	//: @Autowired, @Inject
	@Autowired private CustomerService service;
	
	//신규고객등록처리 요청
	@RequestMapping("/insert.cs")
	public String insert(CustomerVO vo) {
		//화면에서 입력한 정보를 DB에 저장한 후
		service.insert(vo);
		//목록화면으로 연결
		return "redirect:list.cs";
	}
	
	//신규고객입력화면 요청
	@RequestMapping("/new.cs")
	public String customer() {
		//신규고객입력화면으로 연결
		return "customer/new";
	}
	
	
	//고객목록화면 요청
	@RequestMapping("/list.cs")
	public String list(Model model) {
		model.addAttribute("category", "cs");
		model.addAttribute("appTitle", "고객관리-");
		//DB에서 고객목록정보를 조회해와
		model.addAttribute("list", service.list() );
		//화면에 출력
		return "customer/list";
	}
}
