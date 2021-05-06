clear all;
clf;
f0=440; %signal frequency
fs=24*f0;%sampling frequency, must be at least 10*f0
Ts=1/fs; %sampling period
t=0:Ts:4/f0; %time interval in seconds
x=2*cos(2*pi*f0*t); %cosine signal with ferquency f0
figure(1);
plot(t,x); %plot of cosine signal
grid
xlabel('time (sec)')
ylabel('signal value')
title('cosine signal at 440 Hz')

%generate noise
%noise is random signal
noise=randn(1,length(x));
figure(2);
plot(t,noise);
title('noise signal');

%add signal and noise
y=x+noise;
figure(1);hold on;
plot(t,y);
title('cosine signal at 440 Hz  with noise');
hold off;