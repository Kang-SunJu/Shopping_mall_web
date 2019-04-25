package cs.service;

import java.util.HashMap;
import java.util.List;


import cs.vo.CsCommentVO;


public interface CsCommentService {
	boolean insert(HashMap<String, Object> map);
	List<CsCommentVO> list(int pid);
	boolean update(CsCommentVO vo);
	boolean delete(int id);
}
