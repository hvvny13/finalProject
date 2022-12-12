package com.example.project.service.notice;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.project.model.notice.dao.NoticeDAO;
import com.example.project.model.notice.dto.NoticeDTO;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Inject
	NoticeDAO noticeDao;

	@Override
	public List<NoticeDTO> listAll(int start, int end) throws Exception {
		return noticeDao.listAll(start,end);
	}

	@Override
	public int noticeArticle() throws Exception {
		return noticeDao.noticeArticle();
	}

	@Override
	public void insert(NoticeDTO dto) throws Exception {
		noticeDao.insert(dto);
	}

	@Override
	public void increaseViewcnt(int bno, HttpSession session) {
		long update_time=0;
		if(session.getAttribute("update_time_"+bno) != null) {
			//최근에 조회수를 올린 시간
			update_time=(long)session.getAttribute("update_time_"+bno);
		}
		long current_time=System.currentTimeMillis();
		//일정 시간이 경과한 후 조회수 증가 처리
		if(current_time - update_time > 5 * 1000) {//24*60*60*1000 (하루)
			noticeDao.increaseViewcnt(bno);
			//조회수를 올린 시간 저장
			session.setAttribute("update_time_"+bno, current_time);
		}
	}

	@Override
	public NoticeDTO read(int bno) {
		return noticeDao.read(bno);
	}

	@Override
	public void update(NoticeDTO dto) {
		noticeDao.update(dto);
	}

	@Override
	public void delete(int bno) {
		noticeDao.delete(bno);
	}

}
