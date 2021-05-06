// Broken! - How long would you expect this program to run? - Page 259
package com.kodcu.examples.pluton.madde166.kodcu.questions;

import java.util.concurrent.TimeUnit;

public class StopThread {
	private static boolean stopRequested;

	public static void main(String[] args) throws InterruptedException {
		Thread backgroundThread = new Thread(new Runnable() {
			public void run() {
				int i = 0;
				while (!stopRequested)
					i++;
			}
		});
		backgroundThread.start();

		TimeUnit.SECONDS.sleep(1);
		stopRequested = true;
	}
}
