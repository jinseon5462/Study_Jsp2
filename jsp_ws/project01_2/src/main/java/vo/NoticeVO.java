package vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class NoticeVO {
	private int num;
	private String title;
	private String content;
	private String grade;
	private String regdate;
}
