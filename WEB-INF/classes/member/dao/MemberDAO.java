package member.dao;

import java.util.HashMap;
import java.util.List;

import member.vo.MemberVO;

public interface MemberDAO {
	//CRUD
	boolean insert(MemberVO vo); //회원가입시 저장
	boolean id_usable(String userid); //아이디 중복확인
	MemberVO select(HashMap<String, String> map); //로그인
	boolean update(MemberVO vo); //회원정보 수정
	boolean delete(String userid); //회원탈퇴
	MemberVO id_find(HashMap<String, String> map);
	
	
	MemberVO id_find2(String email);
	MemberVO pw_find1(HashMap<String, String> map);
	MemberVO pw_find2(String userid);
	MemberVO mypage(String userid);
	List<MemberVO> list();
}
