package board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.vo.BoardPageVO;
import board.vo.BoardVO;
import oracle.net.aso.f;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Override
	public boolean insert(BoardVO vo) {
		return sql.insert("board.mapper.insert", vo)>0 ? true : false;
	}

	@Autowired private SqlSession sql;
	
	@Override
	public BoardPageVO list(BoardPageVO vo) {
		vo.setTotalList(
			(Integer)sql.selectOne("board.mapper.total", vo) );
		vo.setList(
			(List)sql.selectList("board.mapper.list", vo) );
		return vo;
	}

	@Override
	public BoardVO detail(int id) {
		return sql.selectOne("board.mapper.detail", id);
	}

	@Override
	public boolean update(BoardVO vo) {
		return sql.update("board.mapper.update", vo)>0 ? true : false;
	}

	@Override
	public void readCount(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean delete(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
