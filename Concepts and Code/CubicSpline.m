f=@(x) 4*x+2*x.^2+2+0.5*x.^5;
n=8;
x1 = -5; xn = 5;
x=linspace(x1,xn,n);
h=(xn-x1)/(n-1);
y=f(x);
d=zeros(1,n-2);

for i=1:n-2
 d(i)=6*(y(i+2)-2*y(i+1)+y(i))/h^2;
end

% Find the alphas.
a(1)=0;c(n)=0;
a(2:n)= 1;b(1:n)=4;c(1:n-1)=1;
alpha=functionsContainer.Thomas_Algo(a,b,c,d,n-2);
alpha=[0,alpha,0];

% Find the coefficients of the cubic polynomials
p=zeros(1,n-1);q=zeros(1,n-1);r=zeros(1,n-1);s=zeros(1,n-1);

for i=1:n-1
     p(i)=(alpha(i+1)-alpha(i))/(6*h);
     q(i)=alpha(i)/2;
     r(i)=(y(i+1)-y(i))/h-h*(2*alpha(i)+alpha(i+1))/6;
     s(i)=y(i);
end




% Generate more points on the interpolation curve
m = 101;
t=linspace(x1,xn,m);
w=zeros(1,m);
for i=1:m-1

 n1=1+fix((t(i)-x1)/h);
 w(i)=p(n1)*(t(i)-x(n1))^3+q(n1)*(t(i)-x(n1))^2+...
 r(n1)*(t(i)-x(n1))+s(n1);
end
w(m)=y(n);

plot(x,y,'*','markersize',12,'markeredgecolor','k')
hold on
plot(t,f(t),'r','linewidth',1.5)
plot(t,w,'b','linewidth',1.5)
hold off

