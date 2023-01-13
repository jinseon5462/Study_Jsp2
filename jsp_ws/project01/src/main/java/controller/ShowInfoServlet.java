package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.FreeVO;
import db.FreeDAO;

@WebServlet("/showInfo.do")
public class ShowInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FreeDAO dao = new FreeDAO();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		FreeVO free = dao.selectOne(title, writer);
		
		JSONObject obj = new JSONObject(free);
		PrintWriter out = response.getWriter();
		out.print(obj.toString());
	}
}
