package com.kodcu.examples.jupiter.madde123.kodcu.questions;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class KahveDukkani {
	// Uses raw type (List) - fails at runtime!
	public static void main(String[] args) {
		List<String> strings = new ArrayList<String>();
		tehlikeliEkleme(strings, new Integer(42));
		String s = strings.get(0); // cast by Compiler
	}

	private static void tehlikeliEkleme(List list, Object o) {
		list.add(o);
	}

	// Belirsiz tip cevrimi - tehlikeli - yapmayin
	static int say(Set s1, Set s2) {
		int result = 0;
		for (Object o1 : s1)
			if (s2.contains(o1))
				result++;
		return result;
	}

	// Unbounded wildcard type - tip güvenligi var ve esnek
	static int sayWildcard(Set<?> s1, Set<?> s2) {
		int result = 0;
		for (Object o1 : s1)
			if (s2.contains(o1))
				result++;
		return result;
	}
}
