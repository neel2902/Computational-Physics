% Boundary Value Problems
f1=@(x,y1,y2) y2;
f2=@(x,y1,y2) -y1;
f3=@(x) sin(x);

a=0; b=5*pi/2;
ya=0; yb=1;

alpha=(yb-ya)/(b-a);
epsilon=0.0001;

N=1000;
[x,y1,y2]=RK4_2equations(N,a,b,ya,alpha,f1,f2);

count=1;
while (abs(y1(N)-yb)>epsilon)
    alpha=alpha+(yb-y1(N))/(b-a);
    [x,y1,y2]=RK4_2equations(N,a,b,ya,alpha,f1,f2);
    count=count+1;
    if(count==1000)
        break;
    end
end

plot(x,y1,'r', 'linewidth', 1.5);
hold on
plot(x,f3(x),'b', 'linewidth', 1.5);
hold off