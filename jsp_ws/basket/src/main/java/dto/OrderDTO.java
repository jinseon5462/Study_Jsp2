package dto;

import java.sql.Timestamp;

import lombok.Data;
@Data
public class OrderDTO {
	private int orderno;
	private String pcode;
	private Timestamp orderdate;
}
