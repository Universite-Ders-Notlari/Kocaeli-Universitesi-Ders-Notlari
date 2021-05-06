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
% This function calculates the value of the objective function.
function fit=test_functions(L,F_index,dim)

%Insert your own objective function with a new F_index.

if F_index==1
fit=sum(L.^2);
end

if F_index==2 
fit=sum(abs(L))+prod(abs(L));
end

if F_index==3
    fit=0;
    for i=1:dim
    fit=fit+sum(L(1:i))^2;
    end
end

if F_index==4
    fit=max(abs(L));
end

if F_index==5
    fit=sum(100*(L(2:dim)-(L(1:dim-1).^2)).^2+(L(1:dim-1)-1).^2);
end

if F_index==6
    fit=sum(floor((L+.5)).^2);
end

return