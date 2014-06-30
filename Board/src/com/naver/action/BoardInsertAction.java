package com.naver.action;

import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.bean.BoardBean;
import com.naver.controller.CommandAction;
import com.naver.dao.BoardDAO;

public class BoardInsertAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		PrintWriter out= response.getWriter();
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
//		int idx= 0;
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String cont = request.getParameter("cont");
		String regdate = request.getParameter("regdate");
//		int hit = 0;
			
		BoardBean b = new BoardBean();
		
		b.setTitle(title);  b.setName(name);
		b.setCont(cont); b.setRegdate(regdate);
//		
//		if(title ==""||title==null) out.println("title이 null입니다.");
//		if(name ==""||name==null) out.println("name이 null입니다.");
//		if(regdate ==""||regdate==null) out.println("regdate이 null입니다.");
//		else if(!Pattern.matches("^[0-9*$]",regdate))
//			out.println("숫자 형식이 아닙니다.");
//		if(cont ==""||cont==null) out.println("cont이 null입니다.");
//		
		 int re = BoardDAO.getInstance().InsetB(b);
		 if(re==1){
				out.println("<script>");
				out.println("alert('마success')");
				out.println("location='board_list.do'");
				out.println("</script>");
			}else{
				out.println("<script>");
				out.println("alert('저장실패')");
				out.println("history.go(-1)");
				out.println("</script>");
			}
		return null;
	}
}
