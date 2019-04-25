package com.hanul.smart;

import java.io.File;

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


import common.service.CommonService;
import cs.service.CsService;
import cs.vo.CsPageVO;
import cs.vo.CsVO;
import member.vo.MemberVO;

@Controller @SessionAttributes({"category", "appTitle"})
public class CsController {
	
	//�ٿ�ε��û
		@ResponseBody @RequestMapping("/download.qu")
		public File download(@RequestParam int id,
							@RequestParam String subject,
								HttpSession session,
								HttpServletResponse response) {
			//�ش�id�� ÷������������ DB���� ��ȸ�ؿ�
			//�ٿ�ε��Ѵ�.
			CsVO vo = service.detail(id,subject);
			return common.download(vo.getFilepath(), 
							vo.getFilename(), 
							session, response);
		}
		
		//�Խñۺ�������ó�� ��û
		@RequestMapping("/update.qu")
		public String update(CsVO vo, RedirectAttributes redirect,
				@RequestParam String subject,
					@RequestParam MultipartFile file, HttpSession ss,
					@RequestParam String delete) {
			vo.setFilename("");
			vo.setFilepath("");
			
			CsVO cs = service.detail(vo.getId(),subject);
			String uuid = ss.getServletContext().getRealPath("resources")
							+ cs.getFilepath();
			
			if( file.getSize()>0 ) {
				vo.setFilename( file.getOriginalFilename() );
				vo.setFilepath( common.upload("cs", file, ss) );
				
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
					if( cs.getFilename()!=null )
						vo.setFilename( cs.getFilename() );
					if( cs.getFilepath()!=null )
						vo.setFilepath( cs.getFilepath() );
				}
			}
			
			//ȭ�鿡�� �����Է��� ������ DB�� ������ �� 
			service.update(vo,subject);
			//��ȭ������ ����
			//redirect ������� �����͸� ������ �ʰ� �����Ϸ���
			redirect.addFlashAttribute("id", vo.getId());
			redirect.addFlashAttribute("subject", subject);
			return "redirect:detail.qu";
		}
		
		//�Խñۻ�ȭ�� ��û
		@RequestMapping("/detail.qu")
		public String detail(@ModelAttribute("id") int id , @ModelAttribute("subject") String subject , Model model) {
			//�ش� id�� �������� DB���� ��ȸ�� ��
			//��ȭ������ �����Ͽ� �����͸� ���
			model.addAttribute("vo", service.detail(id,subject));
			model.addAttribute("crlf", "\r\n");
			model.addAttribute("page", page);
			
			return "cs/detail";
		}
			
		//�Խñۺ���ȭ�� ��û
		@RequestMapping("/modify.qu")
		public String modify(@RequestParam int id, Model model, @ModelAttribute("subject") String subject) {
			//�ش� ���� ������ DB���� ��ȸ�ؿ�
			//����ȭ�鿡 ���
			model.addAttribute("vo", service.detail(id,subject)); 
			return "cs/modify";
		}
		
		
		//�Խñ� ����ó��
		@RequestMapping("/delete.qu")
		public String delete(@RequestParam int id, @ModelAttribute("subject") String subject) {
			
			service.delete(id,subject);
			
			return "redirect:list.qu";
		}
		
		@Autowired private CommonService common;
		
		//�ű԰Խñ�����ó�� ��û
		@RequestMapping("/insert.qu")
		public String insert(@ModelAttribute("subject") String subject, CsVO vo, HttpSession session,
					@RequestParam MultipartFile file) {
			vo.setFilename("");
			vo.setFilepath("");
			if( file.getSize()>0 ) {
				vo.setFilename(file.getOriginalFilename());
				vo.setFilepath( common.upload(subject, file, session) );
			}
			//ȭ�鿡�� �Է��� ������ DB�� ������ ��
			vo.setUserid( 
					((MemberVO)session.getAttribute("login_info"))
						.getUserid() );
			service.insert(vo,subject);
			//���ȭ������ ����
			return "redirect:list.qu";
		}
		
		//�ű԰Խñ��ۼ�ȭ�� ��û
		@RequestMapping("/new.qu")
		public String board(@ModelAttribute("subject") String subject) {
			return "cs/new";
		}
		
		@Autowired private CsPageVO page;
		@Autowired private CsService service;
		
		//�Խñ۸��ȭ�� ��û
		@RequestMapping("/list.qu")
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
			
			model.addAttribute( "page", service.list(page,subject) );
			model.addAttribute( "subject", subject );
			
			return "cs/list";
		}
	
	
	@RequestMapping("/cs.qu")
	public String cs(){
		
		return "cs/cs";
	}
}
