package dto;

import lombok.Data;

@Data
public class ProductDTO {
	private String pcode;
	private String pname;
	private int price;
	private String pinfo;
	private String photo;
}
