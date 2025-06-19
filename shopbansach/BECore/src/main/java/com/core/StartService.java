package com.core;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication
@EntityScan("com.core.entities")
public class StartService {
	public static void main(String[] args) {
		SpringApplication.run(StartService.class, args);
	}
}
