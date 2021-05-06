package com.kodcu.examples.dunya.madde112.kodcu.questions;


import java.util.HashMap;
import java.util.Map;

public final class TelefonNumarasi {
	private final short alanKod;
	private final short prefix;
	private final short numara;

	public TelefonNumarasi(int alanKod, int prefix, int numara) {
		numaraKontrol(alanKod, 999, "alan kod");
		numaraKontrol(prefix, 999, "prefix");
		numaraKontrol(numara, 9999, "numara");
		this.alanKod = (short) alanKod;
		this.prefix = (short) prefix;
		this.numara = (short) numara;
	}

	private static void numaraKontrol(int arg, int max, String name) {
		if (arg < 0 || arg > max)
			throw new IllegalArgumentException(name + ": " + arg);
	}

	@Override
	public boolean equals(Object o) {
		if (o == this)
			return true;
		if (!(o instanceof TelefonNumarasi))
			return false;
		TelefonNumarasi pn = (TelefonNumarasi) o;
		return pn.numara == numara && pn.prefix == prefix
				&& pn.alanKod == alanKod;
	}



	public static void main(String[] args) {
		Map<TelefonNumarasi, String> m = new HashMap<TelefonNumarasi, String>();
		// create random TelefonNumarasi
		// sort them accourding to city code
		m.put(new TelefonNumarasi(212, 317, 8327), "Ayse Teyze");
		System.out.println(m.get(new TelefonNumarasi(707, 867, 5309)));
	}
}
