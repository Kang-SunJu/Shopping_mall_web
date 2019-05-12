package com.hanul.smart;

import java.util.Random;
import java.util.HashMap;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import common.service.CommonService;
import member.service.MemberService;
import member.vo.MemberVO;

@Controller @SessionAttributes("category")
public class MemberController {
	@Autowired private MemberService service;
	
	//����������ó�� ��û
		@RequestMapping("/delete.mb")
		public String delete(@RequestParam String userid) {
			//������ �������� ������ ��
			service.delete(userid);
			//�����ȭ������ ����
			return "redirect:list.mb";
		}
	
	//�����ȭ�� ��û
		@RequestMapping("/list.mb")
		public String list(Model model) {
			model.addAttribute("category", "mb");
			model.addAttribute("appTitle", "������-");
			//DB���� ����������� ��ȸ�ؿ�
			model.addAttribute("list", service.list() );
			//ȭ�鿡 ���
			return "member/list";
		}
	
	//���������� ��û
		@RequestMapping("/home")
		public String home() {
			return"home";
		}
	
	//��������������ó�� ��û
			@RequestMapping("/update")
			public String update(MemberVO vo) {
				//ȭ�鿡�� �����Է��� ������ DB�� ���������� ��
				service.update(vo);
				//��ȭ������ ����
				return "redirect:mypage?userid=" + vo.getUserid();
			}
	
	//����������ȭ�� ��û
			@RequestMapping("/modify")
			public String modify(Model model, @RequestParam String userid) {
				//������ ���� ������ DB���� ��ȸ�� �� ��
				model.addAttribute("vo", service.mypage(userid) );
				//��������ȭ�鿡 ���
				return "member/modify";
			}
	
	//���������� ��û
		@RequestMapping("/mypage")
		public String mypage(Model model, @RequestParam String userid) {
			//ȭ�鿡�� ������ ���� ������ DB���� ��ȸ�ؿ�
			model.addAttribute("vo", service.mypage(userid) );
			
			//��������ȭ������ ����
			return "member/mypage";
		}
	
	//�α׾ƿ�ó�� ��û
	@ResponseBody @RequestMapping("/logout")
	public void logout(HttpSession session) {
		//���ǿ� �ִ� �α��������� �����Ѵ�.
		session.removeAttribute("login_info");
	}
	
	//�α���ó�� ��û
	@ResponseBody @RequestMapping("/login")
	public boolean login(@RequestParam String userid,
						@RequestParam String userpwd,
						HttpSession session) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("userid", userid);
		map.put("userpwd", userpwd);
		MemberVO vo = service.select(map);
		//���̵�,����� ��ġ�ϴ� ȸ���� DB�� �ִ��� Ȯ���Ͽ�
		//��ġ�ϴ� ȸ���� �ִٸ� �α��εǰ� �Ѵ�.: �α��������� ���ǿ� ��´�.
		session.setAttribute("login_info", vo);
		//orderid �� �α����� ������ id�� �ִ´�.
		session.setAttribute("orderid", userid);
		return vo == null ? false : true;
	}
	
	
	//īī�� �α��� ������ ��ȸ(�г��Ӹ� �켱)
	@RequestMapping("/kakaologin")
	public String kakaologin(@RequestParam String name,
						HttpSession session, Model model) {

		//kakaologin �������� �г����� vo�� ��Ƽ� ����ó���ؼ� ������������ ������.
		MemberVO vo = new MemberVO();
		vo.setName(name);
		session.setAttribute("login_info", vo);
		return "redirect:index";
	}
	
	@Autowired private CommonService common;
	
	//ȸ������ó�� ��û
	@ResponseBody @RequestMapping(value="/join", 
						produces="text/html; charset=utf-8")
	public String join(MemberVO vo, HttpSession session) {
		//ȭ�鿡�� �Է��� ������ DB�� ������ ��
		String msg = "<script type='text/javascript'>";
		if( service.insert(vo) ) {
			common.emailSend(
					vo.getEmail(), vo.getName(), session);
			msg += "alert('ȸ�������� �����մϴ�^^'); location='index'";
		}else {
			msg += "alert('ȸ������ ���ФФ�'); history.go(-1)";
		}
		msg += "</script>";
		return msg;
	}
	
	//���̵��ߺ�Ȯ�� ��û
	@ResponseBody @RequestMapping("/id_check")
	public String id_check(@RequestParam String userid) {
		//ȭ�鿡�� ���۵� ���̵� DB�� ���翩�θ� �Ǵ��Ͽ�
		//�� ����� ȭ������ ��ȯ��Ų��.
		return String.valueOf( service.id_usable(userid) );
	}
	
	//ȸ������ȭ�� ��û
	@RequestMapping("/member")
	public String member(Model model) {
		model.addAttribute("category", "");
		return "member/join";
	}
	
	//�α���ȭ��
	@RequestMapping("/logintest.me")
	public String logintest(@RequestParam(required=false)String subject,
							@RequestParam(required=false)String id, Model model) {
		if(subject != null) {
			model.addAttribute("subject", subject);
		}
		if(id != null) {
			model.addAttribute("id", id);
		}
		//model.addAttribute("category", "");
		return "member/logintest";
	}
	
	//ȸ������ �������ȭ��
	@RequestMapping("/agree")
	public String agreetest() {
		//model.addAttribute("category", "");
		return "member/agree";
	}
	
	@RequestMapping("/find")
	public String find() {
		//model.addAttribute("category", "");
		return "member/find";
	}
	//���̵�ã���˾�â
			@RequestMapping("/idfind")
			public String idfind() {
				//model.addAttribute("category", "");
				return "member/idfind";
			}
			//���̵� �˻�			 
			@RequestMapping(value = "/id_find", method= {RequestMethod.POST, RequestMethod.GET})
			public String idfind(HttpServletResponse response, 
					@RequestParam("user_email1") String user_email1,
					@RequestParam("user_email2") String user_email2,
					Model md,
					HttpSession session) throws Exception{
				String email = user_email1 + "@" + user_email2;
				System.out.println(email);
				
				/*HashMap<String, String> map = new HashMap<String, String>();
				map.put("email", email);*/
				
				MemberVO vo =  service.id_find2(email);
				 
				//MemberVO vo = service.id_find(map);
				
				if(vo != null) {
					System.out.println(vo.getUserid());
					//session.setAttribute("id", vo.getUserid());
					md.addAttribute("vo", vo);
				}
				else {
				//id ���� ��� ó��
				}
				//md.addAttribute("vo", vo);
				//��ȯ�� url�� ��ȯ�Ǵ� ���� �ȳѾ�� �ʳ��� ���� ��������
				
				return "member/id_find";
			}
		//��й�ȣã�� �˾�â
		@RequestMapping("/pwfind")
		public String pwfind() {
			//model.addAttribute("category", "");
			return "member/pwfind";
		}
		
		
		//��й�ȣ �˻�			
		@RequestMapping(value = "/pw_find", method= {RequestMethod.POST, RequestMethod.GET})
		public String pwfind(HttpServletResponse response, 
				@RequestParam("user_email1") String user_email1,
				@RequestParam("user_email2") String user_email2,
				@RequestParam("user_id") String user_id,
				Model md,
				HttpSession session) throws Exception{
			String email = user_email1 + "@" + user_email2;
			System.out.println(email);
			//String userid = user_id ;
			//System.out.println(userid);
			 
			
			/*HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);*/
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("email", email);
			map.put("userid", user_id);
			MemberVO vo =  service.pw_find1(map);
			//MemberVO vo1 =  service.pw_find2(userid);
			
			//MemberVO vo = service.id_find(map);
			//System.out.println(vo1.???());
			
			StringBuffer tmpPw = new StringBuffer();
			Random rnd = new Random();
			int len = 8; //�ӽþ�ȣ ���� 8��.
			for (int i=0; i< len;i++) {
				//Ȧ���� �ҹ��� ¦���� ���ڷ� ������ �ӽú�� ����
				if(i%2==0) tmpPw.append((char)((int)(rnd.nextInt(26))+97));
				else tmpPw.append((int)(rnd.nextInt(10)));
			}
			System.out.println(tmpPw);
			
			
			
			if(vo != null) {
				
				
				System.out.println(vo.getUserid());
				//session.setAttribute("id", vo.getUserid());
				md.addAttribute("vo", vo);
				md.addAttribute("tmpPw",tmpPw);
			
			}
			else {
			//id ���� ��� ó��
			}
			//md.addAttribute("vo", vo);
			//��ȯ�� url�� ��ȯ�Ǵ� ���� �ȳѾ�� �ʳ��� ���� ��������
			
			return "member/pw_find";
		}
	
				
		@RequestMapping("/callbackview")
		public String callbackview(@RequestParam String code, @RequestParam String state, Model model) {
			model.addAttribute("category", "");
			//System.out.println("code" + code);
			//System.out.println("state" + state);
			return "member/callbackview";
			}

				
				
		
				/*@ResponseBody @RequestMapping(value="/idfind", produces="text/html; charset=utf-8")
				public String id_find(HttpServletResponse response, String email) throws Exception {
					PrintWriter out = response.getWriter();
					String id = MemberController.id_find(email);
					
					if (id == null) {
						out.println("<script>");
						out.println("alert('���Ե� ���̵� �����ϴ�.');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						return null;
					} else {
						return id;
					}
					
					return "/member/idfind";
				}*/
				
			/*// ���̵� ã�� ��
				@ResponseBody @RequestMapping(value = "/idfind", method= {RequestMethod.POST, RequestMethod.GET})
				public String idfind(HttpServletResponse response, @RequestParam("email") String email, Model md) throws Exception{
					md.addAttribute("id", service.id_find(response, email));
					
					return "/member/idfind";
			


				}
				*/
				
				
			/*	//���̵� ã��
				@Override
				public String id_find(HttpServletResponse response, String email) throws Exception {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					String id = MemberController.id_find(email);
					
					if (id == null) {
						out.println("<script>");
						out.println("alert('���Ե� ���̵� �����ϴ�.');");
						out.println("history.go(-1);");
						out.println("</script>");
						out.close();
						return null;
					} else {
						return id;
					}
				}*/
			
				
				
				
	//
		
	
	
	

}

