%% 
% 6. hafta MATLAB ders Notlar?
% 
%  *[ ]-K??eli Parantez:* Vekt?rleri ve matrisleri bi?imlendirmek i?in kullan?l?r. 
% ?rne?in [5.45  9.3  sqrt(-6)] elemanlar? bo?luklarla ayr?lm??  ?? elemanl? bir 
% vekt?rd?r. Bunun yan?nda [5 6 45;12 91 2], ?? sat?r ve ?? s?tundan ibaret 3x3 
% l?k bir matrisi g?sterir. Burada noktal? virg?l (;) matris olu?turulmas?nda 
% bir sat?r? sona erdirip bunu izleyen sat?r?n olu?mas?n? sa?lar. A=[ ] bi?iminde 
% bir bildirim bo? bir matrisi A de?i?enine atar.

[5.45  9.3  sqrt(-6)] 
a = [5.45 2.25 ; 9.3 2 ; 1 sqrt(-6)] 
a=[]
clear a

a=[ 3, 4   5  6 7 , 9 , 10 ] 
a= [a  6 7 8 9 ]
a=[ 1 2 a ]
%% 
% Matlab'da geni?len matris (diziler ) vard?r. 
% 
% Matlab'da dizinin indisleri 1 den ba?lar.
% 
% 
% 
% 
% 
% 
% 
% *(  )-Normal Parantez: MATLAB*da normal parantez ?e?itli ?al??malarla ?e?itli 
% yerlerde kullan?l?r. En ?nemlisi; aritmetik deyimlerin ?st?nl???n? belirmek 
% ve fonksiyon arg?manlar?n? kapatmak i?in kullan?l?r. E?er X ve Y bir vekt?r 
% ise X(Y) de bir vekt?rd?r ve [X(Y(1)),X(Y(2)),?,X(Y(N))] ?eklinde ifade edilir. 

B = [ 1 2 3 ; 4 5 6 ; 7 8 9 ; 10 11 12 ]
B(1)
B(1,1)
B(2,3)
B(10)=6789
%B(19)

B(1,2) = [] 
B(:,3) = []

B(:,:)

B(:) 
%% 
% 
% 
% 
% 
% *.-Nokta:*Kesir ay?rma i?aretidir. 1452/10, 1.452 ve .1452e1 ayn? anlama 
% gelir. Bu i?aret ayn? zamanda eleman elemana ?arpma ve b?lme i?leminde de kullan?labilir. 
% Buna g?re kullan?? bi?imleri .*, .^, ./, .\ veya .?. ?eklindedir.
% 
% . --> elemetwise  ( eleman elaman i?lem yap) 
% 
% 1.000.000,85
% 
% 1,000,000.85

c=5,8
c=5.8


d = [ 1 2 3 4 ] 
%d^2
d.^2
%% 
% 
% 
% 
% 
% *...-?? Nokta:*Bir tek sat?ra s??mayan ifadelerin devam etti?ini belirmek 
% i?in kullan?l?r.
% 
% 
% 
% 
% 
% *;-Noktal? Virg?l:*Bu i?aret bir bildirimde elde edilen sonu?lar?n program?n 
% icras? sonunda akranda g?r?nt?lenmesini engellemek i?in kullan?l?r. Ayn? zamanda 
% matris olu?turulmas?nda bir sat?r? sona erdirip bunu izleyen sat?r?n olu?mas?n? 
% sa?lad???n? da s?ylemi?tik.
% 
% 
% 
% 
% 
% *%-Y?zde ??areti: *A??klama yap?laca?? zaman ilgili sat?rlara bu i?retle 
% ba?lanarak yap?l?r.  *% i?areti* ile ba?layan* MATLAB*taraf?ndan dikkate al?nmaz 
% ve icraya da sokulmaz.

mod(5,2)
%% 
% 
% 
% *!-?nlem i?areti:*Herhangi bir yaz? DOS i?lemi g?r?r. B?ylece *MATLAB* 
% i?erisinde iken DOS komutlar? ile ?al???labilir.
% 
% NOT: ! de?il operat?r? olarak kullan?lmaz. ~ (tilda) De?il operat?r?d?r. 

!pwd
%% 
% **
% 
% *:-?ki Nokta:*Bu i?aret s?tun i?areti olarak kullan?l?r ve her yerde kullan?labilir. 
% ?rne?in; J:K J?den ba?layarak birer birer K ya kadar artan bir dizi olu?turur 
% ve [J, J+1,...,K] ile ayn? anlama gelir.

1:10
1:2:10
%35 ile 61 aras?ndaki ?ift say?lar 
35:2:61
36:2:61
%% 
% 
% 
% *?-T?rnak i?areti:*matrislerin transpozunun al?nmas?n? sa?lar. M?, M matrisinin 
% karma??k e?lenik transpozonu M?. ise e?lenik olmayan transpozunu sonu?land?r?r.

%M'
%% 
% 
%% MATLAB DE???KENLER
% 
% 
% *Deve ve Paskal Notasyonlar?: *Yukar?daki ipucunda anlat?lanlara imkan 
% sa?layan notasyonlar deve ve paskal notasyonlar?d?r. Bu g?sterece?imiz notasyonlar 
% d?nyada genel kabul g?rm??lerdir ve di?erlerine g?re daha fazla tercih edilirler. 
% *Deve notasyonu*de?i?ken tan?mlamalar?nda, *Paskal notasyonu* ise dosya isimlendirmelerinde 
% (d?zyaz? ve fonksiyon m-dosyalar?) kullan?l?rlar. *Deve Notasyonu*de?i?ken ad? 
% birden fazla de?i?ken i?eriyorsa ilk kelime hari? di?er b?t?n kelimelerin ilk 
% karakterlerinin b?y?k harfle yaz?ld??? bir notasyondur. *Deve Notasyonu* ile 
% tan?mlanm?? de?i?ken isimlerine birka? ?rnek olarak *sayi1, enKucuk, bankaHesapNo 
% ve basamakSayisi* verilebilir.
% 
% Dosya isimlendirmelerde kulland???m?z *Paskal Notasyonunun Deve Notasyonundan* 
% tek fark? dosya ad?n? olu?turan ilk kelimenin ilk karakterinin de b?y?k harfle 
% yaz?l?yor olmas?d?r. *Paskal Notasyonu* ile tan?mlanm?? dosya isimlerine ?rnek 
% olarak *AsalSayiMi.m, Ortalamay?Hesapla.m ve ToplayarakCarpma.m* verilebilir. 
% *.m,* daha sonra da ??renece?imiz ?zere *MATLAB* programlama dosyalar?n?n uzant?s?d?r.
% 
% 
% 
% 
%% MATLAB Say?lar ve Sabitler
% *MATLAB*de negatif bir say?y? temsil i?in o say?n?n ?n?nde (-) i?areti vard?r. 
% Bir say?n?n ?n?ne (+) i?areti koyulmas? veya hi?bir i?aret koyulmamas? o say?n?n 
% pozitif oldu?unun delilidir. Kayan noktal? (ondal?k) say?larda ayra? olarak 
% nokta(.) ve 10 say?s?n?n kuvvetini temsilen *e* harfi kullan?l?r. Karma??k say?lar?n 
% sanal k?s?mlar? *MATLAB* de son tak? olarak* i* harfi kullan?r. Bu bilgiler 
% ?????nda *MATLAB* yorumlay?c?s?n?n anlayaca?? birka? rakama ?rnek olarak *6, 
% -175, 3.1416, 2.54e2, 7i veya 5+7i* verilebilir. A?a??da *MATLAB?* da kullan?lan 
% baz? sabitler ve kullan?m ama?lar? a??klanm??t?r.

a= 2.54e-20
%% 
% *Ans:*Bu de?i?ken bir deyim taraf?ndan hesaplanan fakat bir de?i?ken ismi 
% alt?nda saklanmayan de?erleri saklamak i?in kullan?l?r.
% 
% 
% 
% *inf (?):*  Bu kelime *MATLAB?* ta sonsuz de?eri i?in atanm?? bir de?i?kendir 
% ve s?f?ra b?lme i?lemlerinde ortaya ??kar. E?er s?f?ra b?lme i?lemi g?r?nt?lenmek 
% istenirse bir uyar? mesaj? al?n?r ve sonu? ? i?areti ?eklinde g?r?nt?lenir veya 
% bas?l?r.

5/0
5^inf

%% 
% 
% 
% *NaN:*Bu de?er Not-a-Number (rakam de?il) anlam?na gelir ve s?f?r b?l? 
% s?f?r b?l?m?nde oldu?u gibi tan?mlanmam?? deyimlerde ortaya ??kar.

0/0
%% 
% 
% 
% 
% 
% *Eps:*Bu de?er fonksiyon, kullan?lmakta olan bilgisayar i?in floating point 
% (virg?ll? say?lar) taml???n? i?erir. Bu epsilon taml??? 1.0 ve bunu izleyen 
% en b?y?k decimal (onlu say?lar) aras?ndaki farkt?r.
% 
%  

eps
%% 
% 
% 
% 
%% ?zel Vekt?r Yap?lar?

zeros(100);
%% 
% *zeros(1,n) :*T?m elemanlar? s?f?r olan n elemanl? sat?r vekt?r.
% 
% *zeros(n,1) :*T?m elemanlar? s?f?r olan n elemanl? s?tun vekt?r.
% 
% *ones(1,n) :*T?m elemanlar? bir olan n elemanl? sat?r vekt?r.
% 
% *ones(n,1) :*T?m elemanlar? bir olan n elemanl? s?tun vekt?r.
% 
% *rand(1,n) :*Elemanlar? 0 ile 1 aras?ndan rastgele se?ilmi? n elemanl? 
% sat?r vekt?r.
% 
% *rand(n,1) :*Elemanlar? 0 ile 1 aras?ndan rastgele se?ilmi? n elemanl? 
% s?tun vekt?r.
% 
% *randn(1,n) :*Ortalamas? 0 ve standart sapmas? 1 olan normal da??l?ml? 
% elemanlardan olu?an n elemanl? s?tun vekt?r.
% 
% *randn(n,1) :*Ortalamas? 0 ve standart sapmas? 1 olan normal da??l?ml? 
% elemanlardan olu?an n elemanl? s?tun vekt?r.

rand(5)
round(rand(5,3)*100)
%% 
% r = *randi*([-10 10],100,1);  -10 ile 10 aras?nda 100x1 boyutunda bir 
% matris ?retir. R = randi([IMIN,IMAX],...) returns an array containing integer 
% values drawn from the discrete uniform distribution on IMIN:IMAX.

r = randi([-10 10],10,15)
%% 
% round en yak?n tamsay?ya yuvarlar.

round(5.99)
round(5.1)
round(5.499)
round(5.5)
round(5.51111)
%% 
% 
% 
% 

B=[3+6i 8i;6+10i 14] 
%% 
% 
% 
% 
% 
% *MATLAB? da Matrislerin Boyutunun De?i?tirilmesi*
% 
% *MATLAB*da *A(m x n)* boyutunda bir matris var ise, bu matris *m*n = p*q* 
% olmak ?art?yla *B(p x q)* boyutunda bir matrise d?n??t?r?lebilir.
% 
% A?a??daki A matrisi (2?3) boyutundad?r. A matrisinin (3X2) boyutuna getirilmesi 
% a?a??da g?sterilmi?tir.
% 
% 

A = [10 8 6 ; 1 3 5]
B = reshape(A,3,2)
%% 
% 
% 
% repmat  : repmat Replicate and tile an array.
% 
% 

magic(2)
D= repmat(magic(2), 2, 3) 
%% 
% 
% 
% Matris Toplam? : 

sum(D,2)

%% 
% ?ok boyutlu matris

E=rand(5,4,3)*100
sum(E,3)
mean(E)
max(max(E))

size(E)
length(E)
%% 
% *Matlab?da prod komutu: *prod(x) = Vekt?r?n elemanlar?n? birbiriyle ?arpar.

boyut = size(E)
prod(boyut) 
numel(E)
%% 
% **
% 
% **
% 
% *Matlab?da find komutu: *find(x) = Vekt?r?n s?f?r olmayan elemanlar?n?n 
% indeksini verir.

x = [-8 0 -1 3 4.5];
find(x)
%% 
%                           
% 
% Ayr?ca find komutu i?inde verilen ko?ulu sa?layan elemanlar?n indekslerini 
% de verir.

x = [-8 0 -1 3 4.5]; 
a=find(x>1)
%% 
%      
% 
%    x vekt?r?n?n s?f?rdan k???k elemanlar?n? pozitif yap?n.

konumlar  = find(x<0)
x(konumlar) = -1 * x(konumlar)
intmax('uint64')
%% 
%   
% 
% 
% 
%   
% 
%   
% 
%  
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
%