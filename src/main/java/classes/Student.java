package classes;

import java.util.Date;

/**
 * Student class which extends User
 * @author nbchan
 *
 */
public class Student extends User{
	
	public Student(String firstName, String lastName, String middleName, Date dateOfBirth, String email, String password, String phoneNo,
			String gender, String address, String role) {
		super(firstName, lastName, middleName, dateOfBirth, email, password, phoneNo, gender, address, role);
		
	}

	public Student() {
		
	}

	public String getRole() {
		return "student";
	}

	@Override
	public String toString() {
		return "Student [Id=" + getId() + ", FirstName=" + getFirstName()
				+ ", LastName=" + getLastName() + ", MiddleName=" + getMiddleName() + ", DateOfBirth="
				+ getDateOfBirth() + ", Email=" + getEmail() + ", PhoneNo=" + getPhoneNo() + ", Gender="
				+ getGender() + ", Address=" + getAddress() + ", Role=" + getRole() + "]";
	}
	
}
