% ogr(3) -> numara
% ogr(6) -> ad-soyad

% edestek(3) -> numara 
% edestek(4) -> ad soyad

% ogr(3) numara ile edestek(3) numara e?it mi ? 

for i=1:length(edestek)
    indis = find ( strcmp(edestek(i,3),ogr(:,3)) == 1 ) ;

    if isempty(indis)
        fprintf('%s - ogr :  %s %s edestek te bulunamad? \n', edestek(i,3),edestek(i,4));
       
        
       indis2=find ( strcmpi(ogr(:,6),edestek(i,4))==1) ;
       if isempty(indis2)
           fprintf('%s - ogr :  %s - numara ve ad soyad eslesmedi \n', ogr(indis2,3),ogr(indis2,6));
       else
           fprintf('%s - ogr :  %s edestek : %s no - %s \n', ogr(indis2,3),ogr(indis2,6),edestek(i,3),edestek(i,4));
%            edestek(indis2,3) = ogr(i,1);
       end
               
    end
    % 1 --> indis
    if strcmpi(ogr(indis,6), edestek(i,4))==false
        fprintf('%s - ogr :  %s edestek : %s \n', ogr(indis,3),ogr(indis,6),edestek(i,4));
    end

end

% 
% 
% isimler = dir
% isimler.name
% 



