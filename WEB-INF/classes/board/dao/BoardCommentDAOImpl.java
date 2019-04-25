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
	public List<BoardCommentVO> list(int pid) {
		return sql.selectList("board.comment.mapper.list", pid);
	}

	@Override
	public boolean update(BoardCommentVO vo) {
		return sql.update("board.comment.mapper.update", vo)>0 ? true : false;
	}

	@Override
	public boolean delete(int id) {
		return sql.delete("board.comment.mapper.delete", id)>0 ? true : false;
	}

}
