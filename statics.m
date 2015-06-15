clc
clear all;
filePath = 'C:\Users\Administrator\Desktop\data_polsar\AIRSAR_SanFrancisco\C3\';
row=900;
col=1024;
  c11 = zeros(row,col);
precision_cnt=1000;

%filePath = 'C:\Users\Administrator\Desktop\AIRSAR_SanFrancisco\C3\';
fIn = fopen([filePath 'C11.bin'],'r');
c11(:,:) = fread(fIn,[col,row],'float').';    fclose(fIn);
cnt=[];
spa=reshape(c11,col*row,1);
spc=spa(find(spa<1));
hist(spc,1000);
hold on;
max_val=(hist(spc,1000));












