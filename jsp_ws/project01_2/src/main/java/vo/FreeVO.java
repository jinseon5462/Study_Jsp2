package vo;

import java.util.ArrayList;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class FreeVO {
	private int bno;
	private String title;
	private String content;
	private String id;
	private String univ;
	private String regdate;
	private int view;
	private ArrayList<ReplyVO> replyList;
}
