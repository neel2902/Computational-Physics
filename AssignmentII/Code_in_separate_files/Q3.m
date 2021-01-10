% Let y1=y and y2=dy/dx
% Then f1=y2 and f2=a*sqrt(1+y2), (derivatives of y1 and y2 wrt x)
% y1(0)=0, y1(10)=0;
% Length of chain=10n (n=2,3,4,5)
clc;
clear;
close all;
clear livescript;

% Assigning arbitrary value to a;
a=0.4;

% The values of a for the given lengths are(calculated after manually tweaking a):
% L=20, a=0.435463;
% L=30, a=0.567689;
% L=40, a=0.652759;
% L=50, a=0.715647;



f1=@(x,y1,y2) y2;
f2=@(x,y1,y2) a*sqrt(1+(y2)^2);

% Range of x
left=0; right=10;
y_left=0; y_right=0;

% Shooting method
alpha=(y_right-y_left)/(right-left);
epsilon=0.0001;
N=10000;
[x,y1,y2]=RK4_2equationsB(N,left,right,y_left,alpha,f1,f2);

count=1;
while (abs(y1(N)-y_right)>epsilon)
    alpha=alpha+(y_right-y1(N))/(right-left);
    [x,y1,y2]=RK4_2equationsB(N,left,right,y_left,alpha,f1,f2);
    count=count+1;
    if(count==10000)
        break;
    end
end

% Calculating length of chain
LengthOfChain=0;
for i=2:N
    LengthOfChain = LengthOfChain + sqrt((y1(i)-y1(i-1))^2 + (x(i)-x(i-1))^2);
end

disp("Length of chain for given value of a in slider is: "+LengthOfChain);


disp("Values of a for the following lengths are: ")
disp("L=20, a=0.435463");
disp("L=30, a=0.567689");
disp("L=40, a=0.652759");
disp("L=50, a=0.715647");

plot(x, y1);
title("Y vs X for a hanging chain");
xlabel('X');
ylabel('Y');

function[x,y1,y2]=RK4_2equationsB(N,x0,xn,y10,y20,f1,f2)
% Basic RK_4
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
end


