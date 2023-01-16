package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ReplyVO;
import db.ReplyDAO;

@WebServlet("/regReply.do")
public class RegReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ReplyDAO dao = new ReplyDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyVO reply = new ReplyVO();
		reply.setId(request.getParameter("id"));
		reply.setContent(request.getParameter("content"));
		reply.setUniv(request.getParameter("univ"));
		reply.setBno(Integer.parseInt(request.getParameter("bno")));
		
		int result = dao.insert(reply);
		PrintWriter out = response.getWriter();
		out.print(result);
	}
}
