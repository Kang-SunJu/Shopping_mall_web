package notice.service;

import java.util.HashMap;
import java.util.List;

import notice.vo.NoticePageVO;
import notice.vo.NoticeVO;

public interface NoticeService {
	//CRUD: create, read, update, delete
	boolean insert(NoticeVO vo);
	List<NoticeVO> list();
	List<NoticeVO> list(HashMap<String, String> map);
	NoticePageVO list(NoticePageVO page);
	NoticeVO detail(int id);
	boolean update(NoticeVO vo);
	boolean delete(int id);
	//��ȸ�� ����ó��
	void readCount(int id);
	//�������ó��
	boolean reply_insert(NoticeVO vo);
}
