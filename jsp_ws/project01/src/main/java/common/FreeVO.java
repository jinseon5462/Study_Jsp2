package common;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class FreeVO {
	private int num;
	private String title;
	private String content;
	private String writer;
	private String univ;
	private Date regdate;
	private int view;
}
