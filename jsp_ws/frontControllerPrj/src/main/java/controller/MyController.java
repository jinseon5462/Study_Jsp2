package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.BoardService;

@WebServlet("/")
public class MyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int num;
	private String writer;
	private String title;
	private String content;
	
	private void readParam(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		
		String tmp = request.getParameter("num");
		num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp) : 0;
		writer = request.getParameter("writer");
		title = request.getParameter("title");
		content = request.getParameter("content");
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		readParam(request);
		
		// URL에서 프로젝트 이름 뒷부분의 문자열 얻어내기
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);
		
		//주어진 URL에 따라 지정된 동작 수행
		if(com.equals("/list") || com.equals("/")) {
			request.setAttribute("msgList", new BoardService().getMsgList());
			view = "list.jsp";
		}else if(com.equals("/view")) {
			request.setAttribute("msg", new BoardService().getMsg(num));
			view = "view.jsp";
		}else if(com.equals("/any")) {
			view = "redirect:any.jsp";
		}
		
		if(view.startsWith("redirect:")) {
			response.sendRedirect(view.substring(9));
		}else {
			request.getRequestDispatcher(view).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
