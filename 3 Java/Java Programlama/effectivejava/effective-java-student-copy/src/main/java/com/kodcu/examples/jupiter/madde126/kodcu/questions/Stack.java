package com.kodcu.examples.jupiter.madde126.kodcu.questions;

import java.util.Arrays;

// Object-based collection - a prime candidate for generics
public class Stack {
    private Object[] elements;
    private int size = 0;
    private static final int DEFAULT_INITIAL_CAPACITY = 16;

    public Stack() {
        elements = new Object[DEFAULT_INITIAL_CAPACITY];
    }

    public void push(Object e) {
        ensureCapacity();
        elements[size++] = e;
    }

    public Object pop() {
        if (size == 0)
            throw new RuntimeException();
        Object result = elements[--size];
        elements[size] = null; // Eliminate obsolete reference
        return result;
    }

    public boolean isEmpty() {
        return size == 0;
    }

    private void ensureCapacity() {
        if (elements.length == size)
            elements = Arrays.copyOf(elements, 2 * size + 1);
    }

    public static void main(String[] args) {
        Stack stack = new Stack();


        for (String arg : args) {
            stack.push(arg);
            // Gelen String neslerini buyuk harfe cevirelim (uppercase)
            Object ob = stack.pop();
            String pop = (String) ob;
            System.out.println(pop.toUpperCase());
        }

    }
}