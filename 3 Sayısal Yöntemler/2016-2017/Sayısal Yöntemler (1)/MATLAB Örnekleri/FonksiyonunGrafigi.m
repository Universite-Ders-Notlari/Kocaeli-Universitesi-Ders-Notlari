clc; close all;

x=3 : 0.1 : 4;
y1=x.^3+2*x+1;
y2=x.^2+5*x+4;
y3=x.^5+3*x+21;

figure(1);
plot(x,y1);
hold on;
plot(x,y2);
legend('x^3 + 2x + 1', 'x^2 + 5x + 4');
grid;
xlabel('x');
ylabel('y');
title('Deneme Grafik 1');

figure(2);
plot(x,y3);
legend('x^5 + 3x + 21');
grid;
xlabel('x');
ylabel('y');
title('Deneme Grafik 2');