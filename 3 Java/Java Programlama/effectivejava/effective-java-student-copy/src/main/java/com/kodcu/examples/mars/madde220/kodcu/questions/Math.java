
package com.kodcu.examples.mars.madde220.kodcu.questions;

class Math {
	enum Sekil {
		DIKDORTGEN, CEMBER
	};

	// Tag field - the sekil of this figure
	final Sekil sekil;

	// These fields are used only if sekil is DIKDORTGEN
	double length;
	double width;

	// This field is used only if sekil is CEMBER
	double radius;

	// Constructor for circle
	Math(double radius) {
		sekil = Sekil.CEMBER;
		this.radius = radius;
	}

	// Constructor for rectangle
	Math(double length, double width) {
		sekil = Sekil.DIKDORTGEN;
		this.length = length;
		this.width = width;
	}

	double area() {
		switch (sekil) {
		case DIKDORTGEN:
			return length * width;
		case CEMBER:
			return java.lang.Math.PI * (radius * radius);
		default:
			throw new AssertionError();
		}
	}
}
