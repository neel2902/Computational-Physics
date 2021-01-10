v0=input("Enter the initial velocity in SI units: ");
m=input("Enter mass of body in kg: ");
g=input("Enter gravity in SI units: ");

format short;
% Calculating Y(=k/m, where k is the drag coefficient, F=-kv is the drag
% force)
% Fmax = (0-20)% of weight
% Y=randi(20)*g/(v0*100);

Y=15*g/(v0*100);

epsilon=1.0e-3;

f=@(t)((v0+g/Y)*(1-exp(-Y*t))-g*t)/Y;
derivative_f=@(t) ((v0+g/Y)*(Y*exp(-Y*t))-g)/Y;

% Either we take initial time guess from the user, or we do it ourselves by
% taking a high enough time so that its nearest root is not 0, which is the
% initial condition

% t=input("Enter initial time guess: ");
t=1000;
u=t-f(t)/derivative_f(t);
count=1;
while abs(u-t)>=epsilon
    t=u;
    u=t-f(t)/derivative_f(t);
    count=count+1;
end

% Tolerance for time t=0;
if (u<1.0e-8)
   u=0;
end

disp("Drag coefficient k: "+Y*m);
ratio=Y*m*v0/(m*g);
disp("Max-drag-force/Weight: "+ratio*100+"%");
disp("Total flight time in seconds: "+u);

x=linspace(0,u,100);
s=f(x);
v=derivative_f(x);

% Displacement vs time graph
comet(x,s);
title("Displacement vs Time graph");