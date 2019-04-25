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
	
	//댓글삭제처리 요청
	@ResponseBody @RequestMapping("/cs/comment/delete/{id}")
	public void delete(@PathVariable int id) {
		service.delete(id);
	}
	
	//댓글변경저장처리 요청
	@ResponseBody @RequestMapping(value="/cs/comment/update",
					produces="application/text; charset=utf-8")
	public String update(@RequestBody CsCommentVO vo) {
		return service.update(vo) ? "성공" : "실패";
	}
	
	//댓글목록조회처리 요청
	@RequestMapping("/cs/comment/{pid}")
	public String list(@PathVariable int pid, Model model) {
		//해당 원글에 대한 댓글을 DB에서 조회한 후
		model.addAttribute( "list", service.list(pid) );
		//화면에 출력
		model.addAttribute("crlf", "\r\n");
		model.addAttribute("lf", "\n");
		return "cs/comment/list";
	}
	
	
	
	//댓글저장처리요청
	@ResponseBody @RequestMapping("/cs/comment/insert")
	public boolean insert(@RequestParam String content,
						@RequestParam int pid,
						HttpSession ss) {
		//화면에서 입력한 정보를 DB에 저장처리한 후
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
