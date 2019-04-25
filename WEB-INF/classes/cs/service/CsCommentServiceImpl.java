package cs.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cs.dao.CsCommentDAO;
import cs.vo.CsCommentVO;

@Service
public class CsCommentServiceImpl implements CsCommentService {
	@Autowired private CsCommentDAO dao;
	
	@Override
	public boolean insert(HashMap<String, Object> map) {
		return dao.insert(map);
	}

	@Override
	public List<CsCommentVO> list(int pid) {
		return dao.list(pid);
	}

	@Override
	public boolean update(CsCommentVO vo) {
		return dao.update(vo);
	}

	@Override
	public boolean delete(int id) {
		return dao.delete(id);
	}

}
