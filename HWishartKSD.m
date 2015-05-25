function [ ksd ] = HWishartKSD( a,k,v,d ,cov,col,row,L,dim)
%UNTITLED Summary of this function goes here
%����HWisahart�ֲ���ks����
%   Detailed explanation goes here
precision_cnt=50;
max_val=max(max(a));
interval=max_val/precision_cnt;
B={[0,1/v;L*dim-k*v,1],[]};
A={[],[]};

cnt=[];
hwpdf=[];
for i=0:(precision_cnt-1);
    flag_a=(a>interval*i&a<=interval*(i+1));
    cnt(i+1) =sum((sum(flag_a,1)),2);   
    res=0.1;
    z=(max_val*(i+1))/2;
    x=L*z/(cov*d);
    fox=foxh(x,B,A,res);
    myfox_A=vpa(fox,10);
    spa=power(L,L*dim)*power(L*z/cov,k*v-L*dim)*power(z,L*dim);
    spb=power(d,k*v)*gamma(k)*power(cov,L)*gamma(L)*gamma(L-1);
    hwpdf(i+1)=interval*spa*myfox_A/spb;  
   
        
    
end;
 cnt_per=cnt/(col*row);
 ksd=max(abs(cnt_per-hwpdf));

end

