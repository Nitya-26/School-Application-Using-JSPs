package application;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import classes.Teacher;
import classes.User;
import menu.UserRegistration;
import menu.UserRegistrationFactory;
/**
 * Main class which pops up a menu for registrations of student, teacher & headmaster
 * @author nbchan
 *
 */

public class SchoolApp {
	public static final ArrayList<User> userDatabase = new ArrayList<>();
	
	public static void main(String[] args) throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String details, option;
		/**
		 * This loop runs continuously by displaying a menu for the user to select some option
		 */
		while(true) {
			System.out.println("\nSelect an Option:\n1. Registration \n2. View Details \n3. All users \nPress any other key to stop");
			option = br.readLine();
		switch(option) {
			// If the Option Selected is 1, then it is related to Registration and three types of users can register.
			case "1":
				UserRegistrationFactory factory = new UserRegistrationFactory();
				UserRegistration registration = new UserRegistration();
				User user = factory.registrationMenu();
				if(user.getRole().equals("teacher") || user.getRole().equals("headmaster")) {
					registration.teacherRegistration((Teacher) user);
				}
				else {
					registration.addUser(user);
				}
				
				//Setting Ids based on elements in database
				if(userDatabase.isEmpty()) {
					user.setId(1);
				} else {
					user.setId(userDatabase.size()+1);
				}
				userDatabase.add(user);
				break;
			// If the Option selected is 2, then the user wants to retrieve some information from the existing data of all three user(Students, Teachers, HeadMaster).
			case "2":
				System.out.print("Enter a Search text to search all Databases: ");
				details = br.readLine();
				UserRegistration userRegistration = new UserRegistration();
				List<User> result = userRegistration.checkDetailsInDatabase(details);
				System.out.print(result);
				break;
			case "3":
				for(User u : userDatabase) {
					System.out.println(u);
				}
				break;
			// If the option other than 1 or 2 is selected, then it means user want to stop the program exection and the program terminates.
			default:
				System.out.println("Program Execution stopped.");
				System.exit(0);
			}
		}
	}
}
