
package com.kodcu.examples.uranus.madde149.kodcu.questions;

import java.util.Comparator;

public class Registration {
	public static void main(String[] args) {

		// Broken comparator - can you spot the flaw?
		Comparator<Integer> naturalOrder = new Comparator<Integer>() {
			public int compare(Integer first, Integer second) {

				if (first < second) {
					return -1;
				} else if (first == second ) {
					return 0 ;
				} else {
					return 1 ;
				}
			}
		};


		int result = naturalOrder.compare(new Integer(42), new Integer(42));
		System.out.println(result);
	}
}
