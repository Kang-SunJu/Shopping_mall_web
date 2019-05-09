package com.hanul.smart;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import member.vo.MemberVO;
import naver.api.NaverLoginBO;

//���̹� apiresult.respose ��ü. ���� �߰��Ǹ� ���ʿ� �߰��ϸ� ��. 
class NaverRes {
	private String id, email, name;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}

//���̹� apiresult ��ü. 
class NaverResult {
	private String resultcode, message;
	private NaverRes response;
	public String getResultcode() {
		return resultcode;
	}
	public void setResultcode(String resultcode) {
		this.resultcode = resultcode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public NaverRes getResponse() {
		return response;
	}
	public void setResponse(NaverRes response) {
		this.response = response;
	}
	
	
}



/**
 * Handles requests for the application home page.
 */
@Controller
public class NaverLoginController {
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    //�α��� ù ȭ�� ��û �޼ҵ�
    @RequestMapping(value = "/logintest", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* ���̹����̵�� ���� URL�� �����ϱ� ���Ͽ� naverLoginBOŬ������ getAuthorizationUrl�޼ҵ� ȣ�� */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
      //  System.out.println("���̹�:" + naverAuthUrl);
        
        //���̹� 
        model.addAttribute("url", naverAuthUrl);

        /* ������ ���� URL�� View�� ���� */
        return "member/logintest";
    }

    //���̹� �α��� ������ callbackȣ�� �޼ҵ�
    @ResponseBody @RequestMapping(value = "/callbackview", produces = "text/html; charset=utf-8" , method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("����� naver callback");
        //������ū �޾ƿ��� ��. �� ��ū �ʿ��ϸ� ���� �����ؾ���. ���̹� api ȣ���Ϸ��� �ʼ�������.
        OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //�α��� ����� ������ �о�´�.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        
        MemberVO vo = new MemberVO();
        //apiResult(json string)�� object parsing (jackson ���)
        //json �Ľ̿������� �ٷ� �����Ƿ� tryó��
        try {
	        ObjectMapper mapper = new ObjectMapper();
	        //String�� apiResult�� �̸� ������ naverResult ��ü�� ����
	        NaverResult res = mapper.readValue(apiResult, NaverResult.class);
	        NaverRes nres = res.getResponse(); //������(response ��) ����
	        //���̹����� �޾ƿ� ���� memberVO�� ���߾� ����
	        vo.setUserid("naver_" + nres.getId()); //���ڷθ� �������Ƿ� naver_�� �ٿ��� ����
	        vo.setEmail(nres.getEmail());
	        vo.setName(nres.getName());
        } catch (Exception e) {
			e.printStackTrace();
		}
        //��ƿ� vo�� ���ǿ� ����.
		session.setAttribute("login_info", vo);
        
		String msg = "<script type='text/javascript'>";
			msg += "alert('" + vo.getName() +"�� ȯ���մϴ�'); location='index'";
			msg += "</script>";
        
        return msg;
    }
    
   

    
}