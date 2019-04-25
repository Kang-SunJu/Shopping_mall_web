package notice.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import notice.vo.NoticePageVO;
import notice.vo.NoticeVO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Autowired private SqlSession sql;
	
	@Override
	public boolean insert(NoticeVO vo) {
		return sql.insert("notice.mapper.insert", vo)> 0 ? true : false;
	}

	@Override
	public List<NoticeVO> list() {
		return sql.selectList("notice.mapper.list");
	}

	@Override
	public NoticeVO detail(int id) {
		return sql.selectOne("notice.mapper.detail", id);
	}

	@Override
	public boolean update(NoticeVO vo) {
		return sql.update("notice.mapper.update", vo)>0 ? true : false;
	}

	@Override
	public boolean delete(int id) {
		return sql.delete("notice.mapper.delete", id)>0 ? true : false;
	}

	@Override
	public void readCount(int id) {
		sql.update("notice.mapper.readCount", id);
	}

	@Override
	public boolean reply_insert(NoticeVO vo) {
		return sql.insert("notice.mapper.reply_insert", vo)>0 ? true : false;
	}

	@Override
	public List<NoticeVO> list(HashMap<String, String> map) {
		return sql.selectList("notice.mapper.list", map);
	}

	@Override
	public NoticePageVO list(NoticePageVO page) {
		//총목록의수를 조회한다.
		int total = (Integer)sql.selectOne(
				"notice.mapper.total", page);
		page.setTotalList(total);
		
		List<NoticeVO> list 
			= sql.selectList("notice.mapper.list", page);
		page.setList(list);
		
		return page;
	}

}
