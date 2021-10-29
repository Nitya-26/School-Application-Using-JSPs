package menu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import application.SchoolApp;
import classes.Teacher;
import classes.User;

/**
 * Adding user details based on user input
 * @author nbchan
 *
 */

public class UserRegistration {
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	
	/**
	 * Method adds a custom user which is common for all three users
	 * @param aUser
	 * @throws IOException
	 */
	
	public void addUser(User aUser) throws IOException {
		ValidationsUtils validationsUtils = new ValidationsUtils();
		
		System.out.print("Enter first name: ");
		aUser.setFirstName(validationsUtils.checkNamesAddressSubject());
		System.out.print("\nEnter last name: ");
		aUser.setLastName(validationsUtils.checkNamesAddressSubject());
		System.out.print("\nEnter middle name: ");
		aUser.setMiddleName(br.readLine());
		System.out.println("\nEnter Date of Birth (dd-MMM-yyy): ");
		aUser.setDateOfBirth(validationsUtils.checDob());
		System.out.print("\nEnter Email: ");
		aUser.setEmail(validationsUtils.checkEmail());
		System.out.println("\nEnter Phone no.: ");
		aUser.setPhoneNo(validationsUtils.checkPhoneNo());
		System.out.println("\nEnter Gender(male or female) :");
		aUser.setGender(validationsUtils.checkGender());
		System.out.print("\nEnter Address: ");
		aUser.setAddress(validationsUtils.checkNamesAddressSubject());
		aUser.setRole(aUser.getRole());
	}
	
	/**
	 * Method for teacher registration. As it contains some extra fields.
	 * @param aUser
	 * @throws IOException
	 */
	public void teacherRegistration(Teacher aUser) throws IOException {
		ValidationsUtils validationsUtils = new ValidationsUtils();
		
		addUser(aUser);
		System.out.println("Enter Subject: ");
		if(aUser.getRole().equals("headmaster")) {
			aUser.setSubject(br.readLine());
		} else {
			aUser.setSubject(validationsUtils.checkNamesAddressSubject());
		}
	}
	
	/**
	 *  The method which searches for user given keyword in the entire databases and returns the specific data.
	 * @param aDetails
	 * @param aDataBase
	 */
	public List<User> checkDetailsInDatabase(String aDetails) {
		List<User> matchingList = new ArrayList<User>();
		// User given string should not be less than 3 characters
		if(aDetails.length()<3) {
			System.out.println("Search key Must be atleast 3 characters");
		} else {
			matchingList = SchoolApp.userDatabase.stream().filter(user -> user.getFirstName().toLowerCase().contains(aDetails) || 
					user.getLastName().toLowerCase().contains(aDetails)|| user.getMiddleName().toLowerCase().contains(aDetails) || 
					user.getDateOfBirth().toString().toLowerCase().contains(aDetails) ||user.getEmail().toLowerCase().contains(aDetails) || 
					user.getPhoneNo().toLowerCase().contains(aDetails) || user.getAddress().toLowerCase().contains(aDetails)).collect(Collectors.toList());
		}
		return matchingList;
	}
}
