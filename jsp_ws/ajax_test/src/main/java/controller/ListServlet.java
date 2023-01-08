package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/getList.do")
public class ListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("[{\"id\":\"aaa\", \"pw\":\"1111\", \"name\":\"james\", \"tel\":\"010-0000-0000\"},\n"
				+ "{\"id\":\"aaa\", \"pw\":\"1111\", \"name\":\"james2\", \"tel\":\"010-0000-0000\"},\n"
				+ "{\"id\":\"aaa\", \"pw\":\"1111\", \"name\":\"james3\", \"tel\":\"010-0000-0000\"}]");
	}
}
