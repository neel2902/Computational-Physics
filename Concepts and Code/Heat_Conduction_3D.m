%**********************************************************************
% The following program calculates temperature distribution inside a 
% potato when dipped in boiling water. The potato is initially at room 
% temperature.
%**********************************************************************
 
R=0.04;k=0.05;
K=0.8;c=3390;rho=1070;
a=K/(c*rho);
M=101;N=30001;
h=R/(M-1);
 
%************************************************************************
% R is the radius of the potato, K is its thermal conductivity, c its
% specific heat, and rho its mass density. M is the no. of discretization 
% points along the radial line and N that of time. K=0.05 is each time   
% step.
%************************************************************************
 
alpha=a*k/(h^2);
u0=100;
x=0:h:R;
u=zeros(M,N);
u(1:M-1,1)=25;u(M,1)=u0;
 
%**********************************************************************
% Room temperature is 25 degrees celsius, u0=100 is the temperature of
% the boiling water.
%**********************************************************************
 
for n=1:N-1
    
    for m=2:M-1;
        u(m,n+1)=(1-2*alpha)*u(m,n)+alpha*((m-2)*u(m-1,n)+m*u(m+1,n))/(m-1);
    end
    
    u(1,n+1)=u(2,n+1);u(M,n+1)=u0;
    
end
 
%**********************************************************************
% In the two for loops above, temperature is evolved in r and t.
%**********************************************************************
 
hold on
for i=4001:4000:N
plot(x,u(:,i),'linewidth',1.5)
end
hold off
 
T=k*(N-1)/60
 
%***********************************************************************
% The temperature as a function of r is plotted in 5 equal time instants 
% above.
