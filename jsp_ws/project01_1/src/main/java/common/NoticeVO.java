package common;

import java.sql.Date;

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
	private Date regdate;
}
