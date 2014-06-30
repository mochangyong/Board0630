package com.naver.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.naver.controller.CommandAction;
import com.naver.dao.BoardDAO;

public class BoardDelAction implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest request,
			HttpServletResponse response) throws Throwable {
		int idx = Integer.parseInt(request.getParameter("idx"));
		PrintWriter out=response.getWriter();
		
//		BoardBean b= new BoardBean();
//		b.setIdx(idx);
		int re = BoardDAO.getInstance().deleteBoard(idx);//4시 10분까지 작성.
		//글번호를 기준으로 레코드 삭제
		if(re==1){
			response.sendRedirect("board_list.do");//목록으로 이동
		}else{
			out.println("<script>");
			out.println("alert('삭제에 실패했습니다!')");
			out.println("history.go(-1)");
			out.println("</script>");
		
		
	}
		return null;

}
}
