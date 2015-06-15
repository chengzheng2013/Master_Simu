%��Ϲ������£�1����FCSfitJiaoZheng��myFCSJiaoZheng��m�ļ���������������ݣ�sin��ʽ�����ڵ��ļ�����,ȫ���򿪣�
             %2������ֵ���ڱ�����ĵ�14��
             %3������������м����ɫС��ͷ���м��ɣ����ݼ�F5
clear all;clc;
programstarttime=clock;  %ϵͳʱ��
format long;   %������ֵ�������
filename=dir('*.mat');   %��ȡ�ļ���������mat��ʽ�ļ�����Ϣ
[numfile,~]=size(filename);  %��ȡ�ļ���Ŀ
for ii=1:numfile
    name=filename(ii).name;    %����ѭ����ϵ��ļ���
    [t,g]=textread(name,'%f %f',796,'headerlines',87);%��������
    t=load
    [numdata,~]=size(t);
    %����һ�и���ֵ������Ϊ��c,a,b,N,D,S
    [t,g]=size(t);
    a0=[1,0.2,123456,1,17000,0.03];              %����ֵ
    [A,resnorm,residual,exitflag,outpui]=lsqcurvefit(@myFCSJiaoZheng,a0,t,g);     %���������
    a0=A;
    [A,resnorm,residual,exitflag,outpui]=lsqcurvefit(@myFCSJiaoZheng,a0,t,g);     %���η��������
    a0=A;
    [A,resnorm,residual,exitflag,outpui]=lsqcurvefit(@myFCSJiaoZheng,a0,t,g);     %���η��������
    a0=A;
    [A,resnorm,residual,exitflag,outpui]=lsqcurvefit(@myFCSJiaoZheng,a0,t,g);     %�Ĵη��������
    SquChi=sum(residual.*residual);        %�в�ƽ����
    DoF=numdata-2;                   %���ɶ�
    AveChi=SquChi/DoF;               %ƽ��ʣ��в�ƽ����
    Ydata=myFCSJiaoZheng(A,t);      %�����������
    R=corrcoef(g,Ydata);SquR=(R(1,2))^2;         %���ϵ��
    c=num2str(A(1));a=num2str(A(2));b=num2str(A(3));N=num2str(A(4));D=num2str(A(5));S=num2str(A(6));  %��ȡ��Ͻ��
    strAveChi=num2str(AveChi);strSquR=num2str(SquR);   %���ָ��
    lable1={'c';'a';'b';'N';'D';'S';'Chi^2/DoF';'R^2'};   %�༭ͼ��
    lable2={c;a;b;N;D;S;strAveChi;strSquR};
    figure;   %��ʼ��ͼ����
    h=semilogx(t,g,'k.',t,Ydata,'r-');    %xΪ�������껭ͼ
    text(0.004*max(t),0.95*max(g),lable1);     %��ʾ��Ͻ��
    text(0.045*max(t),0.95*max(g),lable2);
    xlabel('delaytime/s');ylabel('G');    %�༭��������
    figure_FontSize=11;                 %�޸�����
    set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
    set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
    set(findobj('FontSize',10),'FontSize',figure_FontSize);
    set(findobj(get(gca,'Children'),'LineWidth',0.5),'LineWidth',2);  %�޸��߿�
    Name=[name,'.','jpeg'];   %�༭ͼ������
    print(gcf,'-djpeg',Name);   %����ͼ��
    close(gcf);
    if ii==1          
        Lable1={'name';'c';'a';'b';'N';'D';'S';'Chi^2/DoF';'R^2'};    %excel��ͷ
        Lable2={name;c;a;b;N;D;S;strAveChi;strSquR};
        Lable=[Lable1,Lable2]';
        Range=['A',num2str(ii)];
        xlswrite('fitResults.xls',Lable,'fitResults',Range);   %����Ͻ��������Excel�ĵ�
    end
    if ii>1          %������Ͻ��
        Lable={name;c;a;b;N;D;S;strAveChi;strSquR}';
        Range=['A',num2str(ii+1)];
        xlswrite('fitResults.xls',Lable,'fitResults',Range);
    end
end
elapsedtime = etime(clock, programstarttime);   %��Ϻ��õ�ʱ��

