function [ fac ] = datafitting( ac )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    [t,g]=size(ac);
    a0=[1,0.2,123456,1,17000,0.03];              %����ֵ
    [A,resnorm,residual,exitflag,outpui]=lsqcurvefit(@myFCSJiaoZheng,a0,t,g);     %���������
    a0=A;
    [A,resnorm,residual,exitflag,outpui]=lsqcurvefit(@myFCSJiaoZheng,a0,t,g);     %���η��������
    a0=A;
    [A,resnorm,residual,exitflag,outpui]=lsqcurvefit(@myFCSJiaoZheng,a0,t,g);     %���η��������
    a0=A;
    [A,resnorm,residual,exitflag,outpui]=lsqcurvefit(@myFCSJiaoZheng,a0,t,g);     %�Ĵη��������
    SquChi=sum(residual.*residual);        %�в�ƽ����
    DoF=1-2;                   %���ɶ�
    AveChi=SquChi/DoF;               %ƽ��ʣ��в�ƽ����
    Ydata=myFCSJiaoZheng(A,t)
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
    fac=A;
end

