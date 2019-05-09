package com.hanul.smart;

import java.io.File;
import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import board.service.BoardService;
import board.vo.BoardPageVO;
import board.vo.BoardVO;
import common.service.CommonService;
import member.vo.MemberVO;

@Controller @SessionAttributes({"category", "appTitle"})
public class BoardController {
	
	//�ٿ�ε��û
		@ResponseBody @RequestMapping("/download.bo")
		public File download(@RequestParam int id,
							@RequestParam String subject,
								HttpSession session,
								HttpServletResponse response) {
			//�ش�id�� ÷������������ DB���� ��ȸ�ؿ�
			//�ٿ�ε��Ѵ�.
			
			//id���� �Խ��� �̸� ���� �־������
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("subject", subject);
			BoardVO vo = service.detail(map);
			return common.download(vo.getFilepath(), 
							vo.getFilename(), 
							session, response);
		}
		
		//�Խñۺ�������ó�� ��û
		@RequestMapping("/update.bo")
		public String update(BoardVO vo, RedirectAttributes redirect,
					@RequestParam MultipartFile file, HttpSession ss,
					@RequestParam String delete) {
			vo.setFilename("");
			vo.setFilepath("");
			
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", vo.getId());
			map.put("subject", vo.getSubject());
			BoardVO board = service.detail(map);
			String uuid = ss.getServletContext().getRealPath("resources")
							+ board.getFilepath();
			
			if( file.getSize()>0 ) {
				vo.setFilename( file.getOriginalFilename() );
				vo.setFilepath( common.upload(vo.getSubject(), file, ss) );
				
				//���� ÷�ε� ������ �־��ٸ� ����
				File f = new File( uuid );
				if( f.exists() ) f.delete();
			}else {
				if( delete.equals("y") ) {
					//���� ÷�ε� ���� �־��µ� �����ϴ� ���
					File f = new File( uuid );
					if( f.exists() ) f.delete();
				}else {
					//���� ÷�ε� ���� �־��� �װ� �״�� ����ϴ� ���
					if( board.getFilename()!=null )
						vo.setFilename( board.getFilename() );
					if( board.getFilepath()!=null )
						vo.setFilepath( board.getFilepath() );
				}
			}
			
			//ȭ�鿡�� �����Է��� ������ DB�� ������ �� 
			service.update(vo);
			//��ȭ������ ����
			//redirect ������� �����͸� ������ �ʰ� �����Ϸ���
			redirect.addFlashAttribute("id", vo.getId());
			redirect.addFlashAttribute("subject", vo.getSubject());
			return "redirect:detail.bo";
		}
		
		//�Խñۻ�ȭ�� ��û
		@RequestMapping("/detail.bo")
		public String detail(@ModelAttribute("id") int id , @ModelAttribute("subject") String subject , Model model) {
			//�ش� id�� �������� DB���� ��ȸ�� ��
			//��ȭ������ �����Ͽ� �����͸� ���
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("subject", subject);
			model.addAttribute("vo", service.detail(map));
			model.addAttribute("crlf", "\r\n");
			model.addAttribute("page", page);
			
			return "board/detail";
		}
			
		//�Խñۺ���ȭ�� ��û
		@RequestMapping("/modify.bo")
		public String modify(@RequestParam int id, Model model, @ModelAttribute("subject") String subject) {
			//�ش� ���� ������ DB���� ��ȸ�ؿ�
			//����ȭ�鿡 ���
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("subject", subject);
			model.addAttribute("vo", service.detail(map)); 
			return "board/modify";
		}
		
		
		//�Խñ� ����ó��
		@RequestMapping("/delete.bo")
		public String delete(@RequestParam int id, @ModelAttribute("subject") String subject) {
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("id", id);
			map.put("subject", subject);
			service.delete(map);
			
			return "redirect:list.bo";
		}
		
		@Autowired private CommonService common;
		
		//�ű԰Խñ�����ó�� ��û
		@RequestMapping("/insert.bo")
		public String insert(BoardVO vo, HttpSession session,
					@RequestParam MultipartFile file, Model model) {
			vo.setFilename("");
			vo.setFilepath("");
			if( file.getSize()>0 ) {
				vo.setFilename(file.getOriginalFilename());
				vo.setFilepath( common.upload(vo.getSubject(), file, session) );
			}
			//ȭ�鿡�� �Է��� ������ DB�� ������ ��
			vo.setUserid( 
					((MemberVO)session.getAttribute("login_info"))
						.getUserid() );
			service.insert(vo);
			//���ȭ������ ����
			model.addAttribute("subject", vo.getSubject());
			return "redirect:list.bo";
		}
		
		//�ű԰Խñ��ۼ�ȭ�� ��û
		@RequestMapping("/new.bo")
		public String board(@ModelAttribute("subject") String subject) {
			return "board/new";
		}
		
		@Autowired private BoardPageVO page;
		@Autowired private BoardService service;
		
		//�Խñ۸��ȭ�� ��û
		@RequestMapping("/list.bo")
		public String list(Model model, 
				@RequestParam(defaultValue="cs") String subject,
				@RequestParam(defaultValue="1") int curPage,
				@RequestParam(required=false) String search, 
				@RequestParam(defaultValue="") String keyword) {
			
			
			model.addAttribute("appTitle", "�Խñ�-");
			model.addAttribute("category", "qu");
			//DB���� �Խñ۸���� ��ȸ�ؿ� ȭ�鿡 ���

			page.setCurPage(curPage);
			page.setSearch(keyword.isEmpty() ? "" : search);
			page.setKeyword(keyword);
			
			page.setSubject(subject);
			
			model.addAttribute( "page", service.list(page) );
			model.addAttribute( "subject", subject );
			
			return "board/list";
		}
	
	
	@RequestMapping("/board.bo")
	public String board(){
		
		return "board/board";
	}
}
