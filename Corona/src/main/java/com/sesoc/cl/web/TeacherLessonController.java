package com.sesoc.cl.web;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.task.TaskRejectedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sesoc.cl.async.AsyncConfig;
import com.sesoc.cl.connInfo.TeacherConn;
import com.sesoc.cl.connInfo.TeacherConnList;
import com.sesoc.cl.socket.LessonMainSocket;

/**
 * 강의 관련 선생님 쪽 Controller 
 * @author LSY
 */
@Controller
public class TeacherLessonController {
	
	private static final Logger logger = LoggerFactory.getLogger(TeacherLessonController.class);
	
	@Resource
	LessonMainSocket teacherSocket;
	
	/**
	 * 강의 시작 페이지 요청 시 실행
	 * @return 강의 시작 페이지 jsp
	 */
	@RequestMapping(value = "/lessonStart", method = RequestMethod.POST)
	public String viewTeacherLessonPage(
			String teacher_id, 
			String classNum,
			Model model) 
	{
		model.addAttribute("teacher_id", teacher_id);
		model.addAttribute("classNum", classNum);
		return "lesson/teacherSideLesson";
	}
	
	/**
	 * 강의 시작 요청 시 실행
	 * @param teacherConn 선생님의 정보를 담고 있는 VO (반 번호, 선생님 ID, 강의 제목, 선생님 접속 IP)
	 * @return Eclipse 통신용 소켓 생성 및 선생님 정보 저장 성공 유무 (성공 1, 실패 0)
	 */
	@ResponseBody
	@RequestMapping("/startLesson")
	public int startLesson(
			TeacherConn teacherConn
			) 
	{
		int resultInt = 0;
		logger.info(teacherConn.toString());
		if(teacherSocket.getTeacherConn() != null) {
			logger.info(teacherSocket.getTeacherConn().toString());
			return resultInt;
		}
		
		//선생님의 정보를 TeacherConnList 배열에 저장
		TeacherConnList.getList().add(teacherConn);
		
		try {
		    // 등록 가능 여부 체크
		    if (AsyncConfig.isTaskExecute()) {
		        // task 사용 (Eclipse 통신용 서버소켓 생성)
		    	teacherSocket.createServerSocket(teacherConn);
				resultInt = 1;
		    } else {
		        System.out.println("==============>>>>>>>>>>>> THREAD 개수 초과");
		    }
		} catch (TaskRejectedException e) {
		    // TaskRejectedException : 개수 초과시 발생
		    System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
		    System.out.println("TaskRejectedException : 등록 개수 초과");
		    System.out.println("==============>>>>>>>>>>>> THREAD END");
		}
		
		return resultInt;
	}
	
	@ResponseBody
	@RequestMapping("/cancelLesson")
	public int cancelLesson() {
		int resultInt = 0;
		
		try {
		    // 등록 가능 여부 체크
		    if (AsyncConfig.isTaskExecute()) {
		        // task 사용
		    	teacherSocket.cancelLesson();
				resultInt = 1;
		    } else {
		        System.out.println("==============>>>>>>>>>>>> THREAD 개수 초과");
		    }
		} catch (TaskRejectedException e) {
		    // TaskRejectedException : 개수 초과시 발생
		    System.out.println("==============>>>>>>>>>>>> THREAD ERROR");
		    System.out.println("TaskRejectedException : 등록 개수 초과");
		    System.out.println("==============>>>>>>>>>>>> THREAD END");
		}
		
		return resultInt;
	}
}
