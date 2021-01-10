% Lissajous figures
wx=pi+0.1;
alpha=2;
wy=pi;

f1=@(t,y1,y2,y3,y4) y2;
f2=@(t,y1,y2,y3,y4) -wx^2*y1-alpha*y1*y3;
f3=@(t,y1,y2,y3,y4) y4;
f4=@(t,y1,y2,y3,y4) -wy^2*y3-alpha*y1*y3;

t0=0; tN=500; N=1000000;
y10=1; y20=1; y30=1; y40=0;

[t,x,vx,y,vy]=RK4(N,t0,tN,y10,y20,y30,y40,f1,f2,f3,f4);

comet(x,y);