% x=1:7
% y=[ 0.5 2.5 2 4 3.5 6 5.5 ]
% 
% p = polyfit(x,y,10) 
% 
% pv = polyval(p,[1:7])
% 
% y-pv


f = [ 5 4 -15 23 6 -10 ] 


fp = polyval( f , 1:1000 ) 
pp = polyfit(1:1000, fp , 10)

ppv = polyval(pp,[1:1000]);

max(fp-ppv)
