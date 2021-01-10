T=0.1; mu=0.1;
c=sqrt(T/mu);
L=30;h=0.01;
M=L/h+1;
x=linspace(0,L,M);
k=0.01;
a=c*k/h;

u(1,:)=0; u(M,:)=0;
n1=fix(M/2)+1;alpha=600;

for n=1:M
    u(n,1)=0.5*exp(-alpha*((x(n)-x(n1))^2)/L^2);
    u(n,2)=0*(2*alpha*k*c/L^2)*(x(n)-x(n1))*u(n,1)+u(n,1);
end



T=zeros(1,10); N=zeros(1,10);
for i=1:10
    T(i)=3*(i-1);
    N(i)=T(i)/k+1;
    u(1,:)=0; u(M, :)=0;
    
    for n=2:N(i)
        u(1,n+1)=2*a^2*u(2,n)+2*(1-a^2)*u(1,n)-u(1,n-1);
        for m=2:M-1
            u(m,n+1)=a^2*(u(m+1,n)+u(m-1,n))+2*(1-a^2)*u(m,n)-u(m,n-1);
        end
        u(M,n+1)=2*a^2*u(M-1,n)+2*(1-a^2)*u(M,n)-u(M,n-1);
        
    end
    
    subplot(4,3,i);
    plot(x, u(:,N(i)), 'red', 'linewidth', 1.5);
    xlabel("x");
    ylabel("y");
    axis([0 L -1 1]);
end
sgtitle('Time evolution of the wavepulse');