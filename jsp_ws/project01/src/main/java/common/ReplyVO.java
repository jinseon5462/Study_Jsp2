package common;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class ReplyVO {
	private int rno;
	private int bno;
	private String content;
	private String id;
	private String univ;
	private Timestamp regdate;
}
