%********************************************************************
% This program calculates the temperature distribution as a function
% of time inside a rod whose two ends are maintained at constant 
% temperature. The curved surface may/may not be insulated. 
%********************************************************************
 
L = 0.5;               
k = 0.01;
K = 385; c = 385; rho = 8960;

 
%********************************************************************
%L is the length of the rod, R is its radius, H is the heat transfer
%constant, K is thermal conductivit, c is specific heat, rho is mass
%density, all in SI unit for a copper rod.
%********************************************************************
 
a=K/(c*rho);
M=101;
h=L/(M-1);

r=a*k/(h^2);
T0=0;
x=0:h:L;
u(1:M,1)=800*x.*(L-x)/L^2+T0;
 
%********************************************************************
% M is the number of discretization points alog the rod, beta and
%gamma concern heat loss due to diffusion and radiation respectively.
% Setting beta and gamma to zero insulates the curved surface of the
% rod. h is the step size of discretization. u(1:M,1) fixes the initial 
%temperature profile. T0 is the surrounding temperature.
%********************************************************************
 
epsilon = 10; % epsilon is the tolerance
n=1;
 
%********************************************************************
    
while abs(u(50,n)-T0) > epsilon
   
      u(1,n)= T0; u(M,n)= T0;
    
          for m=2:M-1;
               u(m,n+1)=(1-2*r)*u(m,n) + r*(u(m-1,n)+ u(m+1,n));
          end
    
      n=n+1;
    
         
end

 
%**********************************************************************
% The while and for loop above are used to move the temperature profile
% along the rod (index m) in time(index n) until the temperature becomes
% uniform within a tolerance of 1 degree.
%plot(x,u(:,N-10))
%**********************************************************************
 
T0=k*(n-1)    % T is the total time required for the temperature to become
             % uniform to within one degree. Time is in seconds.
%***********************************************************************
 
n1=fix(n/3);

%subplot(2,2,1)

%plot(x,u(:,1),'r','linewidth',1.5)
%title('T = 0')
%ylim([T0 T0+225])

%subplot(2,2,2)

%plot(x,u(:,n1),'r','linewidth',1.5)
%ylim([T0 T0+225])
%title('T = T0/3')

%subplot(2,2,3)

%plot(x,u(:,2*n1),'r','linewidth',1.5)
%ylim([T0 T0+225])
%title('T = 2T0/3')


%subplot(2,2,4)

%plot(x,u(:,3*n1),'r','linewidth',1.5)
%ylim([T0 T0+225])
%title('T = T0')

y=linspace(0,T0,n);
Z=u';
[X,Y]=meshgrid(x,y);
mesh(X,Y,Z)





