function y=zhongliju(u,m2)
Ang=u;
m1=1.25;
%m2=1.79;
l1=0.1448;l2=0.5550;
g=9.8;
TG=m1*g*l1*cos(Ang)+m2*g*l2*cos(Ang);
y=TG;