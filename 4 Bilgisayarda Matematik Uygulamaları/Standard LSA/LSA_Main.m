%{
Lightning Search Algorithm (LSA)

Platform: Matlab 2012a,2013a   


Cite this algorithm as;
[1]. Hussain Shareef , Ahmad Asrul Ibrahim, Ammar Hussein Mutlag, Lightning Search Algorithm, 
Applied Soft Computing 36 (2015) 315–333.


Copyright Notice
Copyright (c) 2015, Hussain Shareef and Ahmad Asrul Ibrahim 
All rights reserved.

Redistribution and use in source and binary forms, with or without 
modification, are permitted provided that the following conditions are 
met:

    * Redistributions of source code must retain the above copyright 
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the copyright 
      notice, this list of conditions and the following disclaimer in 
      the documentation and/or other materials provided with the distribution
      
THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" 
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE 
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE 
ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE 
LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR 
CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF 
SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
POSSIBILITY OF SUCH DAMAGE.


%}


% clc
% clear all
% close all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [grandmin,elapsed_time]=LSA_Main(F_index) 
tic;%start stopwatch
% F_index = 1; % Function 1-6 % Refer to other test function 7-24 in [1].
[low,up,dim]=test_functions_range(F_index);

N = 50; % population size/number of agents
D = dim; % number of dimension
T = 500; % maximum number of iteration

% Set upper bound & lower bound
if size(up,2)==1
    UB = ones(1,D).*up;
    LB = ones(1,D).*low;
end
if size(up,2)>1
    UB = up;
    LB = low;
end

%randomly create 1st population
for d = 1:D
    Dpoint(:,d)= rand(N,1)*(UB(d)-LB(d))+LB(d);
end

ch_time = 0; % reset
max_ch_time = 10;
fit_old = 10^10*(ones(1,N));
direct = sign(unifrnd(-1,1,1,dim));

for t = 1:T
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Evaluate performance
    fit = evaluateF(Dpoint,F_index); 
    Ec = fit;
    
    % update channel
    ch_time = ch_time+1;
    if ch_time >= max_ch_time
        [Ms ds]=sort(Ec,'ascend');
        Dpoint(ds(N),:) = Dpoint(ds(1),:); % Eliminate the worst channel
        Ec(ds(N)) = Ec(ds(1)); % Update  
        ch_time = 0; % reset
    end
    
    % Rangking the fitness value
    [Ms ds]=sort(Ec,'ascend');
    best = Ec(ds(1));
    worst = Ec(ds(N));
    
    Energy = 2.05 - 2*exp(-5*(T-t)/T);% Update energy

    % update direction
    for d = 1:D
        Dpoint_test = Dpoint(ds(1),:);
        Dpoint_test(d) = Dpoint_test(d)+direct(d)*0.005*(UB(d)-LB(d));
        fv_test = evaluateF(Dpoint_test,F_index);
        if fv_test < best % If better, +ve direction
            direct(d) = direct(d);
        else
            direct(d) = -1*direct(d);
        end
    end
    % update position
    for i = 1:N
        dist=Dpoint(i,:)-Dpoint(ds(1),:);
            for d = 1:D
                if Dpoint(i,:)==Dpoint(ds(1),:)
                    Dpoint_temp(d) = Dpoint(i,d)+direct(d)*abs(normrnd(0,Energy));
                else
                    if dist(d)<0
                        Dpoint_temp(d) = Dpoint(i,d)+exprnd(abs(dist(d)));
                    else
                        Dpoint_temp(d) = Dpoint(i,d)-exprnd(dist(d));
                    end
                end
                if (Dpoint_temp(d)>UB(d))||(Dpoint_temp(d)<LB(d))
                    Dpoint_temp(d) = rand(1)*(UB(d)-LB(d))+LB(d); % Re-initialized
                end
            end
            
            fv = evaluateF(Dpoint_temp,F_index);
            if fv < Ec(i)
                Dpoint(i,:) = Dpoint_temp;
                Ec(i) = fv;
                % Focking procedure
                if rand < 0.01
                    for d = 1:D 
                        Dpoint_fock(d) = UB(d)+LB(d)-Dpoint_temp(d);% Focking
                    end
                    fock_fit = evaluateF(Dpoint_fock,F_index); % Evaluate
                    if fock_fit < Ec(i) 
                        Dpoint(i,:) = Dpoint_fock; % Replace the channel
                        Ec(i) = fock_fit;
                    end
                end
            end   
    end
    if best == worst
        break
    end
% record the performance
    fitness(t) = min(fit);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
end
elapsed_time=toc; % time taken for this algorithm
% select the optimal value
grandmin = min(fitness);
y = fitness;
x = 1:length(y);
plot(x,y,'Linewidth',2)
xlabel('No of Iteration');
ylabel('Fitness Value');
axis([0 max(x) min(y) max(y)]); 
fprintf(1,'Optimal value = %f\n', grandmin);