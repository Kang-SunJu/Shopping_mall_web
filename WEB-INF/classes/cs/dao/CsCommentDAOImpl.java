package cs.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import cs.vo.CsCommentVO;

@Repository
public class CsCommentDAOImpl implements CsCommentDAO {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean insert(HashMap<String, Object> map) {
		return sql.insert("cs.comment.mapper.insert",
										map)>0 ? true: false;
	}

	@Override
	public List<CsCommentVO> list(int pid) {
		return sql.selectList("cs.comment.mapper.list", pid);
	}

	@Override
	public boolean update(CsCommentVO vo) {
		return sql.update("cs.comment.mapper.update", vo)>0 ? true : false;
	}

	@Override
	public boolean delete(int id) {
		return sql.delete("cs.comment.mapper.delete", id)>0 ? true : false;
	}

}
