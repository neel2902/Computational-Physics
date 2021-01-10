% Polynomial Curve Fitting

p0=@(x) 1;
p1=@(x) x;
p2=@(x) x.^2;
p3=@(x) x.^3;
p4=@(x) x.^4;

% Actual function
f=@(x) x.^2+3*x;
a=-1; b=1;
n=15; m=5;
x=linspace(a,b,n);

% Add random values
rand_vector = 2*rand(1,n)-1;
y=f(x)+0.4*randi(2);
A=zeros(m,n);


for k=1:n
    A(1,k)=p0(x(k));
    A(2,k)=p1(x(k));
    A(3,k)=p2(x(k));
    A(4,k)=p3(x(k));
    A(5,k)=p4(x(k));
end

B=A*A';
I=eye(m);
C=B\I; D=C*A;
alpha=D*y';

t=linspace(a,b,100);
z=alpha(1)*p0(t)+alpha(2)*p1(t)+alpha(3)*p2(t)+alpha(4)*p3(t)+alpha(5)*p4(t);

plot(t,z,'linewidth', 1.0)
hold on
plot(x, y, '*')
hold off








