package member.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean insert(MemberVO vo) {
		return sql.insert("member.mapper.insert", vo)>0 ? true : false;
	}

	@Override
	public boolean id_usable(String userid) {
		return (Integer)sql.selectOne("member.mapper.id_usable", 
					userid) > 0 ? false : true ;
	}

	@Override
	public MemberVO select(HashMap<String, String> map) {
		return sql.selectOne("member.mapper.login", map);
	}

	@Override
	public boolean update(MemberVO vo) {
		
		return sql.update("member.mapper.update", vo)>0 ? true : false;
	}

	@Override
	public boolean delete(String userid) {
		
		return sql.delete("member.mapper.delete", userid)>0 ? true : false;
	}
	
	// 아이디 찾기
		@Override
		public MemberVO id_find(HashMap<String, String> map) {
			return sql.selectOne("member.mapper.id_find", map);
		}

		@Override
		public MemberVO id_find2(String email) {
			return sql.selectOne("member.mapper.id_find2", email);
		}

		@Override
		public MemberVO pw_find1(HashMap<String, String> map) {
			return sql.selectOne("member.mapper.pw_find1", map);
		}

		@Override
		public MemberVO pw_find2(String userid) {
			// TODO Auto-generated method stub
			return null;
		}

		@Override
		public MemberVO mypage(String userid) {
			
			return sql.selectOne("member.mapper.mypage", userid);
		}

		@Override
		public List<MemberVO> list() {
			
			return sql.selectList("member.mapper.list");
		}
	

}
