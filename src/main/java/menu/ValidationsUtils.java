package menu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import application.SchoolApp;

/**
 * Class has various methods to check input and validate.
 * @author nbchan
 *
 */
public class ValidationsUtils {
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	
	/**
	 * Method checks if the input is empty
	 * @return
	 * @throws IOException
	 */
	public String checkNamesAddressSubject() throws IOException {
		String name = br.readLine();
		if(name.isEmpty()) {
			System.out.println("This Field is Mandatory and should not be empty\nRe - Enter");
			return checkNamesAddressSubject();
		} else {
			return name;
		}
	}
	
	/**
	 * Method to check the date of birth is given correctly or not.
	 * @return
	 * @throws IOException
	 */
	public Date checDob() throws IOException {
		String date = br.readLine();
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy");
		Date date2 = new Date();
		try {
		    date2 = dateFormat.parse(date);
		} catch (ParseException e) {
			System.out.println(e.getMessage());
			return checDob();
		}
		return date2;
	}

	/**
	 * Method which checks that user has given a valid Email id or not. If not the console prompts to re-enter the email.
	 * @return
	 * @throws IOException
	 */
	public String checkEmail() throws IOException {
		String email = br.readLine();
		if(email.isEmpty()) {
			System.out.println("This Field is Mandatory and should not be empty\nRe - Enter");
			return checkEmail();
		}
		if(!(email.contains("@"))) {
			System.out.println("Incorrect Email Format should contain '@'. Please check and re-enter!!");
			return checkEmail();
		}
		if(SchoolApp.userDatabase.stream().filter(u -> u.getEmail().equalsIgnoreCase(email)).findAny().isPresent()) {
			System.out.println("Email Already exists. Try another!!!!");
			return checkEmail();
		}
		else {
			return email;
		}
	}

	/**
	 * Method which checks that user has given a valid Phone number or not. If not, the console prompts to re-enter the phonenumber.
	 * @return
	 * @throws IOException
	 */
	public String checkPhoneNo() throws IOException {
		String phoneNo = br.readLine();
		if(phoneNo.isEmpty()) {
			System.out.println("This Field is Mandatory and should not be empty\nRe - Enter");
			return checkPhoneNo();
		}
		if(!(phoneNo.length()==10)) {
			System.out.println("Phone number should have 10 digits\nRe - Enter");
			return checkPhoneNo();
		}
		if(SchoolApp.userDatabase.stream().filter(u -> u.getPhoneNo().equalsIgnoreCase(phoneNo)).findAny().isPresent()) {
			System.out.println("Phone number Already exists. Try another!!!!");
			return checkPhoneNo();
		}
		else {
			return phoneNo;
		}
	}
	
	/**
	 * Method which checks that user has given a valid Gender or not. If not, the console prompts to re-enter the gender.
	 * @return
	 * @throws IOException
	 */
	public String checkGender() throws IOException {
		String gender = br.readLine();
		if(gender.isEmpty()) {
			System.out.println("This Field is Mandatory and should not be empty\nRe - Enter");
			return checkGender();
		}
		if(!(gender.equalsIgnoreCase("male") || gender.equalsIgnoreCase("female"))) {
			System.out.println("Gender should be either Male or Female. Re-enter.");
			return checkGender();
		}
		else {
			return gender;
		}
	}
	
	public boolean checkEmailDuplicate(String email) {
		if(SchoolApp.userDatabase.stream().filter(u -> u.getEmail().equalsIgnoreCase(email)).findAny().isPresent()) {
			System.out.println("Email Already exists. Try another!!!!");
			return false;
		}
		else {
			return true;
		}
	}
	
	public boolean checkPhoneDuplicate(String phoneNo) {
		if(SchoolApp.userDatabase.stream().filter(u -> u.getPhoneNo().equalsIgnoreCase(phoneNo)).findAny().isPresent()) {
			System.out.println("Phone number Already exists. Try another!!!!");
			return false;
		}
		else {
			return true;
		}
	}

}
