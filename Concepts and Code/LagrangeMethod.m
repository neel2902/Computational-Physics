f=@(x) (x.^2+4*sin(x)+3);
n=10;a=10;
x=linspace(-a,a,n);
y=f(x);

m=100;
z=zeros(1,m); t=linspace(-a,a,m);
for j=1:m
    for k=1:n
        z(j)=z(j)+y(k)*Lagrange(k,n,t(j),x)/Lagrange(k,n,x(k),x);
    end
end

plot(t,z,'r','linewidth', 1.5)
hold on
plot(x,y,'*','markersize', 12, 'markeredgecolor', 'k')
y=f(t);
plot(t,y,'b', 'linewidth', 1.5) 
hold off
grid on


function[y]=Lagrange(k,n,x,z)
    y=1;
    for p=1:n
        if(p~=k)
            y=y*(x-z(p));
        end
    end
end



