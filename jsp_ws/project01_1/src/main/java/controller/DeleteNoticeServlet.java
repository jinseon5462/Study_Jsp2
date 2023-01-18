package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.NoticeDAO;

@WebServlet("/deleteNotice.do")
public class DeleteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NoticeDAO dao = new NoticeDAO();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		int result = dao.removeNotice(num);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
