package com.sesoc.cl.connInfo;

import java.util.ArrayList;
import java.util.List;

/**
 * 현재 접속 학생의 정보를 담고있는 List
 * @author LSY
 */
public class StudentConnList {
	
	private static List<StudentConn> List = new ArrayList<>();

	public StudentConnList() {
		super();
		// TODO Auto-generated constructor stub
	}

	public static List<StudentConn> getList() {
		return List;
	}

	public static void setList(List<StudentConn> list) {
		List = list;
	}

}
