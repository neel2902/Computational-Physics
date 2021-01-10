f=@(x) (x.^2+2*sin(x));
l=-20;
r=20;
n=5;
x=linspace(l,r,n);
% n+1 data points
y=f(x);


% Now we have to interpolate
m=100;
z=zeros(1,m); t=linspace(l,r,m);
for i=1:m
    for k=1:n
        z(i)=z(i)+y(k)*MyLagrange(k,n,t(i),x)/MyLagrange(k,n,x(k),x);
    end
end

plot(t,z,'r','linewidth', 1.5)
hold on
plot(x,y,'*','markersize', 12, 'markeredgecolor', 'k')
y=f(t);
plot(t,y,'b', 'linewidth', 1.5) 
hold off
grid on


% Lagrange Polynomial
% z are our input points
% y is to be our output
% k is our order
% n is the degree of the polynomial
function[y] = MyLagrange(k,n,x,z)
    y=1;
    for i=1:n
        if(i~=k)
            y=y*(x-z(i));
        end
    end
end


