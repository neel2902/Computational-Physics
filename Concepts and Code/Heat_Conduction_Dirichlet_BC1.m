%********************************************************************
% This program calculates the temperature distribution as a function
% of time inside a rod whose two ends are maintained at constant 
% temperature. The curved surface may/may not be insulated. 
%********************************************************************
 
L = 0.5; R = 0.01;               
H = 30; k = 0.1;
K = 385; c = 385; rho = 8960;
sigma=5.67e-08;
 
%********************************************************************
%L is the length of the rod, R is its radius, H is the heat transfer
%constant, K is thermal conductivit, c is specific heat, rho is mass
%density, all in SI unit for a copper rod.
%********************************************************************
 
a=K/(c*rho);
M=101;
h=L/(M-1);
beta=2*H/(c*rho*R);gamma=2*sigma/(c*rho*R);
r=a*k/(h^2);
T0=273;
x=0:h:L;

 
%********************************************************************
% M is the number of discretization points alog the rod, beta and
%gamma concern heat loss due to diffusion and radiation respectively.
% Setting beta and gamma to zero insulates the curved surface of the
% rod. h is the step size of discretization. u(1:M,1) fixes the initial 
%temperature profile. T0 is the surrounding temperature.
%********************************************************************
 
epsilon=1; % epsilon is the tolerance

 
%********************************************************************

u(1:M,1)=5000*x.*(L-x)/L^2+T0;

n1=1;

while abs(u(50,n1)-T0)> epsilon
   
      u(1,n1)=T0;u(M,n1)=T0;
    
          for m=2:M-1;
               u(m,n1+1)=(1-2*r)*u(m,n1)+r*(u(m-1,n1)+ u(m+1,n1));
          end
    
      n1=n1+1;
    
         
end

v(1:M,1)=u(1:M,1);
n2=1;

while abs(v(50,n2)-T0)> epsilon
   
      v(1,n2)=T0;v(M,n2)=T0;
    
          for m=2:M-1;
               v(m,n2+1)=(1-2*r)*v(m,n2)-beta*k*(v(m,n2)-T0)+r*v(m-1,n2)+ ...
               r*v(m+1,n2);
          end
    
      n2=n2+1;
    
         
end

w(1:M,1)=u(1:M,1);
n3=1;

while abs(w(50,n3)-T0)> epsilon
   
      w(1,n3)=T0;w(M,n3)=T0;
    
          for m=2:M-1;
               w(m,n3+1)=(1-2*r)*w(m,n3)- 0*beta*k*(w(m,n3)-T0)+r*w(m-1,n3)+ ...
               r*w(m+1,n3)- gamma*k*w(m,n3)^4;
          end
    
      n3=n3+1;
    
         
end
 
 
%**********************************************************************
% The while and for loop above are used to move the temperature profile
% along the rod (index m) in time(index n) until the temperature becomes
% uniform within a tolerance of 1 degree.
%plot(x,u(:,N-10))
%**********************************************************************
 
T1=k*(n1-1)
T2=k*(n2-1)
T3=k*(n3-1)
n=min([n1 n2 n3]);
m=fix(n/4);


% T is the total time required for the temperature to become
             % uniform to within one degree. Time is in seconds.
%***********************************************************************
 
%u(50,2*m1),v(50,2*m1),w(50,2*m1)



subplot(1,3,1)

plot(x,u(:,m),'r','linewidth',1.5)
hold on
plot(x,v(:,m),'b','linewidth',1.5)
plot(x,w(:,m),'g','linewidth',1.5)
hold off

%ylim([T0 T0+225])


subplot(1,3,2)

plot(x,u(:,2*m),'r','linewidth',1.5)
hold on
plot(x,v(:,2*m),'b','linewidth',1.5)
plot(x,w(:,2*m),'g','linewidth',1.5)
hold off
%ylim([T0 T0+225])

subplot(1,3,3)

plot(x,u(:,4*m),'r','linewidth',1.5)
hold on
plot(x,v(:,4*m),'b','linewidth',1.5)
plot(x,w(:,4*m),'g','linewidth',1.5)
hold off




