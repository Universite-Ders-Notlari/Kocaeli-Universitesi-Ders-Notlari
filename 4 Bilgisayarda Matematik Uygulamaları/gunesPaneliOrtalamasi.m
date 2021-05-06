if gunesPaneli(1,1:4) == [ 26 9 2015 178787 ]
    display('esit');
end

% find( gunesPaneli(1,1:4) ==   [ 26 9 2015 17 ] ) 


% 26.9.2015 saat 17 'deki verilerin ortalamas?n? hesaplay?p bir matriste
% saklay?n?z. 
index = [];
for i = 1:length(gunesPaneli)
if  gunesPaneli(i,1:4) == [ 26 9 2015 17 ]
    index = [ index i ] ;
end 
end
gunesPaneliOrtalam = [ 26 9 2015 17 mean( gunesPaneli( index,    7:11 ) ) ]

% 26.9.2015 saat 17,18,19,20,21,22,23 'deki verilerin ortalamas?n? hesaplay?p bir matriste
% saklay?n?z. 
clear gunesPaneliOrtalama
gunesPaneliOrtalama = [];
for j= 17:23
    index = [];
    for i = 1:length(gunesPaneli)
    if  gunesPaneli(i,1:4) == [ 26 9 2015 j ]
        index = [ index i ] ;
    end 
    end
    gunesPaneliOrtalama = [ gunesPaneliOrtalama ; 26 9 2015 j mean( gunesPaneli( index,    7:11 ) ) ]
end




% 26.9.2015 saat 17 18 19 20 21 22 23 için ortalama verileri hesaplay?p saklay?n.


for j=17:23
    index = [] ;
    % arama ba?la. ilk bulma 
    ilkBulma = false;
    for i=1:length(gunesPaneli)

        if gunesPaneli(i,1:4) == [ 26 9 2015 j ]
            ilkBulma  = true;
    %         e?it olan tüm sat?rlardaki de?erlerin ortalamas?
              index = [ index i ]
    %         mean( gunesPaneli( ???  , 7:11 ) 
                continue
        end

        if ilkBulma == true 
            break
        end

    end

%     ba?ka bir de?i?kende saklay?n. 
     gunesPaneliOrtalama(j-16,:) =  mean( gunesPaneli( index  , [ 1:4 7:11 ]  ) ) 


end



% verilerdeki tarih (1:3 sütun) ve saat (4.sütun) bilgilerini ayr? bir matriste saklay?n.

tarihler = [];
% tarihler(1,:) = gunesPaneli(1,1:4);
tarihler =  [ gunesPaneli(1,1:4) ]
for k = 2:length(gunesPaneli)
    if tarihler(end) ~= gunesPaneli(k,1:4) 
        tarihler = [ tarihler ; gunesPaneli(k,1:4) ] 
    end 
end


%  tarihler matrisindeki bilgilere göre ortalamay? hesaplay?n.
clear gunesPaneliOrtalama
tarihler

for j=1:length(tarihler)

    index = [] ;
    % arama ba?la. ilk bulma 
    ilkBulma = false;
    for i=1:length(gunesPaneli)

        if gunesPaneli(i,1:4) ==  tarihler(j,:)
            ilkBulma  = true;
    %         e?it olan tüm sat?rlardaki de?erlerin ortalamas?
              index = [ index i ];
    %         mean( gunesPaneli( ???  , 7:11 ) 
                continue
        end

        if ilkBulma == true 
            break
        end

    end

%     ba?ka bir de?i?kende saklay?n. 
     gunesPaneliOrtalama(j,:) =  mean( gunesPaneli( index  , [ 1:4 7:11 ]  ) ) ;


end
