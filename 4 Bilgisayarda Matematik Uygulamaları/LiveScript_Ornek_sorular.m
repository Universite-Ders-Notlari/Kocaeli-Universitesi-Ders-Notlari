%% 
% Soru 1:    50 ile 100 aras?ndaki tam say?lardan olu?an 20 tane rastgele 
% say?dan olu?an bir R vekt?r? tan?mlay?n?z. R vekt?r?n?n i?indeki 75?den k???k 
% say?lar? negatifleri ile de?i?tirip, 90?dan b?y?k say?lar? R vekt?r?nden silen, 
% en b?y?k eleman? vekt?r?n birinci elaman? ile yer de?i?tiren MATLAB kodunu d?ng?leri 
% kullanmadan yap?n?z. *(10)*

R=randi([50 100], 1,20)
i = find(R<75); R(i) = R(i) * -1 
in = find(R>90); R(in) = []
enbuyuki = find(max(R));gecici = R(1); R(1) = R(enbuyuki); R(enbuyuki)= gecici; 
%% 
% 
%% Soru 2 : ?? basamakl? bir ABC say?s? i?in ABC=A^3+B^3+C^3 ko?ulunu sa?l?yorsa, ABC say?s? bir amstrong say?s?d?r. ?rne?in; 153= 1^3+3^3+5^3 oldu?u i?in 153 bir amstrong say?s?d?r. ?? basamakl? t?m amstrong say?lar? bir vekt?rde saklayan matlab kodunu yaz?n?z?

sayi  = 100:999;
bir = mod ( sayi , 10 )  
on= floor ( mod ( sayi / 10 , 10 ))
yuz = floor( sayi / 100 )
sonuc = bir.^3 + on.^3 + yuz.^3 
%% 
% * *

gercek_sonucI = find( sayi == sonuc);
gercek_sonular = sayi(gercek_sonucI)
%% * *
% Soru 3 :  Girilen de?erin M?kemmel Say? m? de?il mi bulan kodu yaz?n?z.
% 
% M?kemmel say?, kendisi hari? pozitif tam b?lenlerinin toplam? kendisine 
% e?it olan say?d?r. *(20 puan)*
% 
%  
% 
% Soru 4:  tribonacci serisinin ilk 100 de?erini bir vekt?rde saklay?n?z.
% 
% t(n) = t(n-1) + t(n-2) + t(n-3)

t(1) = 1 ; t(2) = 2; t(3) = 3;
for n = 4 : 100
    t(n) = t(n-1) + t(n-2) + t(n-3);
end
t