%korelasyon 
%% Pearson Korelasyonu

x = [ 1 2 3 4 ]' 
y = [ 1 2.2 2.8 4]'

x2 = x.*x
y2 = y.*y

xy = x.*y

n = length(x)

rxy = (n * sum(xy) - ( sum(x) * sum(y) ) )  / (... 
    ( sqrt( n * sum(x2) - sum(x)^2 ) ) * ...
    ( sqrt( n * sum(y2) - sum(y)^2 ) ) )


%% parametre hesab?
x0 = [ 1 1 1 1 ]'
X = [x0 x]

teta = inv(X'*X)*X'*y


