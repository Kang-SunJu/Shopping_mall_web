package com.hanul.smart;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import cs.service.CsCommentService;
import cs.vo.CsCommentVO;
import member.vo.MemberVO;

@Controller
public class CsCommentController {
	
	//��ۻ���ó�� ��û
	@ResponseBody @RequestMapping("/cs/comment/delete/{id}")
	public void delete(@PathVariable int id) {
		service.delete(id);
	}
	
	//��ۺ�������ó�� ��û
	@ResponseBody @RequestMapping(value="/cs/comment/update",
					produces="application/text; charset=utf-8")
	public String update(@RequestBody CsCommentVO vo) {
		return service.update(vo) ? "����" : "����";
	}
	
	//��۸����ȸó�� ��û
	@RequestMapping("/cs/comment/{pid}")
	public String list(@PathVariable int pid, Model model) {
		//�ش� ���ۿ� ���� ����� DB���� ��ȸ�� ��
		model.addAttribute( "list", service.list(pid) );
		//ȭ�鿡 ���
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		return "cs/comment/list";
	}
	
	
	
	//�������ó����û
	@ResponseBody @RequestMapping("/cs/comment/insert")
	public boolean insert(@RequestParam String content,
						@RequestParam int pid,
						HttpSession ss) {
		//ȭ�鿡�� �Է��� ������ DB�� ����ó���� ��
		HashMap<String, Object> map
			= new HashMap<String, Object>();
		map.put("content", content);
		map.put("pid", pid);
		map.put("userid", 
				((MemberVO)ss.getAttribute("login_info")).getUserid() );
		return service.insert(map);
	}
	
	@Autowired private CsCommentService service;
	
	
	
	
	
}
