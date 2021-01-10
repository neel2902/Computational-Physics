%Linear spline interpolation
%Get data points
f=@(x) x.^2-3*x+4;
l=-10;
r=10;
n=5;
x=linspace(l,r,n);
h=(r-l)/(n-1);
y=f(x);

a=zeros(1,n-1);
b=zeros(1,n-1);

for i=1:n-1
    a(i)=(y(i+1)-y(i))/(x(i+1)-x(i));
    b(i)=(x(i+1)*y(i)-x(i)*y(i+1))/(x(i+1)-x(i));
end

m=20;
t=linspace(l,r,m);
disp(t);
z=zeros(1,m);

for i=1:m-1 
    n1=1+fix((t(i)-l)/h);
    z(i)=a(n1)*t(i)+b(n1);
end
z(m)=y(n);

plot(t,z,'r','linewidth', 1.5)
hold on
plot(x,y,'*','markersize', 12, 'markeredgecolor', 'k')
y=f(t);
plot(t,y,'b', 'linewidth', 1.5) 
hold off
grid on
