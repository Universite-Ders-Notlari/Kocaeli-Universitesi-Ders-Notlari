%CÝHAT DUYKU 150202106
clc,clear all;
	a =round(10* rand(3,3))
	b =round(10* rand(3,1))  %random atanmýþ sabitler ve katsayýlar matrisleri

	a(:,length(a)+1)=b;   
	[rows, cols]=size(a); 

	for i=1:cols
		for j=i+1:rows
			tmp=a(i,:).*(-a(j,i)/a(i,i));
			a(j,:)=tmp+(a(j,:));
		end
	end
	
	for i=length(1:rows)-(1:rows)+1
		if(i<cols-1)
			a(i,cols)=a(i,cols)-(sum(a(i,i+1:cols-1)));
            a
            
		end
		sonuc(i)=a(i,cols)/(a(i,i));
		a(1:i-1,i)=a(1:i-1,i).*sonuc(i);
        
    end
    
    
    fprintf('%d\t',sonuc);
    


	X=[1,0,2
       2,1,0
       3,2,1]
	
   Y=[-9;5;4]

	X1 = X;
	X1(:,1) = Y;%Katsayýlar matrisi 1.Sütun -> Sabitler matrisi
	
    X2 = X;
	X2(:,2) = Y;%Katsayýlar matrisi 2.Sütun -> Sabitler matrisi

	X3 = X;
	X3(:,3) = Y ;%Katsayýlar matrisi 3.Sütun -> Sabitler matrisi

	D=det(X);
	
    X1DET=det(X1);
    a=X1DET/D;
    
	X2DET=det(X2);
    b=X2DET/D;
	
    X3DET=det(X3);
	c=X3DET/D;
   
    fprintf('Denklem Sisteminin çözümü\n %d\t%d\t%d\n',a,b,c);