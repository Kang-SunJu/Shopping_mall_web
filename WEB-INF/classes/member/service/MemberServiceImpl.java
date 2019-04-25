package member.service;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



import member.dao.MemberDAO;
import member.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired private MemberDAO dao;
	
	@Override
	public boolean insert(MemberVO vo) {
		return dao.insert(vo);
	}

	@Override
	public boolean id_usable(String userid) {
		return dao.id_usable(userid);
	}

	@Override
	public MemberVO select(HashMap<String, String> map) {
		return dao.select(map);
	}

	@Override
	public boolean update(MemberVO vo) {
		
		return dao.update(vo);
	}

	@Override 
	public boolean delete(String userid) {
		
		return dao.delete(userid);
	}
	
	//아이디찾기오전
	@Override
	public MemberVO id_find(HashMap<String, String> map) {
		return dao.id_find(map);
	}

	//아이디찾기오후
	@Override
	public MemberVO id_find2(String email) {
		return dao.id_find2(email);
	}
	
	//비번찾기 메일인증
		@Override
		public MemberVO pw_find1(HashMap<String, String> map) {
			return dao.pw_find1(map);
			
		}
		
		//비번찾기
		@Override
		public MemberVO pw_find2(String userid) {
			return dao.pw_find2(userid);
					
				}

		@Override
		public MemberVO mypage(String userid) {
			
			return dao.mypage(userid);
		}

		@Override
		public List<MemberVO> list() {
			
			return dao.list();
		}

		
	



}