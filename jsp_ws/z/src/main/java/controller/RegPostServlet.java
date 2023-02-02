package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.FreeDAO;
import vo.FreeVO;

@WebServlet("/regPost.do")
public class RegPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FreeDAO dao = new FreeDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		FreeVO free = new FreeVO();
		free.setTitle(request.getParameter("title"));
		free.setContent(request.getParameter("content"));
		free.setId(request.getParameter("id"));
		free.setUniv(request.getParameter("univ"));
		int result = dao.insert(free);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
