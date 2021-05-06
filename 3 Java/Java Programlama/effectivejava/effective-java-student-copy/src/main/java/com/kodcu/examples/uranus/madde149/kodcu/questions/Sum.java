
package com.kodcu.examples.uranus.madde149.kodcu.questions;

public class Sum {
	static Integer i;

	public static void main(String[] args) {
		Long sum = 0L;
		for (long i = 0; i < Integer.MAX_VALUE; i++) {
			sum += i;
		}
		System.out.println(sum);
	}
}