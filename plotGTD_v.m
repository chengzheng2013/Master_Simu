sigma=2;


k=2;
v1=1;
v2=2;
v3=4;
[y1]=genralGamma(k,v1,sigma);

[y2]=genralGamma(k,v2,sigma);

[y3]=genralGamma(k,v3,sigma);
x=0:0.1:10;
plot(x,y1,'r*');
hold on;
plot(x,y2,'b-')
hold on;
plot(x,y3,'k');

xlabel('x'); %��Ǻ�����
ylabel('f(x)'); %���������
legend('v=1 ','v=2','v=4')
