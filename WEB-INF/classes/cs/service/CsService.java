package cs.service;


import cs.vo.CsPageVO;
import cs.vo.CsVO;

public interface CsService {
	//CRUD
	boolean insert(CsVO vo, String subject);
	
	CsPageVO list(CsPageVO vo,String subject);
	CsVO detail(int id, String subject);
	boolean update(CsVO vo,String subject);
	void readCount(int id);
	boolean delete(int id, String subject);
}

