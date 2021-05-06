clc; close all;

fprintf('Örnek:  x1 + 2*x3 = -9\t\tdenklem sistemindeki\n\t\t2*x1 + x2 = 5\t\tbilinmeyenleri bulunuz.\n\t\t3*x1 + 2*x2 + x3 = 4 \n\n');

A=[1 0 2; 2 1 0; 3 2 1];
('A matrisi:\n');
disp(A);

b=[-9; 5; 4];
fprintf('b matrisi\n');
disp(b);

A_ters=inv(A);
fprintf('A''nýn tersi\n');
disp(A_ters);

x=A_ters*b;
fprintf('x vektörü = A-¹.b:\n');
fprintf('x1: %2.0f\n', x(1,1));
fprintf('x2: %2.0f\n', x(2,1));
fprintf('x3: %2.0f\n', x(3,1));

fprintf ('det(A): %f\n\n', det(A));

fprintf ('D1:\n');
d1=horzcat(b, A(:,2), A(:,3)); % b A2 A3 %
disp(d1);

fprintf ('D2:\n');
d2=horzcat(A(:,1), b, A(:,3)); % A1 b A3 %
disp(d2);

fprintf ('D3:\n');
d3=horzcat(A(:,1), A(:,2), b); % A1 A2 b%
disp(d3);

disp(det(d3));
