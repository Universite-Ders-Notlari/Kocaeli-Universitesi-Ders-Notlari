// Can you spot the "memory leak"?
package com.kodcu.examples.venus.madde106;

import java.util.Arrays;

public class Yigin {
	private Object[] elements;
	private int size = 0;
	private static final int DEFAULT_INITIAL_CAPACITY = 16;

	public Yigin() {
		elements = new Object[DEFAULT_INITIAL_CAPACITY];
	}

	public void push(Object e) {
		ensureCapacity();
		elements[size++] = e;
	}

	public Object pop() {
	if (size == 0)
	 throw new EmptyStackException();
	 return elements[--size];
	}

	/**
	 * Ensure space for at least one more element, roughly doubling the capacity
	 * each time the array needs to grow.
	 */
	private void ensureCapacity() {
		if (elements.length == size)
			elements = Arrays.copyOf(elements, 2 * size + 1);
	}

	public static void main(String[] args) {
		Yigin stack = new Yigin();
		for (long i = 0; i < Integer.MAX_VALUE; i++) {
			stack.push(new Object());
			stack.pop();
		}

		for (int i = 0; i < stack.elements.length ; i++) {
			System.out.println(" " + stack.elements[i]) ;
		}

		System.out.println(" Finished " + stack.elements.length );
	}
}
