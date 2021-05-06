

%  yeniden proje atamas?

% daha önceden verilen projelere göre rastgele atama 
% 
% sayac = 1;
% for i=1:(length(proje1)/2)
%     
%     indis = find(strcmp(proje1(i,5),proje1(:,5))==1);
% 
%     proje2(sayac,1) = proje1(i,5);
%     proje2(sayac,2) = proje1(indis(1),2);
%     proje2(sayac,3) = proje1(indis(2),2);
% 
%     sayac = sayac + 1;
% 
% end

% 
% son = length(proje1);
% sayilar = randi([1 son],length(proje2),6);
% for j=3:8
% %     proje2(:,j) = proje1([sayilar(:,j-2),ones(length(sayilar)*2)])
%     for k=1:length(sayilar)
%         proje2(k,j) = proje1(sayilar(k,j-2) , 2 );
%         
%     end
% end



% ayn? sat?rda birbirinin ayn? olan herhangi bir sütun var m? ? 
% 1. sütun ad-soyad d???nda.
[ sat sut ] = size(proje2)
for satir=1:length(proje2)
    for i=4:sut
        if sum(strcmp(proje2(satir,i),proje2(satir,:)))>1
            esitler= find(strcmp(proje2(satir,i),proje2(satir,:))==1);
            yeni = randi([1 son],1,1);
            proje2(satir,esitler(2)) = proje1(yeni,2);
            
        end

    end
end

