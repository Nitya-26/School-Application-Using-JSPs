package classes;

import java.util.Date;
/**
 * Template Class which is used to create student or teacher or headmaster
 * @author nbchan
 *
 */

public class User {
	private Integer id;
	private String firstName;
	private String lastName;
	private String middleName;
	private Date dateOfBirth;
	private String email;
	private String password;
	private String phoneNo;
	private String gender;
	private String address;
	private String role;
	
	public User() {
		
	}
	
	public User(String firstName, String lastName, String middleName, Date dateOfBirth, String email,
			String password, String phoneNo, String gender, String address, String role) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.middleName = middleName;
		this.dateOfBirth = dateOfBirth;
		this.email = email;
		this.password = password;
		this.phoneNo = phoneNo;
		this.gender = gender;
		this.address = address;
		this.role = role;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer aId) {
		this.id = aId;
	}
	
	public String getFirstName() {
		return firstName;
	}
	
	public void setFirstName(String aFirstName) {
		this.firstName = aFirstName;
	}
	
	public String getLastName() {
		return lastName;
	}
	
	public void setLastName(String aLastName) {
		this.lastName = aLastName;
	}
	
	public String getMiddleName() {
		return middleName;
	}
	
	public void setMiddleName(String aMiddleName) {
		this.middleName = aMiddleName;
	}
	
	public Date getDateOfBirth() {
		return dateOfBirth;
	}
	
	public void setDateOfBirth(Date aDateOfBirth) {
		this.dateOfBirth = aDateOfBirth;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String aEmail) {
		this.email = aEmail;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhoneNo() {
		return phoneNo;
	}
	
	public void setPhoneNo(String aPhoneNo) {
		this.phoneNo = aPhoneNo;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String aGender) {
		this.gender = aGender;
	}
	
	public String getAddress() {
		return address;
	}
	
	public void setAddress(String aAddress) {
		this.address = aAddress;
	}

	public String getRole() {
		return role;
	}
	
	public void setRole(String aRole) {
		this.role = aRole;
	}
}
