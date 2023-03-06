package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.TimetableDAO;

@WebServlet("/deleteSubject.do")
public class DeleteSubjectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TimetableDAO dao = new TimetableDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String subName = request.getParameter("subName");
		String profName = request.getParameter("profName");
		String place = request.getParameter("place");
		
		int result = dao.deleteSubject(subName, profName, place);
		System.out.println("============================");
		System.out.println(result);
		System.out.println("============================");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
