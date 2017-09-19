package com.sesoc.cl.drive;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.sesoc.cl.util.FileService;


/**
 * Handles requests for the application home page.
 */
@Controller
public class DriveController {
	@Autowired
	DriveRepository repo;
	
	final String uploadPath = "/drivefile";
	
	/*
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		List<Drive> list = repo.selectDriveAll();
		model.addAttribute("list", list);
		return "drive";
	} 
	*/
	
	//업로드 폼으로 이동
	@RequestMapping(value = "driveWrite", method = RequestMethod.GET)
	public String uploadForm(Model model) {
		System.out.println("자료실 글 작성폼으로");
		//model.addAttribute("user_id", user_id);
		return "driveWrite";
	}

	//업로드폼에서 등록버튼을 누르면
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public String upload(Model model,HttpServletRequest request, MultipartFile file1, MultiFiles multiFiles, HttpSession session, String title, String content) {
		System.out.println("upload 컨트롤러 진입");
		int seq = repo.seq();
		System.out.println("시퀀스");
		String user_id = (String) session.getAttribute("loginId");
		Drive drive =  new Drive(seq, 1, user_id , title, content, "", "", "", 0);
		System.out.println("드라이브객체"+drive);
		repo.insert(drive);
		System.out.println("db에 드라이브 객체 저장");
		//파일 다중 첨부시  for문으로 돌려서 insert 저장
		for(MultipartFile file : multiFiles.getFile1()) {
			String originalName = file.getOriginalFilename();
			String savedFileName = FileService.saveFile(file, uploadPath);
			drive.setOriginal_filename(originalName);
			drive.setSaved_filename(savedFileName);
			repo.insert_file(drive);
		}//for
		System.out.println("for문 종료 리스트로");
		return "redirect:boardLocation?status=drive";
	}
	
	
	//수정 폼으로 이동
	@RequestMapping(value = "driveUpdateForm", method = RequestMethod.GET)
	public String updateForm(int num, Model model) {
		Drive drive = repo.selectOne(num);
		List<Drive> list = repo.selectDrive_fileAll(drive.getNum());
		model.addAttribute("drive", drive);
		model.addAttribute("list", list);
		System.out.println("자료실 수정폼으로 이동");
		return "driveUpdate";
	}
	
	//수정
	@RequestMapping(value = "driveUpdate", method = RequestMethod.POST)
	public String update(Model model, MultiFiles multifiles, MultipartFile file1, String user_id, String title, String content,int num, CheckOriginalFileNames fileNames) {
		System.out.println("자료실 driveupdate 진입");
		Drive drive = repo.selectOne(num);
		drive.setTitle(title);
		drive.setContent(content);
		repo.updateOne(drive);
		//게시판 num과 같은 drive_file리스트를 가져옴
		List<Drive> list = repo.selectDrive_fileAll(num);
		//삭제 처리 
		for(Drive driveFile : list) {
			int check = 0; //스위치
			String originalSavedFile = driveFile.getOriginal_filename();
			for(String original_filename : fileNames.getOriginal_filename()) {
				if(originalSavedFile.equals(original_filename)) {
					//첨부된 파일 이름과 DB에 저장된 이름을 검사해서 같으면 스위치 걸어줌
					check = 1;
				}
			}
			if(check == 0) {
				//첨부된 파일이름이 DB안에 없을경우 일단 삭제
				FileService.deleteFile(driveFile.getSaved_filename());
				repo.deleteFile(driveFile.getNum());
			}
		}
		//수정 처리
		if(!(file1 == null)){
			//삽입 처리와 같은 방식으로 수정 처리 시작
		for(MultipartFile file : multifiles.getFile1()) {
			String originalName = file.getOriginalFilename();
			String savedFileName = FileService.saveFile(file, uploadPath);
			drive.setOriginal_filename(originalName);
			drive.setSaved_filename(savedFileName);
			repo.insert_file(drive);
		}
		}
		
		return "redirect:boardLocation?status=drive";
	}
	//게시판 글 자세히 보기
	@RequestMapping(value="driveDetail", method = RequestMethod.GET)
	public String driveDetailForm(int num, Model model) {
		repo.updateHit(num);
		Drive drive = repo.selectOne(num);
		List<Drive> list = repo.selectDrive_fileAll(drive.getNum());
		
		model.addAttribute("drive", drive);
		model.addAttribute("list", list);
		return "driveDetail";
	}
	
	//다운로드 로직
	@RequestMapping(value="download", method=RequestMethod.GET)
	public String download(int num, HttpServletResponse response){
		Drive fileDrive = repo.selectFileOne(num);
		String original_fileName = fileDrive.getOriginal_filename();
		String saved_fileName = fileDrive.getSaved_filename();
		try {
			response.setHeader("Content-Disposition", "attachment; filename=" + URLEncoder.encode(original_fileName, "UTF-8"));
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String fullPath = uploadPath + "/" + saved_fileName;
		//파일 가져오기
		FileInputStream filein = null;
		//브라우저로 내보내기
		ServletOutputStream sout = null;
		try {
			filein = new FileInputStream(fullPath);
			sout = response.getOutputStream();
			FileCopyUtils.copy(filein, sout);
			filein.close();
			sout.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}