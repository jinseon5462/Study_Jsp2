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

import common.ReplyVO;
import db.ReplyDAO;

@WebServlet("/getReply.do")
public class GetReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	ReplyDAO dao = new ReplyDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bno = Integer.parseInt(request.getParameter("bno"));
		ArrayList<ReplyVO> list = dao.getReply(bno);

		PrintWriter out = response.getWriter();
		JSONArray arr = new JSONArray(list);
		out.print(arr);
	}
}
