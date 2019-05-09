package board.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import common.vo.PageVO;

@Component
public class BoardPageVO extends PageVO {
	private List<BoardVO> list;
	private String subject;
	
	

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public List<BoardVO> getList() {
		return list;
	}

	public void setList(List<BoardVO> list) {
		this.list = list;
	}
}
