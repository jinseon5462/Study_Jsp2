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

import common.NoticeVO;
import db.NoticeDAO;

@WebServlet("/getNoticeList.do")
public class GetNoticeListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	NoticeDAO dao = new NoticeDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ArrayList<NoticeVO> list = dao.getNoticeList();
		JSONArray arr = new JSONArray(list);
		PrintWriter out = response.getWriter();
		out.print(arr.toString());
	}
}
