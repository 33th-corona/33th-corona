package com.sesoc.cl.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;



@Controller
public class BoardController {
	
	@Autowired
	BoardRepository repo;
	
	@Autowired
	Board_ReplyRepository rr;
	
	
	@RequestMapping(value="/bbbiii")
	public String boardList(
			@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			@RequestParam(value="searchtype", defaultValue="title") String searchtype,
			@RequestParam(value="searchword",defaultValue="") String searchword,
			@RequestParam(value="countpage", defaultValue="10") int countPerPage,
			Model model, String status) {
		System.out.println("보드 리스트 컨트롤러");
		/* 전체 글 개수
		int totalRecordCount = repo.getBoardCount(searchtype,searchword);
		PageNavigator navi = new PageNavigator(currentPage, totalRecordCount,countPerPage);
		//게시글 리스트 호출
		List<Board> boardList = repo.findAll(searchtype,searchword,navi.getStartRecord(),navi.getCountPerPage());
		model.addAttribute("navi",navi);
		model.addAttribute("boardList",boardList);
		model.addAttribute("countpage",countPerPage);
		*/
		
		
		model.addAttribute("searchword",searchword);
		model.addAttribute("searchtype",searchtype);
		model.addAttribute("status",status);
		
		return "boardForm";
	}
	
	@RequestMapping("/boardDetail")
	public String boardDetail(int num, Model model, String status){
		System.out.println("디테일 컨트롤러");
		Board board = repo.findOne(num);
		repo.updateHits(num); //조회수 업데이트
		model.addAttribute("board",board);
		model.addAttribute("status", status);
		System.out.println(board+"/"+status);
		return "boardDetail";
	}
	
	@RequestMapping("/boardWrite")
	public String boardWrite(){
		return "boardWrite";
	}
	
	@RequestMapping(value = "/boardWrite", method=RequestMethod.POST)
	public String boardWrite(Board board, HttpSession session,HttpServletRequest request){
		String user_id = (String) session.getAttribute("loginId");
		board.setUser_id(user_id);
		//class_num는 임시 테스트용으로 1 삽입
		board.setClass_num(1);
		System.out.println("보드 객체 : "+board);
		repo.insertBoard(board);
		return "redirect:boardLocation?status=normal";
	}
	
	@RequestMapping(value="/boardUpdateForm", method=RequestMethod.POST)
	public String boardUpdate(int num, Model model){
		System.out.println("업데이트폼 컨트롤러");
		Board board = repo.findOne(num);
		model.addAttribute("board",board);
		return "boardUpdate";
	}
	
	@RequestMapping(value="/boardUpdate", method=RequestMethod.POST)
	public String boardUpdate(Board board, RedirectAttributes ra){
		System.out.println("업데이트 컨트롤러"+board);
		repo.updateBoard(board);
		ra.addAttribute("num",board.getNum());
		return "redirect:boardDetail";
	}
	
	@RequestMapping(value="/deleteForm", method=RequestMethod.GET)
	public String boardDelete(Board board){
		repo.deleteForm(board.getNum());
		return "redirect:boardList";
	}
	
	//한 페이지의 게시글 출력수 조정 메소드
	@RequestMapping("/pagechange")
	public String pagechange(RedirectAttributes ra,String selectpage,
			@RequestParam(value="currentPage", defaultValue="1") int currentPage, 
			@RequestParam(value="searchtype", defaultValue="title") String searchtype,
			@RequestParam(value="searchword",defaultValue="") String searchword){
		ra.addAttribute("countpage", selectpage);
		return "redirect:boardList";
	}
	
}
