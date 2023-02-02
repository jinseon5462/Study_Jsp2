package common;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data

public class UserVO {
	private String id;
	private String pw;
	private String name;
	private String tel;
	private String univ;
	private String grade;
}
