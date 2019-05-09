package board.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import board.dao.BoardDAO;
import board.vo.BoardPageVO;
import board.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Override
	public boolean insert(BoardVO vo) {
		return dao.insert(vo);
	}

	@Autowired private BoardDAO dao;
	
	@Override
	public BoardPageVO list(BoardPageVO vo) {
		return dao.list(vo);
	}

	@Override
	public BoardVO detail(HashMap<String, Object> map) {
		return dao.detail(map);
	}

	@Override
	public boolean update(BoardVO vo) {
		return dao.update(vo);
	}

	@Override
	public void readCount(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean delete(HashMap<String, Object> map) {
		return dao.delete(map);
	}

}
