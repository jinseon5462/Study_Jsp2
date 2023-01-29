package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.FreeDAO;

@WebServlet("/deletePost.do")
public class DeletePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FreeDAO dao = new FreeDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		int result = dao.removeInfo(bno);
		
		PrintWriter out = response.getWriter();
		out.print(result);
	}

}
