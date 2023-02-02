package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import db.FreeDAO;
import vo.FreeVO;

@WebServlet("/updatePost.do")
public class UpdatePostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	FreeDAO dao = new FreeDAO();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		int bno = Integer.parseInt(request.getParameter("bno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		FreeVO free = dao.updateInfo(title, content, bno);
		PrintWriter out = response.getWriter();
		JSONObject obj = new JSONObject(free);
		out.print(obj.toString());
	}
}
