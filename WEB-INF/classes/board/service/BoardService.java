package board.service;

import board.vo.BoardPageVO;
import board.vo.BoardVO;

public interface BoardService {
	//CRUD
	boolean insert(BoardVO vo);
	BoardPageVO list(BoardPageVO vo);
	BoardVO detail(int id);
	boolean update(BoardVO vo);
	void readCount(int id);
	boolean delete(int id);
}

