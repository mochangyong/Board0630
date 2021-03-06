package com.naver.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.naver.bean.BoardBean;

public class BoardDAO extends CommonDAO {
	public static BoardDAO getInstance() {
		BoardDAO _instance = new BoardDAO();
		return _instance;
	}

	public List<BoardBean> getList() throws SQLException {

		ResultSet rs = null;
		List<BoardBean> blist = new ArrayList<BoardBean>();
		String sql = "select * from board order by idx desc";
		rs = openConnection().executeQuery(sql);
		while (rs.next()) {
			BoardBean b = new BoardBean();
			b.setIdx(rs.getInt("idx"));
			b.setTitle(rs.getString("title"));
			b.setName(rs.getString("name"));
			b.setRegdate(rs.getString("regdate"));
			b.setHit(rs.getInt("hit"));
			blist.add(b);
		}
		closeConnection();
		return blist;
	}

	public int InsetB(BoardBean b) throws SQLException {
		int re = -1;

		String sql = "insert into board (idx , title , name , cont, regdate ) "
				+ "values( board_seq.nextval ,'" + b.getTitle() + "', '"
				+ b.getName() + "','" + b.getCont() + "',sysdate)";

		re = openConnection().executeUpdate(sql);
		closeConnection();
		return re;
	}

	public BoardBean getCont(int idx) throws SQLException {
		ResultSet rs = null;
		BoardBean b = null;
		String sql = "select * from board where idx =" + idx;

		rs = openConnection().executeQuery(sql);
		while (rs.next()) {
			b = new BoardBean();
			b.setIdx(rs.getInt("idx"));
			b.setName(rs.getString("name"));
			b.setRegdate(rs.getString("regdate"));
			b.setHit(rs.getInt("hit"));
			b.setTitle(rs.getString("title"));
			b.setCont(rs.getString("cont"));

		}
		closeConnection();

		return b;
	}

	public int deleteBoard(int idx) throws SQLException {
		int re = -1;
		String sql = "delete from board where idx = " + idx;
		re = openConnection().executeUpdate(sql);
		closeConnection();

		return re;
	}

	// "update board set board_name='"+eb.getBoard_name()
	// +"',board_title='"+eb.getBoard_title()+"',board_cont='"
	// +eb.getBoard_cont()+"' where board_no="+eb.getBoard_no();
	public int getEdit(BoardBean eb) throws SQLException {
		int re = -1;
		String sql = "update board set title='" + eb.getTitle() + "',name='"
				+ eb.getName() + "',cont = '" + eb.getCont();
		re = openConnection().executeUpdate(sql);
		closeConnection();

		return re;
	}

	public void updateHit(int idx) throws SQLException {
		BoardBean b = BoardDAO.getInstance().getCont(idx);
		int hit = b.getHit() + 1;

		// System.out.println(hit);
		String sql = "update board set hit ='" + hit + "'where idx =" + idx;

		openConnection().executeUpdate(sql);
		closeConnection();
	}

}