
package com.kodcu.examples.uranus.madde148.kodcu.questions;


public class Candy {


    public static void main(String[] args) {
        double para = 1.00;
        int itemsBought = 0;
        for (double fiyat = .10; para >= fiyat; fiyat += .10) {
            para -= fiyat;
            itemsBought++;
        }
        System.out.println(itemsBought + " items bought.");
        System.out.println("Change: $" + para);
    }
}
