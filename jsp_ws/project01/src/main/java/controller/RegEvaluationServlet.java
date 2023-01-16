package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.EvaluationVO;
import db.EvaluationDAO;

@WebServlet("/regEvaluation.do")
public class RegEvaluationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	EvaluationDAO dao = new EvaluationDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EvaluationVO eval = new EvaluationVO();
		
		eval.setSubjectName(request.getParameter("subjectName"));
		eval.setProfessorName(request.getParameter("professorName"));
		int year = Integer.parseInt(request.getParameter("year"));
		eval.setYear(year);
		eval.setSemester(request.getParameter("semester"));
		eval.setSubjectType(request.getParameter("subjectType"));
		int score = Integer.parseInt(request.getParameter("score"));
		eval.setScore(score);
		eval.setEvalTitle(request.getParameter("evalTitle"));
		eval.setEvalContent(request.getParameter("evalContent"));
		eval.setId(request.getParameter("id"));
		eval.setUniv(request.getParameter("univ"));
		
	}
}
