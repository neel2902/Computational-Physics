loop above are used to move the temperature profile
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