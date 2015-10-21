clc;
clear all;



%%filePath = 'H:\����\StOfGibraltar_R2_FineQuad3_HH_VV_HV_VH_SLC\PK6626_DK340_FQ3_20080331_181047_HH_VV_HV_VH_SLC_(StOfGibraltar_Promo)\C3\';
%%filePath = 'C:\Users\Administrator\Desktop\data_polsar\ESAR_Oberpfaffenhofen\T3\';
filePath = 'C:\Users\Administrator\Desktop\data_polsar\AIRSAR_SanFrancisco\veu\C3\';
row= 89;
col=85 ;
data = zeros(row,col,9);
bean=200;

fIn = fopen([filePath 'C11.bin'],'r');
data(:,:,1) = fread(fIn,[col,row],'float').';     fclose(fIn);
fIn = fopen([filePath 'C22.bin'],'r');
data(:,:,2) = fread(fIn,[col,row],'float').';     fclose(fIn);
fIn = fopen([filePath 'C33.bin'],'r');
data(:,:,3) = fread(fIn,[col,row],'float').';     fclose(fIn);
fIn = fopen([filePath 'C12_real.bin'],'r');
data(:,:,4) = fread(fIn,[col,row],'float').';   fclose(fIn);
fIn = fopen([filePath 'C13_real.bin'],'r');
data(:,:,5) = fread(fIn,[col,row],'float').';   fclose(fIn);
fIn = fopen([filePath 'C23_real.bin'],'r');
data(:,:,6) = fread(fIn,[col,row],'float').';   fclose(fIn);
fIn = fopen([filePath 'C12_imag.bin'],'r');
data(:,:,7) = fread(fIn,[col,row],'float').';   fclose(fIn);
fIn = fopen([filePath 'C13_imag.bin'],'r');
data(:,:,8) = fread(fIn,[col,row],'float').';   fclose(fIn);
fIn = fopen([filePath 'C23_imag.bin'],'r');
data(:,:,9) = fread(fIn,[col,row],'float').';   fclose(fIn); 


c11=data(:,:,1); %c11
c22=data(:,:,2); %c22
c33=data(:,:,3); %c33


spc1=reshape(c11,row*col,1);
spc2=reshape(c22,row*col,1);
spc3=reshape(c33,row*col,1);

spc11=spc1(find(spc1<2))
spc22=spc2(find(spc2<2));
spc33=spc3(find(spc3<2));

outc1=hist(spc11,bean)
outc2=hist(spc22,bean);
outc3=hist(spc33,bean);

outc1=outc1/sum(outc1)*bean/2;

outc2=outc2/sum(outc2)*bean/2;

outc3=outc3/sum(outc3)*bean/2;

x=0:2/bean:2;

x=x(find(x<2));





L=4;
d=1
figure;
sig1=1.5
c1=0.09
plot(x,outc1,'b.');
hold on;
kc1=kwishartpdf( sig1,c1,L,d )
ylim([0,15])
xlabel('Texture'); %��Ǻ�����
ylabel('Pd'); %���������
rc1=keyGen(outc1);
plot(x,rc1,'r-');
hold on;
plot(x,kc1,'kd');
legend('HH hist-diagram ','Multi-H-Wishart','H-distribution')

figure;
plot(x,outc2,'r.');
hold on;

ylim([0,15])
xlabel('Texture') %��Ǻ�����
ylabel('Pd') %���������
sig2=1.5
c2=0.07
kc2=kwishartpdf( sig2,c2,L,d )
rc2=keyGen(outc2);
plot(x,rc2);
plot(x,kc2,'kd')
legend('HV hist-diagram ','Multi-H-Wishart','H-distribution')
% 
% figure;
% 
% plot(x,outc3,'b.');
% 
% hold on;
% ylim([0,5])
% xlabel('Texture') %��Ǻ�����
% ylabel('Pd') %���������
% sig3=2.87
% c3=0.17;
% rc3=keyGen(outc3);
% kc3=kwishartpdf( sig3,c3,L,d )
% plot(x,rc3,'r-');
% plot(x,kc3,'kd')
% 
% legend('VV hist-diagram ','h-wishart','k distribution')



