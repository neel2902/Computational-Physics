%% Hanging chain problem
% Let y1=y and y2=dy/dx
% Then f1=y2 and f2=a*sqrt(1+y2), (derivatives of y1 and y2 wrt x)
% y1(0)=0, y1(10)=0;
% Length of chain=10n (n=2,3,4,5)

%% Code
% Assigning arbitrary value to a;
a=0.567689;

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
[x,y1,y2]=RK4_2equations(N,left,right,y_left,alpha,f1,f2);

count=1;
while (abs(y1(N)-y_right)>epsilon)
    alpha=alpha+(y_right-y1(N))/(right-left);
    [x,y1,y2]=RK4_2equations(N,left,right,y_left,alpha,f1,f2);
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

disp("Length of chain is: "+LengthOfChain);

% For getting the specific length of 10n(n=2,3,4,5), the program is
% repeatedly executed for different values of a, and the value of a is tweaked until it hits the
% specified length.

% Thus, the values of a are:
disp("L=20, a=0.435463");
disp("L=30, a=0.567689");
disp("L=40, a=0.652759");
disp("L=50, a=0.715647");

plot(x, y1);
title("Y vs X for a hanging chain");