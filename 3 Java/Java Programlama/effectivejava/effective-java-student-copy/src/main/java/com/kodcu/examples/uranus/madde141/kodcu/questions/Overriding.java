
package com.kodcu.examples.uranus.madde141.kodcu.questions;

class Soda {
	static String markaBildir() {
		return "soda";
	}
}

class SparklingSoda extends Soda {

	static String markaBildir() {
		return "sparkling soda";
	}
}

class UludagGazoz extends SparklingSoda {

	static String markaBildir() {
		return "Gazoz olma Efsane Ol";
	}
}

public class Overriding {
	public static void main(String[] args) {
		Soda[] sodas = { new Soda(), new SparklingSoda(), new UludagGazoz() };
		for (Soda soda : sodas)
			System.out.println(soda.markaBildir());
	}
}
