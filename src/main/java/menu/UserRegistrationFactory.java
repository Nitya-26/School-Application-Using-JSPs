package menu;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

import classes.HeadMaster;
import classes.Student;
import classes.Teacher;
import classes.User;

/**
 * Factory class which decides which instance to create based on user input.
 * @author nbchan
 *
 */

public class UserRegistrationFactory {
	
	/**
	 * Method returns a instance of user based on the input
	 * @return
	 * @throws IOException
	 */
	public User registrationMenu() throws IOException {
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		String ch;
		do {
			System.out.println("Select an option for Registration:\n"
					+ "1. Student Registration\n2. Teacher Registration\n3. HeadMaster Regsitration");
			ch = br.readLine();
			switch(ch) {
			case "1":
				System.out.println("*****WELCOME TO STUDENT REGISTRATION*****");
				return new Student();
			case "2":
				System.out.println("*****WELCOME TO TEACHER REGISTRATION*****");
				return new Teacher();
			case "3":
				System.out.println("*****WELCOME TO HEADMASTER REGISTRATION*****");
				return new HeadMaster();
			default:
				ch = "0";
			}
		}while(ch=="0");
		return null;
	}
}
