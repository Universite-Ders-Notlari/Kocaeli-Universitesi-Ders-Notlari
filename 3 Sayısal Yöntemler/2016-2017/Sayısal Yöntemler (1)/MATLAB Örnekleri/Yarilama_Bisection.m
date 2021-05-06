clc; close all;

tolerans=2*(10^-6); hata=1.0; xa=-1; xu=0; x=0;
n=0;
y0=x*exp(-x)+x^3+1;
y1=xa*exp(-xa)+xa^3+1;
y2=xu*exp(-xu)+xu^3+1;

fprintf('asd = %f\n', exp(-x));

while hata>=tolerans
    if y1*y2 > 0
       printf('Kök yok!');
        break;
    else if y1*y2==0
        if y1==0
            x=xa;
            break;
        else
            x=xu;
            break;
        end
        end
        x=(xa+xu)/2;
    end
    
    if(y1*y0<0)
        xu=x;
    else
        xa=x;
    end
    n=n+1;
    hata=(xu-xa)/2;
end

fprintf('Kok = %f\n', x);