// Broken - Inappropriate use of inheritance!
package com.kodcu.examples.mars.madde116.kodcu.questions;

import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;

public class MyHashSet<E> extends HashSet<E> {
	// The number of attempted element insertions
	private int addCount = 0;

	public MyHashSet() {
	}

	public MyHashSet(int initCap, float loadFactor) {
		super(initCap, loadFactor);
	}

	@Override
	public boolean add(E e) {
		addCount++;
		return super.add(e);
	}

	@Override
	public boolean addAll(Collection<? extends E> c) {
		addCount += c.size();
		return super.addAll(c);
	}

	public int getAddCount() {
		return addCount;
	}

	public static void main(String[] args) {
		MyHashSet<String> s = new MyHashSet<String>();
		s.addAll(Arrays.asList("Snap", "Crackle", "Pop"));
		System.out.println(s.getAddCount());
	}
}
