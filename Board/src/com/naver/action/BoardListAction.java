package com.naver.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.bean.BoardBean;
import com.naver.controller.CommandAction;
import com.naver.dao.BoardDAO;

public class BoardListAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");


		List<BoardBean> blist = BoardDAO.getInstance().getList();
		 
			 request.setAttribute("blist", blist);
		  	
			 return "./jsp/board_list.jsp";
	}

}
