package validator;

import java.util.Scanner;

public class Password_validator {
	public static boolean valid_password(String Password) {
		boolean upper = false;
		boolean digit = false;
		
		if(Password.length()<8) {
			System.out.println("Password must be minimum 8 characters");
			return false;
		}
		
		for(int i=0;i<Password.length();i++) {
			char ch = Password.charAt(i);
			
			if(Character.isUpperCase(ch)) {
				upper = true;
			}
			if(Character.isDigit(ch)) {
				digit = true;
			}
		}
		if(!upper) {
			System.out.println("Missing of Uppercase");
		}
		if(!digit) {
			System.out.println("Missing of digit");
		}
		return upper && digit;
		
	}

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		String Password;
		
		while(true) {
			System.out.println("Enter a password:");
			Password = sc.nextLine().trim();
		
		
		if(valid_password(Password)) {
			System.out.println("Password is Valid");
		}
		else {
			System.out.println("Please try again");
		}
		System.out.println();
		}

	}

}
