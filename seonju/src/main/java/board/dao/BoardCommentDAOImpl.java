package board.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import board.vo.BoardCommentVO;

@Repository
public class BoardCommentDAOImpl implements BoardCommentDAO {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean insert(HashMap<String, Object> map) {
		return sql.insert("board.comment.mapper.insert",
										map)>0 ? true: false;
	}

	@Override
	public List<BoardCommentVO> list(HashMap<String, Object> map) {
		return sql.selectList("board.comment.mapper.list", map);
	}

	@Override
	public boolean update(BoardCommentVO vo) {
		return sql.update("board.comment.mapper.update", vo)>0 ? true : false;
	}

	@Override
	public boolean delete(HashMap<String, Object> map) {
		return sql.delete("board.comment.mapper.delete", map)>0 ? true : false;
	}

}
