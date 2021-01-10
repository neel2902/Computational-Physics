% Question 1a %
k=1;
b=1.57;
a=0; 
f=@(theta) (1/sqrt(1-(k^2)*(sin(theta))^2));
% Dividing the interval (a,b) into 10001 points, with step size h
N=10001; h=(b-a)/(N-1);
x=linspace(a,b,N);
I=0;
for i=1:2:N-2
    I=I+(h/3)*(f(x(i))+4*f(x(i+1))+f(x(i+2)));
end
disp("Integral value using Simpson's rule is: "+I);
% y1, y2 are the angular position and velocity
% f1, f2 are their respective time derivatives
L=1;
g=9.8;

w0=sqrt(g/L);
y10=10;
y20=0;
f1=@(t,y1,y2) y2;
f2=@(t,y1,y2) (-(w0^2)*(sind(y1)));

startTime=0;
endTime=50;

[x,y1,y2,tP]=RK4_2equations(1000,startTime,endTime,y10,y20,f1,f2,0);

figure
plot(x,y1,'r', 'LineWidth',1.5);
title('Angle vs Time graph for the release angle in the slider');
xlabel('Time');
ylabel('Angle');

figure
plot(x,y2,'g', 'LineWidth',1.5);
title('Angular velocity vs Time graph for the release angle in the slider');
xlabel('Time');
ylabel('Angular velocity');


% % Calculating Time period for different alphas
timePeriods=zeros(1,17);
k=1;
for i=10:10:170
    [~,~,~,tP]=RK4_2equations(1000,0,30,i,0,f1,f2,1);
    timePeriods(k)=tP;
    k=k+1;
end
alphas=linspace(10,170,17);
figure
plot(alphas,timePeriods,'r', 'LineWidth',1.5);
title('Time Period vs Alpha');
xlabel('Alpha(Initial angle)');
ylabel('Time Period');
% Integral calculated for various angles
theoryTimePeriods = zeros(1,17);
for i=1:17
    k=sind(i*5);
    b=pi/2;
    a=0;  
f=@(theta) (1/sqrt(1-(k^2)*(sin(theta))^2));
% Dividing the interval (a,b) into 10001 points, with step size h
    N=10001; h=(b-a)/(N-1);
    x=linspace(a,b,N);
    I=0;
    for j=1:2:N-2
        I=I+(h/3)*(f(x(j))+4*f(x(j+1))+f(x(j+2)));
    end
    theoryTimePeriods(i) = 4*w0*I;
end

figure
plot(alphas,theoryTimePeriods,'b', 'LineWidth',1.5);
title('Time Period vs Alpha Plots Elliptical in blue');
xlabel('Alpha(Initial angle)');
ylabel('Time Period');
hold on
plot(alphas,timePeriods,'r', 'LineWidth',1.5);
hold off
% % ***********

% RK_4 method, customised for question 1
function[x,y1,y2,tP]=RK4_2equations(N,x0,xn,y10,y20,f1,f2,timePeriodFindEnable)
tP=0;

if(timePeriodFindEnable==0)
h=(xn-x0)/(N-1);
x=zeros(1,N); y1=zeros(1,N); y2=zeros(1,N);
x(1)=x0; y1(1)=y10; y2(1)=y20; 
    
    
for i=2:N
    k11=f1(x(i-1), y1(i-1), y2(i-1));
    k21=f2(x(i-1), y1(i-1), y2(i-1));
   
    k12=f1(x(i-1)+h/2, y1(i-1)+(h/2)*k11, y2(i-1)+(h/2)*k21);
    k22=f2(x(i-1)+h/2, y1(i-1)+(h/2)*k11, y2(i-1)+(h/2)*k21);
    
    k13=f1(x(i-1)+h/2, y1(i-1)+(h/2)*k12, y2(i-1)+(h/2)*k22);
    k23=f2(x(i-1)+h/2, y1(i-1)+(h/2)*k12, y2(i-1)+(h/2)*k22);
    
    k14=f1(x(i-1)+h, y1(i-1)+(h)*k13, y2(i-1)+(h)*k23);
    k24=f2(x(i-1)+h, y1(i-1)+(h)*k13, y2(i-1)+(h)*k23);
    
    y1(i)=y1(i-1)+h*(k11+2*k12+2*k13+k14)/6;
    y2(i)=y2(i-1)+h*(k21+2*k22+2*k23+k24)/6;
   
    x(i)=x(i-1)+h;
end

else
    N=100000;
    h=(xn-x0)/(N-1);
    x=zeros(1,N); y1=zeros(1,N); y2=zeros(1,N);
    x(1)=x0; y1(1)=y10; y2(1)=y20; 
    
for i=2:N
    
    y2_prev=y2(i-1);
    
    k11=f1(x(i-1), y1(i-1), y2(i-1));
    k21=f2(x(i-1), y1(i-1), y2(i-1));
   
    k12=f1(x(i-1)+h/2, y1(i-1)+(h/2)*k11, y2(i-1)+(h/2)*k21);
    k22=f2(x(i-1)+h/2, y1(i-1)+(h/2)*k11, y2(i-1)+(h/2)*k21);
    
    k13=f1(x(i-1)+h/2, y1(i-1)+(h/2)*k12, y2(i-1)+(h/2)*k22);
    k23=f2(x(i-1)+h/2, y1(i-1)+(h/2)*k12, y2(i-1)+(h/2)*k22);
    
    k14=f1(x(i-1)+h, y1(i-1)+(h)*k13, y2(i-1)+(h)*k23);
    k24=f2(x(i-1)+h, y1(i-1)+(h)*k13, y2(i-1)+(h)*k23);
    
    y1(i)=y1(i-1)+h*(k11+2*k12+2*k13+k14)/6;
    y2(i)=y2(i-1)+h*(k21+2*k22+2*k23+k24)/6;
   
    x(i)=x(i-1)+h;
    
    if((y2(i)*y2_prev)<0)
        break;
    end
end
    tP=2*i*h;
end
end



