package board.service;

import java.util.HashMap;
import java.util.List;

import board.vo.BoardCommentVO;


public interface BoardCommentService {
	boolean insert(HashMap<String, Object> map);
	List<BoardCommentVO> list(HashMap<String, Object> map);
	boolean update(BoardCommentVO vo);
	boolean delete(HashMap<String, Object> map);
}
