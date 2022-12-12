package com.example.project.model.notice.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.example.project.model.notice.dto.NoticeDTO;

public interface NoticeDAO {
	public List<NoticeDTO> listAll(int start, int end) throws Exception;//목록
	
	public int noticeArticle() throws Exception;// 게시물 갯수 카운팅
	
	public void insert(NoticeDTO dto) throws Exception;//게시물 작성
	
	public void increaseViewcnt(int bno);//조회수 증가

	public NoticeDTO read(int bno);

	public void update(NoticeDTO dto);

	public void delete(int bno);
}
