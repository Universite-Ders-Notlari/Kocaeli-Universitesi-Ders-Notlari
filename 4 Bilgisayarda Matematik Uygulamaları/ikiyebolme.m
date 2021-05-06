%bu programla ikiye b?lme y?ntemi ile fonksiyonun k?k de?erleri belirlenmektedir.
F=inline('4.5*x-2*cos(x)');
a=0;b=1;imax=15;tol=0.001; % ba?lang?? iterasyon ve tolerans de?erleri
Fa=F(a); Fb=F(b);
if Fa*Fb>0
disp('fonksiyon a ve b noktas?nda ayn? i?arete sahip')
else
disp('iterasyon      a           b           (xi)             Fonk.degeri           Tolerans')
for i=1:imax
xi=(a+b)/2;  % ikiye b?lme y?ntem e?itli?i
tole=(b-a)/2;
Fxi=F(xi);
fprintf('%3i%15.5f%15.5f%15.5f%15.5f%15.5f\n',i,a,b,xi,Fxi,tole)
if Fxi==0
fprintf('ger?ek ??z?m x=%15.5f bulundu',xi)
break
end
if tole<tol
break
end
if i==imax
fprintf('%i iterasyonda ??z?m elde edilemedi',imax)
break
end
if F(a)*Fxi<0
b=xi;
else
a=xi;
end
end
end
        