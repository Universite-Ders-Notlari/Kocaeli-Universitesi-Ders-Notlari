// Typesafe heterogeneous container - Pages 142-145
package com.kodcu.examples.jupiter.madde129;

import java.util.HashMap;
import java.util.Map;

public class Favorites {
	// Typesafe heterogeneous container pattern - implementation
	private Map<Class<?>, Object> favorites = new HashMap<Class<?>, Object>();

	public <T> void putFavorite(Class<T> type, T instance) {
		if (type == null)
			throw new NullPointerException("Type is null");
		favorites.put(type, instance);
	}

	public <T> T getFavorite(Class<T> type) {
		return type.cast(favorites.get(type));
	}

	// Typesafe heterogeneous container pattern - client
	public static void main(String[] args) {
		Favorites f = new Favorites();
		f.putFavorite(String.class, "Java");
		f.putFavorite(Integer.class,85);
		f.putFavorite(Class.class, Favorites.class);

		String favoriteString = f.getFavorite(String.class);
		int favoriteInteger = f.getFavorite(Integer.class);
		Class<?> favoriteClass = f.getFavorite(Class.class);
		System.out.printf("%s %x %s%n", favoriteString, favoriteInteger,
				favoriteClass.getName());
	}
}