package com.kodcu.examples.dunya.madde110.kodcu.questions;

// Shows the need for overriding hashcode when you override equals - Pages 45-46

import java.util.HashMap;
import java.util.Map;

public final class TelefonRehberi {
    private final short alanKod;
    private final short prefix;
    private final short numara;

    public TelefonRehberi(int alanKod, int prefix, int numara) {
        kontrol(alanKod, 999, "alan kod");
        kontrol(prefix, 999, "prefix");
        kontrol(numara, 9999, "numara");
        this.alanKod = (short) alanKod;
        this.prefix = (short) prefix;
        this.numara = (short) numara;
    }

    private static void kontrol(int arg, int max, String name) {
        if (arg < 0 || arg > max)
            throw new IllegalArgumentException(name + ": " + arg);
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof TelefonRehberi))
            return false;
        TelefonRehberi pn = (TelefonRehberi) o;
        return pn.numara == numara && pn.prefix == prefix
                && pn.alanKod == alanKod;
    }


    @Override
    public int hashCode() {
        int result = 17;
        result = 31 * result + alanKod;
        result = 31 * result + prefix;
        result = 31 * result + numara;
        return result;
    }



    public static void main(String[] args) {
        Map<TelefonRehberi, String> m = new HashMap<TelefonRehberi, String>();
        m.put(new TelefonRehberi(707, 867, 5309), "Ayse");
        // print out HashMap content in style
    }
}
