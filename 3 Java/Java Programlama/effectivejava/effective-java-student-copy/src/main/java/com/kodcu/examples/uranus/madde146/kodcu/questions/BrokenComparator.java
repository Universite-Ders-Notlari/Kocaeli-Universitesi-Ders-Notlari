
package com.kodcu.examples.uranus.madde146.kodcu.questions;

import java.util.Arrays;
import java.util.Collection;
import java.util.Iterator;


public class BrokenComparator {

    enum Face {ONE, TWO, THREE, FOUR, FIVE, SIX}

    public static void main(String[] args) {

        // Questions  :  Print thirty-six combinations ?

        Collection<Face> faces = Arrays.asList(Face.values());
        for (Iterator<Face> i = faces.iterator(); i.hasNext(); )
            for (Iterator<Face> j = faces.iterator(); j.hasNext(); )
                System.out.println(i.next() + " " + j.next());

    }
}
