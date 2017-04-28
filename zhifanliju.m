function y = zhifanliju(Ang,P0)
%Ang = u(1)
%P0 = u(2)
l2=0.335;l3=0.580;
%P0=5e5;
S=78.54e-6;
n=1.5;V0=2.5e-5;
beta=deg2rad(45.83);
l1=sqrt((l2*l2+l3*l3-2*l2*l3*cos(beta)));
ang0=asin(l3*sin(beta)/l1);
l4=sqrt(l1*l1+l2*l2-2*l1*l2*cos(ang0));
l5=sqrt(l1*l1+l2*l2-2*l1*l2*cos(ang0-Ang));
deltaL=l4-l5;
l=l1*l2*sin(ang0-Ang)/l5;
TR=(P0*S*l*(V0/(V0-S*deltaL*1e-3))^n);
y=TR;