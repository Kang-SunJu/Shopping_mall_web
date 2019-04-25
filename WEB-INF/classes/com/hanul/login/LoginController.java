package com.hanul.login;
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


import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.model.OAuth2AccessToken;

import member.vo.MemberVO;

//네이버 apiresult.respose 객체. 정보 추가되면 이쪽에 추가하면 됨. 
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

//네이버 apiresult 객체. 
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
public class LoginController {
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/logintest", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
      //  System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "member/logintest";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/callbackview", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 naver callback");
        //인증토큰 받아오는 곳. 이 토큰 필요하면 따로 저장해야함. 네이버 api 호출하려면 필수정보임.
        OAuth2AccessToken oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        
        //System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        //model.addAttribute("result", apiResult);
        //System.out.println("result: "+ apiResult);
        MemberVO vo = new MemberVO();
        //apiResult(json string)을 object parsing (jackson 사용)
        //json 파싱오류나면 바로 터지므로 try처리
        try {
	        ObjectMapper mapper = new ObjectMapper();
	        //String인 apiResult를 미리 선언한 naverResult 객체로 매핑
	        NaverResult res = mapper.readValue(apiResult, NaverResult.class);
	        NaverRes nres = res.getResponse(); //고객정보(response 값) 저장
	        //네이버에서 받아온 값을 memberVO에 맞추어 저장
	        vo.setUserid("naver_" + nres.getId()); //숫자로만 되있으므로 naver_를 붙여서 구분
	        vo.setEmail(nres.getEmail());
	        vo.setName(nres.getName());
        } catch (Exception e) {
			e.printStackTrace();
		}
        //담아온 vo를 세션에 담음.
		session.setAttribute("login_info", vo);
        
        
        /* 네이버 로그인 성공 페이지 View 호출 */
//      JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//      String snsId = jsonparse.JsonToString(jsonobj, "id");
//      String name = jsonparse.JsonToString(jsonobj, "name");
//
//      UserVO vo = new UserVO();
//      vo.setUser_snsId(snsId);
//      vo.setUser_name(name);
//
//      System.out.println(name);
//      try {
//          vo = service.naverLogin(vo);
//      } catch (Exception e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }


//      session.setAttribute("login",vo);
//      return new ModelAndView("user/loginPost", "result", vo);
        
        return "users/naverSuccess";
    }
    
   

    
}