package member.dao;

import java.util.HashMap;
import java.util.List;

import member.vo.MemberVO;

public interface MemberDAO {
	//CRUD
	boolean insert(MemberVO vo); //ȸ�����Խ� ����
	boolean id_usable(String userid); //���̵� �ߺ�Ȯ��
	MemberVO select(HashMap<String, String> map); //�α���
	boolean update(MemberVO vo); //ȸ������ ����
	boolean delete(String userid); //ȸ��Ż��
	MemberVO id_find(HashMap<String, String> map);
	
	
	MemberVO id_find2(String email);
	MemberVO pw_find1(HashMap<String, String> map);
	MemberVO pw_find2(String userid);
	MemberVO mypage(String userid);
	List<MemberVO> list();
}
