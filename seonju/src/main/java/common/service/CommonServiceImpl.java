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
	      //   /upload/notice/2019/01/08/2d1860f1-a48f-48a2-b1cb-3d027ae22896_register_back6-copy �뤆�룊�삕 return �뜝�럥彛�

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
		//占쎄퐣甕곌쑴�벥 占쎈뼄占쎌젫 占쎈솁占쎌뵬占쎌뵠 占쎈씜嚥≪뮆諭띰옙由븝옙堉깍옙�뿳占쎈뮉 占쎌맄燁살꼷肉됵옙苑�
		//占쎈퉸占쎈뼣 占쎈솁占쎌뵬占쎌뱽 癰귣벊沅쀯옙鍮� 占쏙옙占쎌삢占쎈립占쎈뼄.
		String project 
		= session.getServletContext().getRealPath("resources");
		//占쎈뼄占쎌뒲嚥≪뮆諭띰옙釉� 占쎈솁占쎌뵬揶쏆빘猿� 占쎄문占쎄쉐
		File file = new File( project +  filepath );
		
		//占쎌벓占쎈뼗占쎈막 占쎈솁占쎌뵬占쎌벥 筌띾뜆�뿫占쏙옙占쎌뿯占쎌뱽 筌≪뼔�뮉占쎈뼄.
		String mime
		= session.getServletContext().getMimeType(filename);
		//筌띾뜆�뿫占쏙옙占쎌뿯占쎌뵠 占쎈씨占쎈뼄筌롳옙 疫꿸퀡�궚筌욑옙占쎌젟
		if( mime == null ) {
			mime = "application/octet-stream";
		}
		
		response.setContentType( mime );
		try {
		//占쎈립疫뀐옙占쎈솁占쎌뵬筌뤿굞荑귞뵳占�
		//占쎈솁占쎌뵬筌뤿굞肉� 占쎈굶占쎈선揶쏉옙 占쎌뿳占쎈뮉 �⑤벉媛�, (), [], ...筌ｌ꼶�봺
		filename = URLEncoder.encode(filename, "utf-8")
					.replaceAll("\\+", "%20")
					.replaceAll("\\(", "%28")
					.replaceAll("\\)", "%29");
		
		response.setHeader("content-disposition", 
							"attachment; filename=" + filename);
		ServletOutputStream out = response.getOutputStream();
		
		//占쎄퐣甕곌쑴�벥 占쎈솁占쎌뵬占쎌뱽 癰귣벊沅쀯옙鍮먲옙苑� 占쎄깻占쎌뵬占쎌뵠占쎈섧占쎈뱜占쎈퓠 �겫�늿肉э옙苑붹묾怨좊립占쎈뼄.
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
			mail.setFrom("ojink2@naver.com", "�꽴占썹뵳�딆쁽");
			mail.addTo(email, name +" 占쎌뜒占쎌졃占쎄문");
			mail.setSubject("SW �⑥눘�젟");
			
			StringBuilder sb = new StringBuilder();
			sb.append("<html>");
			sb.append("<body>");
			sb.append("<h3>占쎈뮞筌띾뜇�뱜 占쎌럲&占쎈퉳 �⑥눘�젟<h3>");
			sb.append("<a href='http://hanuledu.co.kr'>"
					+ "<img src='http://hanuledu.co.kr/data/menu/LOGO_dxGsKC1i8hTKFO3dcZDb1497920194.png'/></a>");
			sb.append("<br>");
			sb.append("<font color='red'>�빊類λ릭占쎈�占쎈빍占쎈뼄!!</font>");
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
			mail.setFrom("ojink2@naver.com", "占쎈립占쎌뒻�꽴占썹뵳�딆쁽");
			mail.addTo(email, name);
			mail.setSubject("占쎈립占쎌뒻 SW�⑥눘�젟-筌ｂ뫀占쏙옙�솁占쎌뵬占쎌넇占쎌뵥");
			mail.setMsg("�⑥눘�젟 占쎌뿯�뤃癒�占쏙옙 �빊類λ릭占쎈�占쎈빍占쎈뼄. 筌ｂ뫀占쏙옙�솁占쎌뵬占쎌뱽 占쎌넇占쎌뵥占쎈릭占쎄쉭占쎌뒄");
			
			//筌ｂ뫀占쏙옙�솁占쎌뵬揶쏆빘猿쒙옙源�占쎄쉐
			EmailAttachment attach = new EmailAttachment();
			attach.setPath("D:\\揶쏆뮆而삼옙�쁽占쎈늄嚥≪뮄�젃占쎌삪\\aaa.jpg");
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
		
		//占쎌뵠筌롫뗄�뵬占쎄퐣甕곌쑴占쏙옙�젟
		mail.setHostName("smtp.naver.com");
		mail.setCharset("utf-8");
//		mail.setDebug(true);
		
		//筌롫뗄�뵬占쎄퐣甕곌쑴肉� 嚥≪뮄�젃占쎌뵥
		mail.setAuthentication("ojink2", "");
		mail.setSSLOnConnect(true);
		
		try {
		//筌롫뗄�뵬癰귣�沅∽옙�뮉占쎌뵠	
		mail.setFrom("ojink2@naver.com", "占쎈립占쎌뒻�꽴占썹뵳�딆쁽");
		//筌롫뗄�뵬獄쏆룆�뮉占쎌뵠
		mail.addTo(email, name);
//		mail.addTo("email雅뚯눘�꺖2");
		
		//筌롫뗄�뵬占쎌젫筌륅옙, 占쎄땀占쎌뒠
		mail.setSubject("占쎈립占쎌뒻 占쎌벓占쎌뒠SW �⑥눘�젟");
		mail.setMsg("占쎈뮞筌띾뜇�뱜 占쎌럲&占쎈퉳 揶쏆뮆而삼옙�쁽 �⑥눘�젟占쎈퓠 占쎌뿯�뤃癒�占쏙옙 �빊類λ릭占쎈�占쎈빍占쎈뼄");
		
		//筌롫뗄�뵬癰귣�沅→묾占�
		mail.send();
		
		}catch(Exception e) {
			System.out.println(e.getMessage());
		}
	}

	@Override
	public String upload2(String category, MultipartFile file, HttpSession session) {
		//�뙆�씪�쓣 �뾽濡쒕뱶�떆�궗 臾쇰━�쟻�쐞移섎�� 吏��젙
		//../�봽濡쒖젥�듃紐�/resources/upload/notice/2019/01/08 �뤃�뜑�뿉 ���옣�븳�떎.
		String project 
			= session.getServletContext().getRealPath("");
		
		//..metadata/..../smart/
		String upload = 
			project + "resources" + File.separator + "upload";
		//..metadata/..../smart/resources/upload
		
		
		String uploadFolder = upload + File.separator + category;
		
		File folder = new File( uploadFolder );
		if( !folder.exists() ) { folder.mkdirs(); }
		
		//怨좎쑀�븳 ID 瑜� 遺��뿬�븳 �뙆�씪紐낆쑝濡� �뾽濡쒕뱶�븳�떎.
		String uuid 
		= UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		
		try {
			file.transferTo( new File(uploadFolder, uuid) );
		}catch(Exception e) {	}

		return uploadFolder.replace(project+"resources", "") 
					+  File.separator + uuid;
	}
	
}
