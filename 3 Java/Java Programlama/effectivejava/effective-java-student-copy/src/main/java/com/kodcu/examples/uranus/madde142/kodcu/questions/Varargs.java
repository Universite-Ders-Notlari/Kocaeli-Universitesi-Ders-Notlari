// Sample uses of varargs
package com.kodcu.examples.uranus.madde142.kodcu.questions;

public class Varargs {

    //varargs  usage, very simple
    static int sum(int... args) {
        int sum = 0;
        for (int arg : args)
            sum += arg;
        return sum;
    }


    static int min(int... args) {
        if (args.length == 0)
            throw new IllegalArgumentException("Too few arguments"); // ?
        int min = args[0]; // ?
        for (int i = 1; i < args.length; i++)
            if (args[i] < min)
                min = args[i];
        return min;
    }


    public static void main(String[] args) {
        System.out.println(sum(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
        System.out.println(min(1, 2, 3, 4, 5, 6, 7, 8, 9, 10));
    }
}
