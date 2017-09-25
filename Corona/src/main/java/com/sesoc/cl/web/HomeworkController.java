package com.sesoc.cl.web;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.cl.dao.ClassRepository;
import com.sesoc.cl.dao.TaskRepository;
import com.sesoc.cl.vo.ClassInfo;
import com.sesoc.cl.vo.Task;
import com.sesoc.cl.vo.Task_Answer;
import com.sesoc.cl.vo.Task_Answers;

@Controller
public class HomeworkController {
	
	@Autowired
	ClassRepository cRepo;
	@Autowired
	TaskRepository tRepo;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeworkController.class);
	
	private List<ClassInfo> myTeacherList;
	private String directory = "C:\\Corona Save Folder\\task\\taskCode";
	
	@RequestMapping(value="/homeworkList", method=RequestMethod.GET)
	public String homeworkList(
			int classNum,
			Model model,
			HttpServletRequest request) 
	{
		listCome(model, request);
		
		//기한 지났으면 다 제출불가 처리 해야한다 여기서!
		int result = tRepo.closed_work();
		if(result != 0) {
//			System.out.println("기한 지난 과제들 제출불가 처리!");
		}
		
		//과제 목록 불러오기
		List<Task> taskInfoList = tRepo.selectAll(classNum);
//		logger.info(taskInfoList.toString());
		
		String position = "student";
		
		for(ClassInfo i : myTeacherList) {
			if(classNum == i.getNum()) {
				position = "teacher";
				break;
			}
		}
		
		model.addAttribute("taskInfoList", taskInfoList);
		model.addAttribute("classNum", classNum);
		model.addAttribute("position", position);
		
		return "homework/homeworkList";
	}
	
	
	@RequestMapping(value="/homeworkCreateForm", method=RequestMethod.GET)
	public String homeworkCreateForm(int classNum,
			Model model,
			HttpServletRequest request) 
	{
//		logger.info("createHomework");
		listCome(model, request);
		model.addAttribute("classNum", classNum);
		model.addAttribute("classFileName", getSavedFileName(classNum));
		return "homework/homeworkCreateForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/createHomework", method=RequestMethod.POST)
	public int createHomework(
			Task task,
			Task_Answers task_answers,
			Model model,
			HttpServletRequest request) 
	{
		int result = 0;
//		logger.info(task.toString());
//		logger.info(task_answers.getInput_answer().toString());
//		logger.info(task_answers.getOutput_answer().toString());
		
		//파일경로 = 루트+filePath + 파일명 + 확장자(java)
		String filepath = directory + "\\" + task.getQuestion_file() + ".java";
		File saveDirectory= new File(directory);
		
		if(!saveDirectory.isDirectory()) {
			saveDirectory.mkdirs();
		}
		
		File file = new File(filepath);
		FileOutputStream fos = null;
		OutputStreamWriter osw = null;
		BufferedWriter bw = null;
		
		try {
			//과제를 파일로 저장 //
			fos = new FileOutputStream(file);
			osw = new OutputStreamWriter(fos);
			bw = new BufferedWriter(osw);
			bw.write(task.getCode(), 0, task.getCode().length());
			
			//저장한 파일을 서버DB에 기록
			task.setQuestion_file(filepath);
			System.out.println(task.toString());
			result = tRepo.insertTask(task);
			
			if(result != 0) {
				
				result = 0;
				
				//과제가 정상적으로 등록되면 과제의 입 출력 해답도 DB에 등록한다.
				Task recent_task = tRepo.recent_task();
				
				List<String> input_answers = task_answers.getInput_answer();
				List<String> output_answers = task_answers.getOutput_answer();
				
				//혹시모르니 예외처리(입력 값과 출력 값의 수가 같을 때만 동작하게 한다)
				if(input_answers.size() == output_answers.size()) {
					for(int i=0; i<input_answers.size(); i++) {
						Task_Answer task_answer = new Task_Answer(0, recent_task.getNum(), input_answers.get(i), output_answers.get(i));
						int result_answer = tRepo.insertAnswer(task_answer);
						if(result_answer != 0) {
//							logger.info("과제의 입출력 값 저장완료!");
							result = 1;
						} else {
//							logger.info("과제의 입출력 값 저장실패.");
							break;
						}
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if(bw != null) bw.close();
				if(osw != null) osw.close();
				if(fos != null) fos.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		if(result == 0) {
			if(file.isFile()) file.delete();
		}
		return result;
	}
	
	
	public String getSavedFileName(int classNum) {
		String result = null;
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy_MM_dd_hh_mm_ss");
		String nowTime = dateFormat.format(cal.getTime());
		result = "Homework_" + classNum + "_" + nowTime;
		return result;
	}
	
	
	public void listCome(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession(); 
		String id = (String)session.getAttribute("loginId");
		model.addAttribute("id", id);
		myTeacherList = cRepo.myTeacherList(id);
		List<ClassInfo> myStudentList = cRepo.myStudentList(id);
		model.addAttribute("myTeacherList", myTeacherList);
		model.addAttribute("myStudentList", myStudentList);
	}
}
