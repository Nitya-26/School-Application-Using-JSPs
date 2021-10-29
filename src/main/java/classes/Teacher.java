package classes;

import java.util.Date;

/**
 * Teacher class extends User and have its own field Subject
 * @author nbchan
 *
 */
public class Teacher extends User {
	private String subject;
	
	public Teacher(String firstName, String lastName, String middleName, Date dateOfBirth, String email, String password, String phoneNo,
			String gender, String address, String role, String subject) {
		super(firstName, lastName, middleName, dateOfBirth, email, password, phoneNo, gender, address, role);
		this.subject = subject;
	}

	public Teacher() {
	}

	
	public String getRole() {
		return "teacher";
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String aSubject) {
		this.subject = aSubject;
	}

	@Override
	public String toString() {
		return "Teacher [Id=" + getId() + ", FirstName=" + getFirstName()
				+ ", LastName=" + getLastName() + ", MiddleName=" + getMiddleName() + ", DateOfBirth="
				+ getDateOfBirth() + ", Email=" + getEmail() + ", PhoneNo=" + getPhoneNo() + ", Gender="
				+ getGender() + ", Address=" + getAddress() + ", Subject=" + getSubject() +", Role=" + getRole() + "]";
	}
}
