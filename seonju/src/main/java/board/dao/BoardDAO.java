package board.dao;


import java.util.HashMap;

import board.vo.BoardPageVO;
import board.vo.BoardVO;

public interface BoardDAO {
	boolean insert(BoardVO vo);
	BoardPageVO list(BoardPageVO vo);
	BoardVO detail(HashMap<String, Object> map);
	boolean update(BoardVO vo);
	void readCount(int id);
	boolean delete(HashMap<String, Object> map);
}
