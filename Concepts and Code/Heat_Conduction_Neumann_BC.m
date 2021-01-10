%*********************************************************************
% The following is the program that solves one-dimensional heat flow
% in a rod with Neumann BC (Heat flux defined at the ends.). The curved
% surface is insulated. You may remove the insulation and include heat
% loss due to air conduction and radiation.
%*********************************************************************
 
L=0.5;R=0.01;k=0.005;
K=385;c=385;rho=8960;
 
%********************************************************************
%L is the length of the rod, R is its radius, H is the heat transfer
%constant, K is thermal conductivit, c is specific heat, rho is mass
%density, all in SI unit for a copper rod.
%********************************************************************
 
a=K/(c*rho);
M=101;
h=L/(M-1);
r=a*k/(h^2);

x=0:h:L;
Tmid=600;
u(1:M,1)=4*Tmid*x.*(L-x)/L^2;
 
%********************************************************************
% M is the number if discretization points alog the rod, alpha, beta
%and gamma are as defined in the class, h is the step size of discre-
%tization. u(1:M,1) specifies the initial temperature profile. T0 is the
%surrounding temperature.
%********************************************************************
 
epsilon=1; % epsilon is the tolerance
n=1;
 
%********************************************************************
 
while abs(u((M-1)/2,n)-u(1,n))> epsilon
    
    u(1,n+1)=(1-2*r)*u(1,n)+2*r*u(2,n);
    u(M,n+1)=(1-2*r)*u(M,n)+2*r*u(M-1,n);
    
    for m=2:M-1
        
        u(m,n+1)=(1-2*r)*u(m,n)+ r*u(m-1,n)+r*u(m+1,n);
        
    end
    
    n=n+1;
    
end
 
%**********************************************************************
% The while and for loop above are used to move the temperature profile
% along the rod (index m) in time(index n) until the tempertaure becomes
% uniform within a tolerance of 1 degree.
%plot(x,u(:,N-10))
%**********************************************************************
 
T=k*(n-1)    % T is the total time required for the temperature to become
             % uniform to within one degree. Time is in seconds.
%***********************************************************************
 
n1=fix(n/5);

subplot(3,2,1)

plot(x,u(:,1),'r','linewidth',1.5)
title('T = 0')
%ylim([u(1,1) u((M-1)/2,1)])

subplot(3,2,2)

plot(x,u(:,n1),'r','linewidth',1.5)

%ylim([u(1,1) u((M-1)/2,1)])
title('T = T0/5')

subplot(3,2,3)

plot(x,u(:,2*n1),'r','linewidth',1.5)
%ylim([u(1,1) u((M-1)/2,1)])

title('T = 2*T0/5')


subplot(3,2,4)

plot(x,u(:,3*n1),'r','linewidth',1.5)
%ylim([u(1,1) u((M-1)/2,1)])

title('T = 3*T0/5')

subplot(3,2,5)

plot(x,u(:,4*n1),'r','linewidth',1.5)
%ylim([u(1,1) u((M-1)/2,1)])

title('T = 4*T0/5')

subplot(3,2,6)

plot(x,u(:,5*n1),'r','linewidth',1.5)
%ylim([u(1,1) u((M-1)/2,1)])

title('T = T0')

2*Tmid/3


%y=linspace(0,T,n);
%Z=u';
%[X,Y]=meshgrid(x,y);
%mesh(X,Y,Z)
 
%***********************************************************************
% Both final u(x)as function of x, and u(x,t) as function of x & t are
% plotted in the above few steps.
 


