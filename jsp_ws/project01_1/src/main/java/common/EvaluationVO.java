package common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class EvaluationVO {
	private String subjectName;
	private String professorName;
	private int year;
	private String semester;
	private String subjectType;
	private int score;
	private String evalTitle;
	private String evalContent;
	private String id;
	private String univ;
}
