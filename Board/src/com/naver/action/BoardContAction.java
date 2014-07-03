package com.naver.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.bean.BoardBean;
import com.naver.controller.CommandAction;
import com.naver.dao.BoardDAO;

public class BoardContAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
			int idx = Integer.parseInt(request.getParameter("idx"));
			BoardDAO.getInstance().updateHit(idx);
			
		
			BoardBean bcont = BoardDAO.getInstance().getCont(idx);
			
			request.setAttribute("bcont", bcont);
			
		return "./jsp/board_cont.jsp";
	}

}
