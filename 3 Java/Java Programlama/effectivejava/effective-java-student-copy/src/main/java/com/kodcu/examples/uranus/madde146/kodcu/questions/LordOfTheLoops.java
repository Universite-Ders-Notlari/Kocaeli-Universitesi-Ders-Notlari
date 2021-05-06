package com.kodcu.examples.uranus.madde146.kodcu.questions;


import java.util.*;


public class LordOfTheLoops {

    enum Suit {CLUB, DIAMOND, HEART, SPADE}

    enum Rank {
        ACE, DEUCE, THREE, FOUR, FIVE, SIX, SEVEN, EIGHT,
        NINE, TEN, JACK, QUEEN, KING
    }

    public static void main(String[] args) {

        // Can you spot the bug?

        Collection<Suit> suits = Arrays.asList(Suit.values());
        Collection<Rank> ranks = Arrays.asList(Rank.values());

        List<Card> deck = new ArrayList<Card>();
        for (Iterator<Suit> i = suits.iterator(); i.hasNext(); ) {
            for (Iterator<Rank> j = ranks.iterator(); j.hasNext(); ) {
                deck.add(new Card(i.next(), j.next()));
            }
        }
    }

}


class Card {

    public Card(LordOfTheLoops.Suit s, LordOfTheLoops.Rank rank) {
        // ...
    }
}
