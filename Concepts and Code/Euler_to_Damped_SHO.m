% DAMPED SHO
w0=1; gamma=0.07; f0=1; w=1.1;
f1=@(t,y1,y2) y2;
f2=@(t,y1,y2) -w0^2*y1-gamma*y2+f0*cos(w*t);
t0=0; tN=20*(2*pi/w0); y10=1; y20=0;
N=1000;

[t1,x1,v1]=EulerDiff(N, t0, tN, y10, y20, f1, f2);
[t2,x2,v2]=RK2(N, t0, tN, y10, y20, f1, f2);
[t3,x3,v3]=RK4_2equations(N, t0, tN, y10, y20, f1, f2);

z=y10*exp(-gamma*t1/2);

subplot(1,3,1)
plot(t1,x1,'b', 'linewidth', 1.5);
hold on
plot(t1,z,'r', 'linewidth', 1.5);
plot(t1,-z,'r', 'linewidth', 1.5);
hold off

subplot(1,3,2)
plot(t2,x2,'b', 'linewidth', 1.5);
hold on
plot(t2,z,'r', 'linewidth', 1.5);
plot(t2,-z,'r', 'linewidth', 1.5);
hold off

subplot(1,3,3)
plot(t3,x3,'b', 'linewidth', 1.5);
hold on
plot(t3,z,'r', 'linewidth', 1.5);
plot(t3,-z,'r', 'linewidth', 1.5);
hold off