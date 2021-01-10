% Time into steps of 0.05 seconds
k=0.05;

% Potato specifications
K=0.8;
R=0.04;
rho=1070;
c=3390;
a=K/(c*rho);


% Distance from center discretized into 101 points
M=101; N=40001;
h=R/(M-1);
r=a*k/(h^2);
u=zeros(M,N);
x = 0:h:R;


T_boil=100;
% On just dipping the potato in boiling water, the insides will be at 25C while
% boundary is at 100C
u(1:M-1,1)=25;u(M,1)=T_boil;

% Waiting till the center reaches 70C
n=1;
while u(1,n) < 70    
    for m = 2:M-1
        u(m,n+1) = (1-2*r)*u(m,n) + r*((m-2)*u(m-1,n)+m*u(m+1,n))/(m-1);
    end
    % From dirichlet boundary conditions
    u(1,n+1) = u(2,n+1);
    u(M,n+1) = T_boil;
    n=n+1;
end
T_warm =(n-1)*k/60;
disp("Time required for heating the potato in minutes is: "+T_warm);

T_room=25;
n_next=n+1;
u(1:M-1,n_next)=u(1:M-1,n);
u(M,n_next)=T_room;

while (u(1,n_next)>=(T_room + 5))
    for m = 2:M-1
        u(m,n_next+1) = (1-2*r)*u(m,n_next) + r*((m-2)*u(m-1,n_next)+m*u(m+1,n_next))/(m-1);
    end
    % From dirichlet boundary conditions
    u(1,n_next+1) = u(2,n_next+1);
    u(M,n_next+1) = T_room;

    n_next = n_next +1;
end
T_cool = k*(n_next-n-1)/60;
disp("Time required for cooling the potato in minutes is: "+T_cool);

subplot(2,2,1)
hold on
for i=4001:4000:n
plot(x,u(:,i),'linewidth',1.5)
end
plot(x,u(:,n),'linewidth',1.5)
title('Heating Phase')
xlabel('Distance from center')
ylabel('Temperature')
grid on
hold off

subplot(2,2,2)
hold on
for i=n+1000:7000:n_next
plot(x,u(:,i),'linewidth',1.5)
end
plot(x,u(:,n_next),'linewidth',1.5)
title('Cooling Phase')
xlabel('Distance from center')
ylabel('Temperature')
grid on
hold off

subplot(2,2,3)
plot(u(1,:),'r','linewidth',1.5)
title('Temperature at center vs Time')
xlabel('Time')
ylabel('Temperature')
grid on