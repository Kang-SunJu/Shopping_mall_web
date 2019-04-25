package common.service;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.HtmlEmail;
import org.apache.commons.mail.MultiPartEmail;
import org.apache.commons.mail.SimpleEmail;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
public class CommonServiceImpl implements CommonService {

	@Override
	public String upload(String category, MultipartFile file, HttpSession session) {

	      String project = session.getServletContext().getRealPath("");
	      
	      //.metadata/.../smart/
	      String upload = project + "resources"+ File.separator+ "upload";
	      // --> ..metadata/.../wtpwebapps/smart/resources/upload
	      String uploadFolder = makeFolder(category, upload);

	      String uuid = /*UUID.randomUUID().toString() + "_" +*/ file.getOriginalFilename();

	      try {
	         file.transferTo( new File(uploadFolder, uuid));
	         //   uuid :2d1860f1-a48f-48a2-b1cb-3d027ae22896_register_back6-copy 

	      } catch (Exception e) {
	         e.printStackTrace();
	         System.out.println(e.getMessage());
	         //--> ..metadata/.../upload/notice/2019/01/08
	      }
	      //uploadFolder : Study_Spring/.etadatea/
//	            ....smart/resources/upload/notice/2019/01/08
	      //project : Study_Spring/.etadatea/....smart/
	      //   /upload/notice/2019/01/08/2d1860f1-a48f-48a2-b1cb-3d027ae22896_register_back6-copy 揶쏉옙 return 占쎈쭡

	      return uploadFolder.replace(project+"resources", "")
	            + File.separator + uuid;
	   }
	
	private String makeFolder(String category, String upload) {
	      Date now = new Date();
	         String[] folders = new String[5];
	         folders[0] = upload;   //..smart/resources/upload
	         folders[1] = folders[0] + File.separator + category;
	         
	         //   .../smart/resources/upload/notice
	         folders[2] = folders[1]+File.separator + new SimpleDateFormat("yyyy").format(now);

	         //   .../smart/resources/upload/notice/2019
	         folders[3] = folders[2]+File.separator + new SimpleDateFormat("MM").format(now);

	         //   .../smart/resources/upload/notice/2019/01
	         folders[4] = folders[3]+File.separator + new SimpleDateFormat("dd").format(now);

	         //   .../smart/resources/upload/notice/2019/01/08

	         File folder = new File(folders[4]);

	         if(!folder.exists())
	            folder.mkdirs();

	      return folders[4];
	   }

	@Override
	public File download(String filepath, String filename, HttpSession session, HttpServletResponse response) {
		//�꽌踰꾩쓽 �떎�젣 �뙆�씪�씠 �뾽濡쒕뱶�릺�뼱�엳�뒗 �쐞移섏뿉�꽌
		//�빐�떦 �뙆�씪�쓣 蹂듭궗�빐 ���옣�븳�떎.
		String project 
		= session.getServletContext().getRealPath("resources");
		//�떎�슫濡쒕뱶�븷 �뙆�씪媛앹껜 �깮�꽦
		File file = new File( project +  filepath );
		
		//�쓳�떟�븷 �뙆�씪�쓽 留덉엫���엯�쓣 李얜뒗�떎.
		String mime
		= session.getServletContext().getMimeType(filename);
		//留덉엫���엯�씠 �뾾�떎硫� 湲곕낯吏��젙
		if( mime == null ) {
			mime = "application/octet-stream";
		}
		
		response.setContentType( mime );
		try {
		//�븳湲��뙆�씪紐낆쿂由�
		//�뙆�씪紐낆뿉 �뱾�뼱媛� �엳�뒗 怨듬갚, (), [], ...泥섎━
		filename = URLEncoder.encode(filename, "utf-8")
					.replaceAll("\\+", "%20")
					.replaceAll("\\(", "%28")
					.replaceAll("\\)", "%29");
		
		response.setHeader("content-disposition", 
							"attachment; filename=" + filename);
		ServletOutputStream out = response.getOutputStream();
		
		//�꽌踰꾩쓽 �뙆�씪�쓣 蹂듭궗�빐�꽌 �겢�씪�씠�뼵�듃�뿉 遺숈뿬�꽔湲고븳�떎.
		FileCopyUtils.copy( 
				new FileInputStream(file), out);
		out.flush();
		}catch(Exception e) {}
		
		return file;
	}

	@Override
	public void emailSend(String email, String name,
					HttpSession session) {
//		simpleSend(email, name);
//		attachSend(email, name, session);
		htmlSend(email, name, session);
	}
	
	private void htmlSend(String email, String name, 
			HttpSession session) {
		HtmlEmail mail = new HtmlEmail();
		
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
//		mail.setDebug(true);
		
		mail.setAuthentication("ojink2", "");
		mail.setSSLOnConnect(true);
	
		try {
			mail.setFrom("ojink2@naver.com", "愿�由ъ옄");
			mail.addTo(email, name +" �썕�젴�깮");
			mail.setSubject("SW 怨쇱젙");
			
			StringBuilder sb = new StringBuilder();
			sb.append("<html>");
			sb.append("<body>");
			sb.append("<h3>�뒪留덊듃 �쎒&�빋 怨쇱젙<h3>");
			sb.append("<a href='http://hanuledu.co.kr'>"
					+ "<img src='http://hanuledu.co.kr/data/menu/LOGO_dxGsKC1i8hTKFO3dcZDb1497920194.png'/></a>");
			sb.append("<br>");
			sb.append("<font color='red'>異뺥븯�빀�땲�떎!!</font>");
			sb.append("</body>");
			sb.append("</html>");
			mail.setHtmlMsg(sb.toString());
			
			EmailAttachment attach = new EmailAttachment();
			attach.setPath(
				session.getServletContext().getRealPath("resources")
						+ File.separator + "css" 
						+ File.separator +"common.css"
				);
			mail.attach(attach);
			
			mail.send();
			
		}catch(Exception e) {}
		
	}
	
	private void attachSend(String email, String name, 
							HttpSession session) {
		MultiPartEmail mail = new MultiPartEmail();
		
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
//		mail.setDebug(true);
		
		mail.setAuthentication("ojink2", "");
		mail.setSSLOnConnect(true);
		
		try {
			mail.setFrom("ojink2@naver.com", "�븳�슱愿�由ъ옄");
			mail.addTo(email, name);
			mail.setSubject("�븳�슱 SW怨쇱젙-泥⑤��뙆�씪�솗�씤");
			mail.setMsg("怨쇱젙 �엯援먮�� 異뺥븯�빀�땲�떎. 泥⑤��뙆�씪�쓣 �솗�씤�븯�꽭�슂");
			
			//泥⑤��뙆�씪媛앹껜�깮�꽦
			EmailAttachment attach = new EmailAttachment();
			attach.setPath("D:\\媛쒕컻�옄�봽濡쒓렇�옩\\aaa.jpg");
			mail.attach(attach);
			
			attach = new EmailAttachment();
			attach.setPath(
				session.getServletContext().getRealPath("resources")
						+ File.separator + "img" 
						+ File.separator + "hanul.logo.png" 
						);
			mail.attach(attach);
			
			attach = new EmailAttachment();
			attach.setURL( new URL("https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png") );
			mail.attach(attach);
			
			mail.send();
			
		}catch(Exception e) {
		}
	}
	
	private void simpleSend(String email, String name) {
		SimpleEmail mail = new SimpleEmail();
		
		//�씠硫붿씪�꽌踰꾩��젙
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
//		mail.setDebug(true);
		
		//硫붿씪�꽌踰꾩뿉 濡쒓렇�씤
		mail.setAuthentication("ojink2", "");
		mail.setSSLOnConnect(true);
		
		try {
		//硫붿씪蹂대궡�뒗�씠	
		mail.setFrom("ojink2@naver.com", "�븳�슱愿�由ъ옄");
		//硫붿씪諛쏅뒗�씠
		mail.addTo(email, name);
//		mail.addTo("email二쇱냼2");
		
		//硫붿씪�젣紐�, �궡�슜
		mail.setSubject("�븳�슱 �쓳�슜SW 怨쇱젙");
		mail.setMsg("�뒪留덊듃 �쎒&�빋 媛쒕컻�옄 怨쇱젙�뿉 �엯援먮�� 異뺥븯�빀�땲�떎");
		
		//硫붿씪蹂대궡湲�
		mail.send();
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public String upload2(String category, MultipartFile file, HttpSession session) {
		//파일을 업로드시킬 물리적위치를 지정
		//../프로젝트명/resources/upload/notice/2019/01/08 폴더에 저장한다.
		String project 
			= session.getServletContext().getRealPath("");
		
		//..metadata/..../smart/
		String upload = 
			project + "resources" + File.separator + "upload";
		//..metadata/..../smart/resources/upload
		
		
		String uploadFolder = upload + File.separator + category;
		
		File folder = new File( uploadFolder );
		if( !folder.exists() ) { folder.mkdirs(); }
		
		//고유한 ID 를 부여한 파일명으로 업로드한다.
		String uuid 
		= UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		
		try {
			file.transferTo( new File(uploadFolder, uuid) );
		}catch(Exception e) {	}

		return uploadFolder.replace(project+"resources", "") 
					+  File.separator + uuid;
	}
	
}
