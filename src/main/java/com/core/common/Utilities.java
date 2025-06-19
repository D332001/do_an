package com.core.common;

import com.github.slugify.Slugify;

public class Utilities {
	
	public static String createSeoLink(final String text) {
		Slugify slg = new Slugify();
		String result = slg.slugify(text + "-" + System.currentTimeMillis());
		return result;
	}
	
	public static void main(String[] args) {
		System.out.println(createSeoLink(" đắc  nhân tâm "));
	}
	
}
