clear all;clc;
syms x
equ = (3*x-2)^2 * (2*x-3)^2
equ = expand(equ) / 2 
pretty(equ)
subs(equ,3)
diffEqu = expand(diff(equ,x))
simplify(diffEqu)
subs(diff(equ),5)

diff2Equ = expand(diff(equ,2))
%% 
% equ : ama? fonksiyonu
% 
% diffEqu : ama? fonksiyonun t?revi 
% 
% diff2Equ : ama? fonksiyonun ikinci t?revi
% 
% x0 : x 'in ba?lang?? de?eri 
% 
% k : i?lem ad?m? 
% 
% y : fonksiyonun de?eri 

x0 = 10;
k = 1;
x(k) = x0;
max_iter = 15;

f = zeros(1,max_iter);
f(k) = subs(equ,x(k));
    df(k) = subs(diffEqu,x(k));
    d2f(k) = subs(diff2Equ,x(k));

while k<15
    k=k+1;
    x(k) = x(k-1)-(df(k-1)/d2f(k-1));
    f(k) = subs(equ,x(k));
    df(k) = subs(diffEqu,x(k));
    d2f(k) = subs(diff2Equ,x(k)); 
    hata(k) = abs(df(k)-df(k-1));
end
x
df
d2f
hata

%% 
% 
% 
%