package notice.vo;

import java.util.List;

import org.springframework.stereotype.Component;

import common.vo.PageVO;

@Component
public class NoticePageVO extends PageVO {
	private List<NoticeVO> list;

	public List<NoticeVO> getList() {
		return list;
	}

	public void setList(List<NoticeVO> list) {
		this.list = list;
	}
}
