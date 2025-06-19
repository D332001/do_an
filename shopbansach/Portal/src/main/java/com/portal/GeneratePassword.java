package com.portal;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class GeneratePassword {
	public static void main(String[] args) {
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = encoder.encode("staff123");
		System.out.println(result);
	}
}
