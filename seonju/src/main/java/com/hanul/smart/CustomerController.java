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
	
	//����������ó�� ��û
	@RequestMapping("/delete.cs")
	public String delete(@RequestParam int id) {
		//������ �������� ������ ��
		service.delete(id);
		//�����ȭ������ ����
		return "redirect:list.cs";
	}
	
	//��������������ó�� ��û
	@RequestMapping("/update.cs")
	public String update(CustomerVO vo) {
		//ȭ�鿡�� �����Է��� ������ DB�� ���������� ��
		service.update(vo);
		//��ȭ������ ����
		return "redirect:detail.cs?id=" + vo.getId();
	}
	
	//����������ȭ�� ��û
	@RequestMapping("/modify.cs")
	public String modify(Model model, @RequestParam int id) {
		//������ ���� ������ DB���� ��ȸ�� �� ��
		model.addAttribute("vo", service.detail(id) );
		//��������ȭ�鿡 ���
		return "customer/modify";
	}
	
	//��������ȭ�� ��û
	@RequestMapping("/detail.cs")
	public String detail(Model model, @RequestParam int id) {
		//ȭ�鿡�� ������ ���� ������ DB���� ��ȸ�ؿ�
		model.addAttribute("vo", service.detail(id) );
		//��������ȭ������ ����
		return "customer/detail";
	}
	
	//������ �� ��ü�� �ּҸ� �ڵ������ϱ� ���� annotation
	//: @Autowired, @Inject
	@Autowired private CustomerService service;
	
	//�ű԰����ó�� ��û
	@RequestMapping("/insert.cs")
	public String insert(CustomerVO vo) {
		//ȭ�鿡�� �Է��� ������ DB�� ������ ��
		service.insert(vo);
		//���ȭ������ ����
		return "redirect:list.cs";
	}
	
	//�ű԰��Է�ȭ�� ��û
	@RequestMapping("/new.cs")
	public String customer() {
		//�ű԰��Է�ȭ������ ����
		return "customer/new";
	}
	
	
	//�����ȭ�� ��û
	@RequestMapping("/list.cs")
	public String list(Model model) {
		model.addAttribute("category", "cs");
		model.addAttribute("appTitle", "������-");
		//DB���� ����������� ��ȸ�ؿ�
		model.addAttribute("list", service.list() );
		//ȭ�鿡 ���
		return "customer/list";
	}
}
