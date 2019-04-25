package board.dao;

import board.vo.BoardPageVO;
import board.vo.BoardVO;

public interface BoardDAO {
	boolean insert(BoardVO vo);
	BoardPageVO list(BoardPageVO vo);
	BoardVO detail(int id);
	boolean update(BoardVO vo);
	void readCount(int id);
	boolean delete(int id);
}
