package cs.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cs.dao.CsDAO;
import cs.vo.CsPageVO;
import cs.vo.CsVO;

@Service
public class CsServiceImpl implements CsService {

	@Override
	public boolean insert(CsVO vo, String subject) {
		return dao.insert(vo,subject);
	}

	@Autowired private CsDAO dao;
	
	@Override
	public CsPageVO list(CsPageVO vo,String subject) {
		return dao.list(vo,subject);
	}

	@Override
	public CsVO detail(int id, String subject) {
		return dao.detail(id,subject);
	}

	@Override
	public boolean update(CsVO vo, String subject) {
		return dao.update(vo,subject);
	}

	@Override
	public void readCount(int id) {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean delete(int id, String subject) {
		return dao.delete(id, subject);
	}

}
