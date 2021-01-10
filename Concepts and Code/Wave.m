%**************************************************************************
% This program is about wave motion in a string with both ends fixed. The
% initial pulse is set moving to the right.
%*************************************************************************
 
T=0.1;mu=0.1;
c=sqrt(T/mu);
L=30;h=0.01;
M=L/h+1;
x=linspace(-L/2,L/2,M);
k=0.01;
a=c*k/h;
 
%************************************************************************
% All the string parameters as well as step size for x (h) and that for t
% (k) are set above. T is the tension and mu is the mass per unit length.
%************************************************************************
 
%u(1,:)=0;u(M,:)=0;
%p=1+(L/2-1)/h;q=1+(L/2+1)/h;
%u(p,1)=0;u(q,1)=0;
%u(p,2)=0;u(q,2)=0;
 
%************************************************************************
% The initial shape of the string, a small pulse at the centre, are fixed
% above.
%************************************************************************
 n1=fix(N/2);
 
 
for n=1:N
    
u(n,1)=exp(-1/(1-x(abs(n-n1))^2));
u(n,2)=u(abs(n-n1),1)*(1+2*k*x(abs(n-n1))/((1-x(abs(n-n1))^2)^2));

end

plot(x,u(:,1))
 
%***********************************************************************
% Initial velocity profile of the string is set above.
%***********************************************************************
 
subplot(3,4,1)
plot(x,u(:,1),'r','linewidth',1)
axis([-L/2 L/2 -0.8 0.8])
 
for i=1:10
T(i)=2.5*i;
N(i)=T(i)/k+1;
u(1,:)=0;u(M,:)=0;
for n=2:N(i)
    for m=2:M-1
        u(m,n+1)=a^2*(u(m+1,n)+u(m-1,n))+2*(1-a^2)*u(m,n)-u(m,n-1);
    end
end
subplot(3,4,i+1)
plot(x,u(:,N(i)),'r')
axis([-L/2 L/2 -0.8 0.8])
end
Wave_Equation.m
You may be offline or with limited connectivity. Try downloading instead.