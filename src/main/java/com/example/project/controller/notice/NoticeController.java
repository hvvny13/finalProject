package com.example.project.controller.notice;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.project.model.notice.dto.NoticeDTO;
import com.example.project.service.notice.NoticeService;
import com.example.project.service.notice.Pager;

@Controller
@RequestMapping("notice/*")
public class NoticeController {
	@Inject
	NoticeService noticeService;
	
	@RequestMapping("list.do") //공지사항 목록(페이징 처리)
	public ModelAndView list(@RequestParam(defaultValue = "1") int curPage, NoticeDTO dto, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		String userid=(String)session.getAttribute("userid");
		dto.setWriter(userid);
		int count=noticeService.noticeArticle();
		Pager pager = new Pager(count, curPage);
		int start=pager.getPageBegin();
		int end=pager.getPageEnd();
		List<NoticeDTO> list=noticeService.listAll(start, end);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("list", list);
		map.put("pager", pager);
		mav.setViewName("notice/list");
		mav.addObject("map", map);
		if(map != null) {
			System.out.println(map);
		}
		return mav;
	}
	
	@RequestMapping("write.do") //글쓰기 페이지로 이동
	public String write() {
		return "notice/write";
	}
	
	@RequestMapping("insert.do") //글쓰기
	public String insert(NoticeDTO dto, HttpSession session) throws Exception {
		String writer=(String)session.getAttribute("userid");
		dto.setWriter(writer);
		noticeService.insert(dto);
		System.out.println(writer);
		return "redirect:/notice/list.do";
	}
	
	@RequestMapping("view.do")//상세보기
	public ModelAndView view(int bno, HttpSession session) throws Exception {
		//조회수 증가
		noticeService.increaseViewcnt(bno, session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("notice/view");
		mav.addObject("dto", noticeService.read(bno));
		return mav;
	}
	
	@RequestMapping("update.do")//수정하기
	public String update(NoticeDTO dto) throws Exception {
		System.out.println("dto: " + dto);
		if(dto != null) {
			noticeService.update(dto);
		}
		return "redirect:/notice/view.do?bno="+dto.getBno();
	}
	
	@RequestMapping("delete.do")//삭제하기
	public String delete(int bno) throws Exception {
		noticeService.delete(bno);
		return "redirect:/notice/list.do";
	}
}
