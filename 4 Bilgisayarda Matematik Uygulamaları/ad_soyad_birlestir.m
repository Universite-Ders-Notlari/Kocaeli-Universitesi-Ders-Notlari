for i=1:length(edestek)

        edestek(i,4) = [ upper(deblank(char(edestek(i,1)))) char(' ') upper(deblank(char(edestek(i,2))))];
        
end


for i=1:length(ogr)

        ogr(i,6) = [ upper(deblank(char(ogr(i,4)))) char(' ') upper(deblank(char(ogr(i,5))))];
        
end
