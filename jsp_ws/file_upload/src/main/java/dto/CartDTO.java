package dto;

import lombok.Data;

@Data
public class CartDTO {
	private int cno;
	private String pcode;
	private String pname;
	private int price;
	private String photo;
}
