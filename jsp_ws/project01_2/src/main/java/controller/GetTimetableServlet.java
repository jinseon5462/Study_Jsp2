package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import db.TimetableDAO;
import vo.TimetableVO;

@WebServlet("/getTimetable.do")
public class GetTimetableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TimetableDAO dao = new TimetableDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String id = request.getParameter("id");
		ArrayList<TimetableVO> list = dao.getTimetable(id);
		
		PrintWriter out = response.getWriter();
		JSONArray arr = new JSONArray(list);
		out.print(arr.toString());
	}
}
