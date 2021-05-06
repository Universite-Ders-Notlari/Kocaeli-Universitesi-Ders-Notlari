% clc ,clear all;
% a=[-2 1;2,-3];
% b=[-1;5];
% 
% x0=[0;0];
% satir=2;
% sutun=2;
% 
% tol=0.0001;
% hata=1;
% n=0;
% while hata>tol
%     x=x0;
%     n=n+1;
%     for i=1:satir
%         fark=0;
%         for j=1:sutun
%             if i==j
%                 fark=fark;
%             else
%                 fark=fark+a(i,j)*x(j);
%             end
%         end
%         x(i,1)=(b(i)-fark)/a(i,i);
%     end
%     hata=max(abs(x-x0));
%     x0=x;
%     
% end
% n
% x

clc ,clear all;
a=[-2 1;2,-3];
b=[-1;5];

x0=[0;0];
satir=2;
sutun=2;

tol=0.0001;
hata=1;
n=0;
while hata>tol
    x=x0;
    n=n+1;
    for i=1:satir
        fark=0;
        for j=1:sutun
            if i==j
                fark=fark;
            else
                fark=fark+a(i,j)*x(j);
            end
        end
        x(i,1)=(b(i)-fark)/a(i,i);
    end
    hata=max(abs(x-x0));
    x0=x;   
end
n
x




