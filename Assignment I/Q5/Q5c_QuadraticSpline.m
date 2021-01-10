f=@(x) log(x);
n=11;
x1 = 1; xn = 4;
x=linspace(x1,xn,n);
h=(xn-x1)/(n-1);
y=f(x);


% Coefficients for the n-1 polynomials
a=zeros(1,n-1);
b=zeros(1,n-1);
c=zeros(1,n-1);


% cs and bs and as
c(1)=y(1);
b(1)=(y(2)-y(1))/h;
a(1)=(y(2)-y(1))/(h*h)-(b(1)/h);

for i=2:n-1
    c(i)=y(i);
    b(i)=(2*(y(i)-y(i-1))/h)-b(i-1);
    a(i)=(y(i+1)-y(i))/(h^2)-b(i)/h;
end



% Generate more points on the interpolation curve
m = 101;
t=linspace(x1,xn,m);
w=zeros(1,m);


for i=1:m-1
 n1=1+fix((t(i)-x1)/h);
 w(i)=a(n1)*(t(i)-x(n1))^2+b(n1)*(t(i)-x(n1))+c(n1);
end
w(m)=y(n);

% Using inbuilt MATLAB Cubic spline function
cubic_spline=spline(x,y,t);

% Plot the graph now

subplot (1,2,1)
plot(x,y,'*','markersize',12,'markeredgecolor','k')
hold on
plot(t,f(t),'g','linewidth',1.5)
plot(t,w,'b','linewidth',1.5)
hold off
ylim([min(f(t)),max(f(t))]);

subplot (1,2,2)
plot(x,y,'*','markersize',12,'markeredgecolor','k')
hold on
plot(t,f(t),'g','linewidth',1.5);
plot(t,cubic_spline,'r','linewidth',1.5);
hold off

ylim([min(f(t)),max(f(t))]);
