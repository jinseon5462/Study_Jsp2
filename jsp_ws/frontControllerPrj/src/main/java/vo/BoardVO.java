package vo;

import lombok.Data;

@Data
public class BoardVO {
	private int num;
	private String writer;
	private String title;
	private String content;
}
