package com.example.project.model.notice.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.project.model.notice.dto.NoticeDTO;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Inject
	SqlSession session;

	@Override
	public List<NoticeDTO> listAll(int start, int end) throws Exception {
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("start", start);
		map.put("end", end);
		return session.selectList("notice.list", map);
	}

	@Override
	public int noticeArticle() throws Exception {
		return session.selectOne("notice.noticeArticle");
	}

	@Override
	public void insert(NoticeDTO dto) throws Exception {
		session.insert("notice.insert", dto);
	}

	@Override
	public void increaseViewcnt(int bno) {
		session.update("notice.increaseViewcnt", bno);
	}

	@Override
	public NoticeDTO read(int bno) {
		return session.selectOne("notice.read", bno);
	}

	@Override
	public void update(NoticeDTO dto) {
		session.update("notice.update", dto);
	}

	@Override
	public void delete(int bno) {
		session.delete("notice.delete", bno);
	}

}
