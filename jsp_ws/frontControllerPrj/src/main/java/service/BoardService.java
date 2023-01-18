package service;

import java.util.ArrayList;
import java.util.List;

import vo.BoardVO;

public class BoardService {
	public List<BoardVO> getMsgList(){
		List<BoardVO> list = new ArrayList<>();
		
		BoardVO b1 = new BoardVO();
		b1.setNum(1);
		b1.setTitle("test01");
		b1.setWriter("user01");
		b1.setContent("test content01");
		
		list.add(b1);
		
		BoardVO b2 = new BoardVO();
		b2.setNum(2);
		b2.setTitle("test02");
		b2.setWriter("user02");
		b2.setContent("test content02");
		
		list.add(b2);
		return list;
	}
	
	public BoardVO getMsg(int num) {
		BoardVO board = new BoardVO();
		board.setNum(num);
		board.setTitle("test03");
		board.setWriter("user03");
		board.setContent("test content03");
		
		return board;
	}
}
