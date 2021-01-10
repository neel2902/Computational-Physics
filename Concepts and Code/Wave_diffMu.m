%**************************************************************************
% This program is about wave motion in a string with both ends fixed. The
% initial pulse is set moving to the right.
%*************************************************************************
 
T=0.1;mu1=1.0;mu2=3; muhigh=2000;

L=30;h=0.01;
M=L/h+1;
x=linspace(0,L,M);
k=0.01;
M1=fix(M/2)+1;


c=zeros(1,M);
a=zeros(1,M);
for m=1:M
    if(x(m)==3*L/4)
        c(m)=sqrt(T/muhigh);
        a(m)=c(m)*k/h;
    else
        c(m)=sqrt(T/mu1);
        a(m)=c(m)*k/h;
    end
end

% for m=M1+1:M
%     c(m)=sqrt(T/mu2);
%     a(m)=c(m)*k/h;
% end

 
%************************************************************************
% All the string parameters as well as step size for x (h) and that for t
% (k) are set above. T is the tension and mu is the mass per unit length.
%************************************************************************
 
u(1,:)=0;u(M,:)=0;

 
%************************************************************************
% The initial shape of the string, a small pulse at the centre, are fixed
% above.
%************************************************************************
n1=fix(M/4)+1;alpha=600;
 
for n=1:M

if(x(n)==3*L/4)
   u(n,1)=0;
   u(n,2)=0;
else
    u(n,1)=0.5*exp(-alpha*((x(n)-x(n1))^2)/L^2);
    u(n,2)=(2*alpha*k*c(n)/L^2)*(x(n)-x(n1))*u(n,1)+u(n,1);
end
end

 
%***********************************************************************
% Initial velocity profile of the string is set above.
%***********************************************************************
 
T=zeros(1,20);
N=zeros(1,20);
for i=1:20
    
T(i)=15*(i-1);
N(i)=T(i)/k+1;
u(1,:)=0;u(M,:)=0;

for n=2:N(i)
    
    for m=2:M-1
        u(m,n+1)=a(m)^2*(u(m+1,n)+u(m-1,n))+2*(1-a(m)^2)*u(m,n)-u(m,n-1);
    end
    
    %u(M,n+1)=2*a^2*u(M-1,n)+ 2*(1-a^2)*u(M,n)-u(M,n-1);
    
end

subplot(4,5,i)
plot(x,u(:,N(i)),'r','linewidth',1.5)
axis([0 L -1 1])
end