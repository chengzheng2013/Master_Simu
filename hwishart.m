%H-wishart probability distribution function
%�����ܶȺ�������

clear all
clc


%%%%%
kappa=1;


axis([0 12 0 0.6]);


m=1;

while m<=3
    p_i=@(i,k,g,v)
