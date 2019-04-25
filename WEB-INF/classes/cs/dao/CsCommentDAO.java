package cs.dao;

import java.util.HashMap;
import java.util.List;

import board.vo.BoardCommentVO;
import cs.vo.CsCommentVO;

public interface CsCommentDAO {
	boolean insert(HashMap<String, Object> map);
	List<CsCommentVO> list(int pid);
	boolean update(CsCommentVO vo);
	boolean delete(int id);
}
