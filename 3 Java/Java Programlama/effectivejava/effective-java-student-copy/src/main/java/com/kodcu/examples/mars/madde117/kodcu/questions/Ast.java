package com.kodcu.examples.mars.madde117.kodcu.questions;

import java.util.Date;

public final class Ast extends Super {
	private final Date date; // Blank final, set by constructor

	Ast() {
		date = new Date();
	}

	// Overriding method invoked by superclass constructor
	@Override
	public void overrideMe() {
		System.out.println(date);
	}

	public static void main(String[] args) {
		Ast ast = new Ast();
		ast.overrideMe();
	}
}
