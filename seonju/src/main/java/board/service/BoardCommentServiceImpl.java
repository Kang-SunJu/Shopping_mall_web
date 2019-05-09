package board.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardCommentDAO;
import board.vo.BoardCommentVO;

@Service
public class BoardCommentServiceImpl implements BoardCommentService {
	@Autowired private BoardCommentDAO dao;
	
	@Override
	public boolean insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}

	@Override
	public List<BoardCommentVO> list(HashMap<String, Object> map) {
		return dao.list(map);
	}

	@Override
	public boolean update(BoardCommentVO vo) {
		return dao.update(vo);
	}

	@Override
	public boolean delete(HashMap<String, Object> map) {
		return dao.delete(map);
	}

}
