<<<<<<< HEAD
clear all;clc;

filePath = 'C:\Users\Administrator\Desktop\data_polsar\AIRSAR_SanFrancisco\sea\C3\';

row=127;
col=127 ;
%���ú��� ����ھ���Ķ����ۻ����Ĳ���
[k,sigma,v,covhh,covhv,covvv]=ParameterEstimation(filePath,row,col); %��ͨ��
%[k,sigma,v,covhh]=ParameterEstimationhh(filePath,row,col); 



%[k,sigma,v]= mlcparameter( filePath,row,col ) %��������
=======
clc;

clear all;



filePath = 'C:\Users\Administrator\Desktop\data_polsar\AIRSAR_SanFrancisco\sea\C3\';
row= 127;

col=127 ;
% [k,sigma,v,covhh,covhv,covvv]=ParameterEstimation(filePath,row,col);
[k,sigma,v,cov]=ParameterEstimationhh(filePath,row,col);




>>>>>>> c6aeb1a21731875e96727aeb0dcad5739ec869c9

    




