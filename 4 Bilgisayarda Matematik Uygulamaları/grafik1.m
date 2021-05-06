x = linspace(-pi,pi,20);
y = sin(x);
plot(x,y,'Color', [ 0 0.25 0.75] ...
            ,'LineWidth',2,...
                'MarkerEdgeColor','k',...
                'MarkerFaceColor','b',...
                'MarkerSize',8)
            
            
x = 0: pi/ 360 : 2*pi; % 0?dan 360?a a?? dizisi olu?turduk.
y1 = sin(x);
y2 = cos(x);
figure(1);
plot(x,y1);
hold on
figure(2);
plot(x,y2);


legend('sin(x)','cos(x)')
grid
xlabel('a?? (rad)')
title('sin(x) ve cos(x) Grafi?i');
