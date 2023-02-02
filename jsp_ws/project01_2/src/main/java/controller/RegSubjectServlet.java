package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.TimetableDAO;
import vo.TimetableVO;

@WebServlet("/regSubject.do")
public class RegSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TimetableDAO dao = new TimetableDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		TimetableVO table = new TimetableVO();
		table.setSubName(request.getParameter("subName"));
		table.setProfName(request.getParameter("profName"));
		table.setDay(request.getParameter("day"));
		table.setStartTime(Integer.parseInt(request.getParameter("startHour")));
		table.setEndTime(Integer.parseInt(request.getParameter("endHour")));
		table.setPlace(request.getParameter("place"));
		table.setId(request.getParameter("id"));
		table.setColor(request.getParameter("color"));
		
		int result = dao.insert(table);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
