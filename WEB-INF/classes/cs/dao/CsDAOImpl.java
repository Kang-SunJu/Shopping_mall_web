package cs.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import cs.vo.CsPageVO;
import cs.vo.CsVO;
import oracle.net.aso.f;

@Repository
public class CsDAOImpl implements CsDAO {

	@Override
	public boolean insert(CsVO vo, String subject) {
		return sql.insert(subject + ".mapper.insert", vo)>0 ? true : false;
	}

	@Autowired private SqlSession sql;
	
	@Override
	public CsPageVO list(CsPageVO vo, String subject) {
		vo.setTotalList(
			(Integer)sql.selectOne(subject+".mapper.total", vo) );
		vo.setList(
			(List)sql.selectList(subject+".mapper.list", vo) );
		return vo;
	}

	@Override
	public CsVO detail(int id, String subject) {
		return sql.selectOne(subject + ".mapper.detail", id);
	}

	@Override
	public boolean update(CsVO vo, String subject) {
		return sql.update(subject + ".mapper.update", vo)>0 ? true : false;
	}

	@Override
	public void readCount(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean delete(int id, String subject) {
		return sql.delete(subject+".mapper.delete", id) > 0 ? true : false;
	}

}
