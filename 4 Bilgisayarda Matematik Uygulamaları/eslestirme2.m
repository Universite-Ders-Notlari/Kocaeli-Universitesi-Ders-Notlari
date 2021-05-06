% ogr(3) -> numara
% ogr(6) -> ad-soyad

% edestek(3) -> numara 
% edestek(4) -> ad soyad

% ogr(3) numara ile edestek(3) numara e?it mi ? 

for i=1:length(ogr)
    indis = find ( strcmp(ogr(i,3),edestek(:,3)) == 1 ) ;

    if isempty(indis)
        fprintf('%s - ogr :  %s %s edestek te bulunamad? \n', ogr(i,3),ogr(i,4),ogr(i,5));
       
        
       indis2=find ( strcmpi(ogr(i,6),edestek(:,4))==1) ;
       if isempty(indis2)
           fprintf('%s - ogr :  %s - numara ve ad soyad eslesmedi \n', ogr(i,3),ogr(i,6));
       else
           fprintf('%s - ogr :  %s edestek : %s no - %s \n', ogr(i,3),ogr(i,6),edestek(indis2,3),edestek(indis2,4));
%            edestek(indis2,3) = ogr(i,1);
       end
               
    end
    % 1 --> indis
    if strcmpi(ogr(i,6), edestek(indis,4))==false
        fprintf('%s - ogr :  %s edestek : %s \n', ogr(i,3),ogr(i,6),edestek(indis,4));
    end

end

% 
% 
% isimler = dir
% isimler.name
% 



