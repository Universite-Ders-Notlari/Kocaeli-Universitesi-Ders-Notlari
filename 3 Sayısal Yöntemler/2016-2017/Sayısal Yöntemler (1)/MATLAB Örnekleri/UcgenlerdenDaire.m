clc; close all;

tolerans=0.01; r=1; n=5; hata=1.0; A0=0;
Gercek_Alan=(pi*r^2);

while hata>=tolerans
    A1=n*(((r^2)/2)*sin((2*pi)/n));
    hata=((A1-A0)/A1)*100;
    A0=A1;
    n=n+1;
end

fprintf('\nGerçek Alan = %f\n', Gercek_Alan);
fprintf('Hesaplanan Alan = %f\n', A1);
fprintf('Hata = %f\n', hata);
fprintf('n = %d\n', n);