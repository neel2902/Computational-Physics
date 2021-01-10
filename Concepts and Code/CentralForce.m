%  Rotating table top

w=0.2;
alpha=1;
R=2;
k=3;

f1=@(t,y1,y2,y3,y4) y2;
f2=@(t,y1,y2,y3,y4) k*y1^(1/2) + y1*y4^2;
f3=@(t,y1,y2,y3,y4) y4;
f4=@(t,y1,y2,y3,y4) -2*y2*y4;


y10=0;y20=0.01;y30=pi/4;y40=0;

t0=0; tn=100;
N=1000;

[t,y1,y2,y3,y4]=RK4(N,t0,tn,y10,y20,y30,y40,f1,f2,f3,f4);
polarplot(t,y1);
rlim([0 R]);

