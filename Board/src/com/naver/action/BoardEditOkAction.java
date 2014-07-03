package com.naver.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.bean.BoardBean;
import com.naver.controller.CommandAction;
import com.naver.dao.BoardDAO;

public class BoardEditOkAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		int idx = Integer.parseInt(request.getParameter("idx"));
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String cont = request.getParameter("cont");
		
		BoardBean bb =BoardDAO.getInstance().getCont(idx);
		BoardBean eb = new BoardBean();
		eb.setTitle(title); eb.setName(name);
		eb.setCont(cont);
		
		
		request.setAttribute("bb", bb);
//		request.setAttribute("name", name);
//		request.setAttribute("cont", cont);
		
		
		int re = BoardDAO.getInstance().getEdit(eb);
		
		return null;
	}

}
