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

% This function gives boundaries and dimension of search space for test functions.
function [down,up,dim]=test_functions_range(F_index)

%If lower bounds of dimensions are the same, then 'down' is a value.
%Otherwise, 'down' is a vector that shows the lower bound of each dimension.
%This is also true for upper bounds of dimensions.

%Insert your own boundaries with a new F_index.

dim=30;
if F_index==1
    down=-100;up=100;
end

if F_index==2
    down=-10;up=10;
end

if F_index==3
    down=-100;up=100;
end

if F_index==4
    down=-100;up=100;
end

if F_index==5
    down=-30;up=30;
end

if F_index==6
    down=-100;up=100;
end

return