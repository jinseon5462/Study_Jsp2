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

import db.HotDAO;
import vo.FreeVO;

@WebServlet("/getHotList.do")
public class GetHotListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	HotDAO dao = new HotDAO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String univ = request.getParameter("univ");
		ArrayList<FreeVO> list = dao.getHotList(univ);
		JSONArray arr = new JSONArray(list);
		
		PrintWriter out = response.getWriter();
		out.print(arr);
	}

}
