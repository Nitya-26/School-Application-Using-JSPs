package classes;

import java.util.Date;

/**
 * HeadMaster class which extends Teacher as headmaster is same as teacher
 * @author nbchan
 *
 */

public class HeadMaster extends Teacher{
	
	public HeadMaster(String firstName, String lastName, String middleName, Date dateOfBirth, String email,
			String password, String phoneNo, String gender, String address, String role, String subject) {
		super(firstName, lastName, middleName, dateOfBirth, email, password, phoneNo, gender, address, role, subject);
	}

	public HeadMaster() {
	}

	public String getRole() {
		return "headmaster";
	}
	
	@Override
	public String toString() {
		return "HeadMaster [Id=" + getId() + ", FirstName=" + getFirstName()
				+ ", LastName=" + getLastName() + ", MiddleName=" + getMiddleName() + ", DateOfBirth="
				+ getDateOfBirth() + ", Email=" + getEmail() + ", PhoneNo=" + getPhoneNo() + ", Gender="
				+ getGender() + ", Address=" + getAddress() + ", Subject=" + getSubject() +", Role=" + getRole() + "]";
	}
}
