f0=440; %signal frequency
fs=24*f0;%sampling frequency, must be at least 10*f0
Ts=1/fs; %sampling period
t=0:Ts:4/f0; %time interval in seconds
x=10*cos(2*pi*f0*t); %cosine signal with ferquency f0
plot(t,x); %plot of cosine signal
grid
xlabel('time (sec)')
ylabel('signal value')
title('cosine signal at 440 Hz')

