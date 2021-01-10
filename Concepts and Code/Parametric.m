% Parametric Equations Solver
x=@(t) 5*sin(3*t);
y=@(t) 4*cos(t)-1.3*cos(2*t)-0.6*cos(3*t)-0.2*cos(4*t);

x1=zeros(1, 30);
y1=zeros(1, 30);

t=linspace(-1.57,1.57,30);

for i=1:20
    x1(i)=x(t(i));
    y1(i)=y(t(i));
end


plot(x1,y1,'r','linewidth',1.5);