package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.NoticeDAO;
import vo.NoticeVO;

@WebServlet("/regNotice.do")
public class RegNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	NoticeDAO dao = new NoticeDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		NoticeVO notice = new NoticeVO();
		notice.setTitle(request.getParameter("title"));
		notice.setContent(request.getParameter("content"));
		notice.setGrade(request.getParameter("grade"));
		int result = dao.insert(notice);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
