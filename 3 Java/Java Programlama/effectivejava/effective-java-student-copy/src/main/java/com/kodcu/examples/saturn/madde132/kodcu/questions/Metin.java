
package com.kodcu.examples.saturn.madde132.kodcu.questions;

public class Metin {
	public static final int BOLD = 1 ;
	public static final int ITALIC = 1 ;
	public static final int UNDERLINE = 1;
	public static final int STRIKETHROUGH = 1;


	public void applyStyles(int styles) {
		// Body goes here
	}

	// Sample use
	public static void main(String[] args) {
		Metin metin = new Metin();
		metin.applyStyles(BOLD);
	}
}
