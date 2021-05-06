% birinci ö?retim ile ikinci ö?retim velerini okuduk

% ogr = [ Untitled ;  Untitled1 ] 

% Edestek sisteminden bilgileri alal?m

% save('bilgiler.mat','ogr','edestek')


load('bilgiler.mat');

%  ö?renci bilgi sistemindeki numara, ad, soyad
% ile
% edestek sitesindeki numara ad soyad 
% farkl? olan ö?renciler kimler? 

% ogr(3) -> numara
% ogr(4) -> ad
% ogr(5) -> soyad
% 
% edestek(1) -> ad
% edestek(2) -> soyad
% edestek(3) -> numara 

% ogr(3) numara ile edestek(3) numara e?it mi ? 

for i=1:length(ogr)
    indis = find ( strcmp(ogr(i,3),edestek(:,3)) == 1 ) ;

    if isempty(indis)
        fprintf('%s - ogr :  %s %s edestek te bulunamad? \n', ogr(i,3),ogr(i,4),ogr(i,5));
       
        
       indis2=find ( strcmpi(ogr(i,4),edestek(:,1))  == 1  & ...
              strcmpi(ogr(i,5),edestek(:,2))  == 1 ) ;
       if isempty(indis2)
           fprintf('%s - ogr :  %s %s - numara ve ad soyad eslesmedi \n', ogr(i,3),ogr(i,4),ogr(i,5),edestek(indis2,3),edestek(indis2,1),edestek(indis2,2) );
       else
           fprintf('%s - ogr :  %s %s edestek : %s no - %s %s \n', ogr(i,3),ogr(i,4),ogr(i,5),edestek(indis2,3),edestek(indis2,1),edestek(indis2,2) );
           edestek(indis2,3) = ogr(i,1);
       end
               
    end
    % 1 --> indis
    if strcmpi(ogr(i,4), edestek(indis,1))==false | strcmpi(ogr(i,5), edestek(indis,2))==false
        fprintf('%s - ogr :  %s %s edestek : %s %s \n', ogr(i,3),ogr(i,4),ogr(i,5),edestek(indis,1),edestek(indis,2) );
    end

end

% 
% 
% isimler = dir
% isimler.name
% 



