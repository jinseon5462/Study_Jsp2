package vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor

public class TimetableVO {
	private int tno;
	private String subName;
	private String profName;
	private String day;
	private int startTime;
	private int endTime;
	private String place;
	private String id;
	private String subjectLabel;
}
