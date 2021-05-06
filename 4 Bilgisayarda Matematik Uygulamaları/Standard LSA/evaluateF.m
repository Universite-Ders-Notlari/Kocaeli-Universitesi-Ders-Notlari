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
%This function Evaluates the Projectiles. 
function   fitness=evaluateF(X,F_index);

[N,dim]=size(X);
for i=1:N 
    %L is the location of projectile number 'i'
    L=X(i,:); 
    %calculation of objective function for projectile number 'i'
    fitness(i)=test_functions(L,F_index,dim);
end
return