package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.FreeVO;
import db.FreeDAO;

@WebServlet("/regFree.do")
public class RegFreeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FreeDAO dao = new FreeDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FreeVO free = new FreeVO();
		free.setTitle(request.getParameter("title"));
		free.setContent(request.getParameter("content"));
		free.setWriter(request.getParameter("writer"));
		free.setUniv(request.getParameter("univ"));
		int result = dao.insert(free);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
