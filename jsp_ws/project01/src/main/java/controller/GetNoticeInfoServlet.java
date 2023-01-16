package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.NoticeVO;
import db.NoticeDAO;

@WebServlet("/getNoticeInfo.do")
public class GetNoticeInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NoticeDAO dao = new NoticeDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeVO notice = dao.getNoticeInfo(num);
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject(notice);
		out.print(obj.toString());
	}
}
