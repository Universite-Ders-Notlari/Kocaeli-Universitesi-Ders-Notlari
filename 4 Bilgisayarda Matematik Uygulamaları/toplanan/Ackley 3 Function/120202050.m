
% ackley3
x=32;
y=-32;
scores =-200*exp(-0.02*sqrt((x.^2)+(y.^2)))+5*exp(cos(3*x)+sin(3*y))


% Helical Valley
x=10;
y=-10;

score=100*((y-100)*(y-100)+sqrt((x.^2)+(y.^2))-1)
