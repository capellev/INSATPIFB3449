function [ pertub ] = genererPerturbation( alpha )
%GENERERPERTURBATION Summary of this function goes here
%   Detailed explanation goes here

a = -alpha; 
b = alpha;
pertub = a + (b-a) * rand(1);


end

