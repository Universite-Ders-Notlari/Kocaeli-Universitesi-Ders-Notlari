%this script generates teh result of flpping a coin as a random signal
clear all;
fn=1:50;
x=sign(randn(50,1));
stem(fn,x);
