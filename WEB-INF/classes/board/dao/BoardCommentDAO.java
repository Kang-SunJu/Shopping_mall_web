package board.dao;

import java.util.HashMap;
import java.util.List;

import board.vo.BoardCommentVO;

public interface BoardCommentDAO {
	boolean insert(HashMap<String, Object> map);
	List<BoardCommentVO> list(int pid);
	boolean update(BoardCommentVO vo);
	boolean delete(int id);
}
