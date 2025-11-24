package project.model;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserModel implements Serializable{
	private static final long serialVersionUID = 1L;

	private int id;

	private String email;

	private String fullname;

	private String password;
	
	private String phone;
	
	private String images;
}
