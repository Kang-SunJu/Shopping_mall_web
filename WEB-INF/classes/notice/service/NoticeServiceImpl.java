package notice.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import notice.dao.NoticeDAO;
import notice.vo.NoticePageVO;
import notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired private NoticeDAO dao;
	
	@Override
	public boolean insert(NoticeVO vo) {
		return dao.insert(vo);
	}

	@Override
	public List<NoticeVO> list() {
		return dao.list();
	}

	@Override
	public NoticeVO detail(int id) {
		return dao.detail(id);
	}

	@Override
	public boolean update(NoticeVO vo) {
		return dao.update(vo);
	}

	@Override
	public boolean delete(int id) {
		return dao.delete(id);
	}

	@Override
	public void readCount(int id) {
		dao.readCount(id);
	}

	@Override
	public boolean reply_insert(NoticeVO vo) {
		return dao.reply_insert(vo);
	}

	@Override
	public List<NoticeVO> list(HashMap<String, String> map) {
		return dao.list(map);
	}

	@Override
	public NoticePageVO list(NoticePageVO page) {
		return dao.list(page);
	}
	
}
